#!/usr/bin/env python3
"""Focused unit tests for the object-extent-bounded ProcCmd relocation audit
(issue #143 follow-up: strict-decode every ROM symbol address, bounded to its
OWN declared `nm -S` size -- never crossing into a neighboring symbol; a
terminal opcode only ends decoding when it truly is the object's last
fitting record; NOLOAD "phantom placement" symbols are never candidates;
genuine same-section split continuations are verified, not guessed).

Uses small synthetic ROM buffers (no toolchain / build artifacts needed) so
missing-relocation, unknown-opcode, non-pointer-opcode-with-nonzero-ptr,
pointer-out-of-range, non-terminating (runaway) decode, unexpected relocation
on a non-pointer field, alias/dedup-by-address, zero-size skipping, NOLOAD
skipping, PROC_JUMP/GOTO/BLOCK/REPEAT-terminated adjacent-array families,
nonterminal truncated objects, verified split-continuation promotion, a
genuinely-broken (unverifiable) truncation, nested aliases, and "prefix
followed by random bytes in the same/different object" cases are all covered
directly against the pure decode/audit/verification functions.
"""
import unittest

import audit_procscr_relocs as p

BASE = 0x08000000


class FakeRom:
    def __init__(self, size=0x10000):
        self.buf = bytearray(size)

    def poke_u16(self, addr, value):
        off = addr - BASE
        if off + 2 > len(self.buf):
            self.buf.extend(b"\x00" * (off + 2 - len(self.buf)))
        self.buf[off:off + 2] = (value & 0xFFFF).to_bytes(2, "little")

    def poke_u32(self, addr, value):
        off = addr - BASE
        if off + 4 > len(self.buf):
            self.buf.extend(b"\x00" * (off + 4 - len(self.buf)))
        self.buf[off:off + 4] = (value & 0xFFFFFFFF).to_bytes(4, "little")

    def bytes(self):
        return bytes(self.buf)


def make_record(rom, addr, opcode, data_imm, data_ptr):
    rom.poke_u16(addr, opcode)
    rom.poke_u16(addr + 2, data_imm)
    rom.poke_u32(addr + 4, data_ptr)


def make_script(rom, addr, records):
    """records: list of (opcode, data_imm, data_ptr). Returns end address."""
    for i, (opcode, data_imm, data_ptr) in enumerate(records):
        make_record(rom, addr + i * p.RECORD_SIZE, opcode, data_imm, data_ptr)
    return addr + len(records) * p.RECORD_SIZE


class OpcodeTableTest(unittest.TestCase):
    def test_pointer_opcodes_match_proc_h(self):
        self.assertEqual(p.POINTER_OPCODES,
                          {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                           0x09, 0x0A, 0x0D, 0x14, 0x16, 0x18})

    def test_non_pointer_opcodes_excluded(self):
        non_pointer = {0x00, 0x0B, 0x0C, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x15, 0x17, 0x19}
        self.assertEqual(non_pointer & p.POINTER_OPCODES, set())
        self.assertTrue(non_pointer <= p.KNOWN_OPCODES)

    def test_terminal_opcodes_set(self):
        # PROC_REPEAT (installs a permanent idleCb that blocks further
        # dispatch), PROC_GOTO (unconditional in-script jump), PROC_JUMP
        # (unconditional cross-script jump), and PROC_BLOCK (unconditionally
        # returns FALSE without ever advancing scrCur) are all confirmed
        # never to fall through under normal script advancement -- see the
        # module docstring's "Terminal opcodes" section for the source/
        # disassembly evidence.
        self.assertEqual(p.TERMINAL_OPCODES, {0x03, 0x0C, 0x0D, 0x10})

    def test_label_and_call_are_not_terminal(self):
        # Confirmed by direct disassembly: PROC_LABEL's handler is the plain
        # ProcCmd_NOP (scrCur += 8; return TRUE) and PROC_CALL's handler
        # (ProcCmd_CALL_ROUTINE) advances scrCur before calling -- both
        # always continue.
        self.assertNotIn(0x0B, p.TERMINAL_OPCODES)
        self.assertNotIn(0x02, p.TERMINAL_OPCODES)


class DecodePrefixCleanTest(unittest.TestCase):
    def test_single_record_script_decodes(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        target = BASE + 0x2000
        end = make_script(rom, addr, [
            (0x01, 0, target),   # PROC_NAME(target)
            (0x03, 0, target),   # PROC_REPEAT(target)
            (0x00, 0, 0),        # PROC_END
        ])
        result = p.decode_prefix(rom.bytes(), addr, end - addr)
        self.assertTrue(result["terminated"])
        self.assertFalse(result["truncated"])
        self.assertEqual(len(result["events"]), 6)
        audit = p.audit_prefix(result["events"], relocs=frozenset())
        self.assertEqual(audit["records"], 3)
        self.assertEqual(audit["slots"], 2)

    def test_null_pointer_field_in_valid_script(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x04, 0, 0), (0x00, 0, 0)])  # PROC_SET_END_CB(NULL)
        result = p.decode_prefix(rom.bytes(), addr, end - addr)
        self.assertTrue(result["terminated"])
        audit = p.audit_prefix(result["events"], relocs=frozenset())
        self.assertEqual(audit["slots"], 0)

    def test_extra_size_beyond_terminator_is_fine(self):
        # decode_prefix may be given a generously-sized bound (e.g. an object
        # containing several concatenated scripts, like data_08601748); it
        # must still stop at the FIRST valid terminator, not consume the rest.
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x04, 0, 0), (0x00, 0, 0)])
        # more (unrelated-looking, still valid) data after the first script's
        # end, all within the SAME generously-sized candidate object:
        make_script(rom, addr + 16, [(0x01, 0, BASE + 0x3000), (0x00, 0, 0)])
        result = p.decode_prefix(rom.bytes(), addr, 32)
        self.assertTrue(result["terminated"])
        self.assertEqual(len(result["events"]), 4)  # only the first script


class DecodePrefixTerminalOpcodeTest(unittest.TestCase):
    """PROC_JUMP/GOTO/BLOCK/REPEAT-terminated adjacent-array families (the
    exact demonstrated bugs: ProcScr_MapAnimPoisonDmg + 8 PROC_JUMP siblings,
    ProcScr_MapAnimBattle-style PROC_GOTO endings, PROC_BLOCK-ending fade
    scripts, and PROC_REPEAT-only carved scripts -- all laid out back-to-back
    with no gap and no trailing PROC_END)."""

    def test_each_terminal_opcode_ends_a_script_with_no_proc_end(self):
        for opcode in sorted(p.TERMINAL_OPCODES):
            with self.subTest(opcode=hex(opcode)):
                rom = FakeRom()
                addr = BASE + 0x1000
                target = BASE + 0x5000 if opcode in p.POINTER_OPCODES else 0
                end = make_script(rom, addr, [
                    (0x02, 0, BASE + 0x2000),  # PROC_CALL
                    (opcode, 0, target),       # terminal opcode, last record
                ])
                result = p.decode_prefix(rom.bytes(), addr, end - addr)
                self.assertTrue(result["terminated"], f"opcode {hex(opcode)} should terminate")
                self.assertFalse(result["truncated"])
                self.assertEqual(len(result["events"]), 4)

    def test_terminal_opcode_mid_object_continues_to_real_proc_end(self):
        # The overwhelmingly common in-tree pattern: PROC_REPEAT(...),
        # PROC_END, -- must NOT stop early at PROC_REPEAT when a real
        # terminator immediately follows within the SAME declared bounds.
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [
            (0x02, 0, BASE + 0x2000),
            (0x03, 0, BASE + 0x3000),  # PROC_REPEAT -- terminal-CAPABLE, but more follows
            (0x00, 0, 0),              # the real terminator
        ])
        result = p.decode_prefix(rom.bytes(), addr, end - addr)
        self.assertTrue(result["terminated"])
        self.assertEqual(len(result["events"]), 6)  # all 3 records consumed

    def test_adjacent_proc_jump_family_never_merges_across_objects(self):
        # Two back-to-back objects, each ending in PROC_JUMP with nothing
        # after it in ITS OWN declared extent -- exactly the demonstrated
        # ProcScr_MapAnimPoisonDmg/EggDmg layout.
        rom = FakeRom()
        first_addr = BASE + 0x1000
        shared_target = BASE + 0x9000
        first_end = make_script(rom, first_addr, [
            (0x02, 0, BASE + 0x2000),
            (0x0D, 0, shared_target),
        ])
        second_addr = first_end  # perfectly adjacent, no gap
        second_end = make_script(rom, second_addr, [
            (0x02, 0, BASE + 0x3000),
            (0x02, 0, BASE + 0x4000),
            (0x0D, 0, shared_target),
        ])

        first = p.decode_prefix(rom.bytes(), first_addr, first_end - first_addr)
        second = p.decode_prefix(rom.bytes(), second_addr, second_end - second_addr)

        self.assertTrue(first["terminated"])
        self.assertEqual(len(first["events"]), 4)  # exactly 2 records, not spilling into `second`
        self.assertTrue(second["terminated"])
        self.assertEqual(len(second["events"]), 6)  # exactly 3 records of its own

        # The old (buggy) unbounded-by-size decode would have merged these
        # into one 5-record chain; find_script_prefixes must report them as
        # two INDEPENDENT prefixes when given their correct sizes.
        addr_sizes = [(first_addr, first_end - first_addr), (second_addr, second_end - second_addr)]
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), addr_sizes)
        self.assertEqual(set(prefixes.keys()), {first_addr, second_addr})
        self.assertEqual(len(prefixes[first_addr]), 4)
        self.assertEqual(len(prefixes[second_addr]), 6)
        self.assertEqual(truncated, {})
        self.assertEqual(splits, [])

    def test_proc_jump_family_followed_by_real_proc_end_script_not_absorbed(self):
        # Mirrors the exact reported shape: a PROC_JUMP-terminated object
        # immediately followed by a DIFFERENT object that legitimately ends
        # in PROC_END (ProcScr_MapBattleInfoBox). The first object's decode
        # must never reach into the second object's PROC_END.
        rom = FakeRom()
        jump_addr = BASE + 0x1000
        jump_end = make_script(rom, jump_addr, [
            (0x02, 0, BASE + 0x2000),
            (0x0D, 0, BASE + 0x9000),
        ])
        end_addr = jump_end
        end_script_end = make_script(rom, end_addr, [
            (0x04, 0, BASE + 0x3000),  # PROC_SET_END_CB
            (0x03, 0, BASE + 0x4000),  # PROC_REPEAT
            (0x00, 0, 0),              # PROC_END
        ])
        addr_sizes = [(jump_addr, jump_end - jump_addr), (end_addr, end_script_end - end_addr)]
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), addr_sizes)
        self.assertEqual(len(prefixes[jump_addr]), 4)   # just its own 2 records
        self.assertEqual(len(prefixes[end_addr]), 6)    # just its own 3 records
        self.assertEqual(truncated, {})


class DecodePrefixTruncationTest(unittest.TestCase):
    """A nonterminal truncated object: the declared size ends right after a
    NON-terminal, non-PROC_END, non-TERMINAL_OPCODES record -- must be
    reported malformed, and must NEVER read past its own declared extent to
    find a terminator elsewhere (unless verified via find_script_prefixes'
    split-continuation check -- see SplitContinuationTest)."""

    def test_nonterminal_truncation_is_malformed_not_extended(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        # Declared size covers only 2 records (16 bytes); the SECOND record
        # is a PROC_CALL (non-terminal) with nothing valid after it within
        # bounds -- even though the ROM buffer physically has more bytes
        # right after (which must NEVER be read).
        make_script(rom, addr, [
            (0x01, 0, BASE + 0x2000),  # PROC_NAME
            (0x02, 0, BASE + 0x3000),  # PROC_CALL -- non-terminal, truncated here
        ])
        # Plant a byte pattern immediately after that WOULD decode as a valid
        # PROC_END if the (buggy) decode were to cross the boundary.
        make_record(rom, addr + 16, 0x00, 0, 0)

        result = p.decode_prefix(rom.bytes(), addr, 16)  # declared size: exactly 2 records
        self.assertFalse(result["terminated"])
        self.assertTrue(result["truncated"])
        self.assertEqual(len(result["events"]), 4)  # only the 2 records within bounds

    def test_truncation_is_reported_via_find_script_prefixes_when_unverifiable(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x01, 0, BASE + 0x2000), (0x02, 0, BASE + 0x3000)])
        make_record(rom, addr + 16, 0x00, 0, 0)  # must not be consumed
        # No other candidate follows, so no split-continuation is possible.
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), [(addr, 16)])
        self.assertEqual(prefixes, {})
        self.assertIn(addr, truncated)
        self.assertEqual(len(truncated[addr]), 4)
        self.assertEqual(splits, [])

    def test_single_record_truncation_is_not_reported_noise(self):
        # min_records=2 applies to truncation reporting too, so a lone
        # non-terminal record cut short (common coincidental byte noise)
        # doesn't pollute the malformed report.
        rom = FakeRom()
        addr = BASE + 0x1000
        make_script(rom, addr, [(0x02, 0, BASE + 0x2000)])  # PROC_CALL, size=8, no room for more
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), [(addr, 8)])
        self.assertEqual(prefixes, {})
        self.assertEqual(truncated, {})


class SplitContinuationTest(unittest.TestCase):
    """Mirrors the exact demonstrated gProcScr_CharacterEndings case: a script
    truncated at its own object's end (non-terminal last record) whose TRUE
    continuation is verified to live in the immediately-following,
    independently-named, same-section candidate object."""

    def test_genuine_split_continuation_is_verified_and_promoted(self):
        rom = FakeRom()
        first_addr = BASE + 0x1000
        first_end = make_script(rom, first_addr, [
            (0x01, 0, BASE + 0x2000),  # PROC_NAME
            (0x02, 0, BASE + 0x3000),  # PROC_CALL -- non-terminal, "truncated" here
        ])
        second_addr = first_end  # perfectly adjacent, no gap (same section)
        second_end = make_script(rom, second_addr, [
            (0x02, 0, BASE + 0x4000),  # the genuine continuation
            (0x00, 0, 0),              # the real terminator
        ])
        addr_sizes = [(first_addr, first_end - first_addr), (second_addr, second_end - second_addr)]
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), addr_sizes)

        self.assertEqual(truncated, {})
        self.assertEqual(splits, [first_addr])
        self.assertIn(first_addr, prefixes)
        self.assertEqual(len(prefixes[first_addr]), 8)  # all 4 records, merged
        # The second object is STILL independently decodable/reported too
        # (it is a genuine, separately-named, self-contained valid script).
        self.assertIn(second_addr, prefixes)

    def test_split_continuation_missing_relocation_still_detected(self):
        # The verification must not hide a real bug: if the continuation's
        # own pointer is unrelocated, it is still reported as missing.
        rom = FakeRom()
        first_addr = BASE + 0x1000
        first_end = make_script(rom, first_addr, [
            (0x01, 0, BASE + 0x2000),
            (0x02, 0, BASE + 0x3000),
        ])
        second_addr = first_end
        target = BASE + 0x4000
        second_end = make_script(rom, second_addr, [
            (0x02, 0, target),
            (0x00, 0, 0),
        ])
        addr_sizes = [(first_addr, first_end - first_addr), (second_addr, second_end - second_addr)]
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), addr_sizes)
        self.assertEqual(splits, [first_addr])

        relocs = frozenset()  # the continuation's PROC_CALL target is NOT relocated
        result = p.audit_prefix(prefixes[first_addr], relocs)
        missing_sources = [m["source"] for m in result["missing"]]
        self.assertIn(second_addr + 4, missing_sources)

    def test_unverifiable_truncation_stays_malformed(self):
        # The extension exists (a following candidate) but its own decode
        # does NOT reach a valid terminator either -- must NOT be silently
        # accepted; remains a genuine malformed truncation.
        rom = FakeRom()
        first_addr = BASE + 0x1000
        first_end = make_script(rom, first_addr, [
            (0x01, 0, BASE + 0x2000),
            (0x02, 0, BASE + 0x3000),
        ])
        second_addr = first_end
        # The "continuation" is itself broken (unknown opcode) -- extending
        # into it must not manufacture a false success.
        second_end = make_script(rom, second_addr, [(0x7F, 0, 0)])
        addr_sizes = [(first_addr, first_end - first_addr), (second_addr, second_end - second_addr)]
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), addr_sizes)
        self.assertEqual(splits, [])
        self.assertIn(first_addr, truncated)
        self.assertNotIn(first_addr, prefixes)


class NoloadTest(unittest.TestCase):
    def test_in_noload_range(self):
        ranges = [(BASE + 0x1000, BASE + 0x1010), (BASE + 0x2000, BASE + 0x2020)]
        self.assertTrue(p.in_noload_range(BASE + 0x1005, ranges))
        self.assertFalse(p.in_noload_range(BASE + 0x1010, ranges))  # end-exclusive
        self.assertFalse(p.in_noload_range(BASE + 0x1800, ranges))
        self.assertTrue(p.in_noload_range(BASE + 0x2000, ranges))

    def test_noload_candidate_that_decodes_cleanly_is_trusted(self):
        # Mirrors ProcScr_efxThunderBG: a NOLOAD-range candidate whose decode
        # terminates validly is still trusted and included as a normal
        # prefix -- NOLOAD alone does not mean "unreadable" (see
        # load_noload_ranges's docstring). Hiding it would have silently
        # dropped a real missing-relocation bug during this exact
        # investigation.
        rom = FakeRom()
        addr = BASE + 0x1000
        target = BASE + 0x2000
        end = make_script(rom, addr, [(0x01, 0, target), (0x00, 0, 0)])
        noload_ranges = [(addr, end)]
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), [(addr, end - addr)], noload_ranges=noload_ranges)
        self.assertIn(addr, prefixes)
        self.assertEqual(truncated, {})
        self.assertEqual(noload_skipped, [])
        # Its pointer is still relocation-audited normally.
        result = p.audit_prefix(prefixes[addr], relocs=frozenset())
        self.assertEqual(len(result["missing"]), 1)

    def test_noload_candidate_that_fails_to_terminate_is_silently_excluded(self):
        # Mirrors gProcScr_GameControl: a NOLOAD-range candidate whose decode
        # does NOT cleanly terminate (its bytes there are not proven
        # reliable) is excluded WITHOUT being reported as malformed -- unlike
        # an equivalent non-NOLOAD truncation, which IS reported.
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [
            (0x01, 0, BASE + 0x2000),
            (0x02, 0, BASE + 0x3000),  # non-terminal, nothing valid follows
        ])
        noload_ranges = [(addr, end)]
        prefixes, truncated, zero_size, noload_skipped, splits, _zsr, _brej = p.find_script_prefixes(
            rom.bytes(), [(addr, end - addr)], noload_ranges=noload_ranges)
        self.assertEqual(prefixes, {})
        self.assertEqual(truncated, {})  # NOT reported as malformed
        self.assertEqual(noload_skipped, [addr])
        self.assertEqual(splits, [])

    def test_noload_section_re_matches_map_format(self):
        line = ".bss_205        0x085b946c      0x3d0\n"
        m = p.NOLOAD_SECTION_RE.match(line)
        self.assertIsNotNone(m)
        self.assertEqual(int(m.group(1), 16), 0x085b946c)
        self.assertEqual(int(m.group(2), 16), 0x3d0)


class DecodePrefixRejectionTest(unittest.TestCase):
    def test_unknown_opcode_rejects(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x7F, 0, 0), (0x00, 0, 0)])
        result = p.decode_prefix(rom.bytes(), addr, end - addr)
        self.assertFalse(result["terminated"])
        self.assertFalse(result["truncated"])

    def test_non_pointer_opcode_nonzero_ptr_rejects(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x0F, 0xA, 0x1234), (0x00, 0, 0)])
        result = p.decode_prefix(rom.bytes(), addr, end - addr)
        self.assertFalse(result["terminated"])
        self.assertFalse(result["truncated"])

    def test_pointer_out_of_range_rejects(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        bogus = 0x02000000  # EWRAM, not a valid ROM pointer
        end = make_script(rom, addr, [(0x01, 0, bogus), (0x00, 0, 0)])
        result = p.decode_prefix(rom.bytes(), addr, end - addr)
        self.assertFalse(result["terminated"])
        self.assertFalse(result["truncated"])

    def test_malformed_proc_end_with_nonzero_dataimm_rejects(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x04, 0, 0), (0x00, 0x5, 0)])
        result = p.decode_prefix(rom.bytes(), addr, end - addr)
        self.assertFalse(result["terminated"])
        self.assertFalse(result["truncated"])

    def test_never_terminating_rejects_without_hanging(self):
        n = p.MAX_RECORDS + 4
        rom = FakeRom(n * p.RECORD_SIZE + 0x100)
        addr = BASE + 0x1000
        for i in range(n):
            make_record(rom, addr + i * p.RECORD_SIZE, 0x02, 0, BASE + 0x2000)  # never terminates
        result = p.decode_prefix(rom.bytes(), addr, n * p.RECORD_SIZE)
        self.assertFalse(result["terminated"])
        self.assertFalse(result["truncated"])

    def test_zero_size_is_never_a_candidate(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        make_record(rom, addr, 0x00, 0, 0)
        result = p.decode_prefix(rom.bytes(), addr, 0)
        self.assertFalse(result["terminated"])
        self.assertFalse(result["truncated"])
        self.assertEqual(result["events"], [])

    def test_negative_size_is_never_a_candidate(self):
        rom = FakeRom()
        result = p.decode_prefix(rom.bytes(), BASE + 0x1000, -8)
        self.assertFalse(result["terminated"])
        self.assertFalse(result["truncated"])


class AuditPrefixMissingRelocationTest(unittest.TestCase):
    def test_unrelocated_pointer_field_is_reported_missing(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        target = BASE + 0x2000
        end = make_script(rom, addr, [
            (0x01, 0, target),   # PROC_NAME(target) -- the exact bug class: a raw
                                  # literal instead of `&sym`, no relocation.
            (0x04, 0, target),   # PROC_SET_END_CB IS relocated
            (0x00, 0, 0),
        ])
        events = p.decode_prefix(rom.bytes(), addr, end - addr)["events"]
        relocs = {addr + 8 + 4}  # only the PROC_SET_END_CB word relocates
        result = p.audit_prefix(events, relocs)

        self.assertEqual(len(result["missing"]), 1)
        miss = result["missing"][0]
        self.assertEqual(miss["source"], addr + 4)
        self.assertEqual(miss["target"], target)
        self.assertEqual(miss["opcode"], 0x01)
        self.assertEqual(result["relocated"], 1)
        self.assertEqual(result["slots"], 2)


class AuditPrefixUnexpectedRelocationTest(unittest.TestCase):
    def test_unexpected_relocation_on_opcode_field(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x00, 0, 0)])
        events = p.decode_prefix(rom.bytes(), addr, end - addr)["events"]
        result = p.audit_prefix(events, relocs={addr})
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-opcode-field", reasons)

    def test_unexpected_relocation_on_null_pointer_field(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x04, 0, 0), (0x00, 0, 0)])
        events = p.decode_prefix(rom.bytes(), addr, end - addr)["events"]
        result = p.audit_prefix(events, relocs={addr + 4})
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-null-ptr", reasons)

    def test_unexpected_relocation_on_non_pointer_opcode(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x0F, 0xA, 0), (0x00, 0, 0)])
        events = p.decode_prefix(rom.bytes(), addr, end - addr)["events"]
        result = p.audit_prefix(events, relocs={addr + 4})
        reasons = [m["reason"] for m in result["malformed"]]
        self.assertIn("unexpected-reloc-non-ptr-opcode", reasons)


class FindScriptPrefixesDedupTest(unittest.TestCase):
    def test_only_valid_addresses_are_returned(self):
        rom = FakeRom()
        good = BASE + 0x1000
        bad = BASE + 0x2000
        good_end = make_script(rom, good, [(0x04, 0, 0), (0x00, 0, 0)])
        rom.poke_u16(bad, 0x7F)  # unknown opcode -> invalid prefix

        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(good, good_end - good), (bad, 8)])
        self.assertEqual(set(prefixes.keys()), {good})
        self.assertEqual(truncated, {})
        self.assertEqual(zsr, [])

    def test_nested_alias_addresses_decoded_once_each(self):
        # Mirrors ProcScr_efxFireOBJ / frontier_df4_banim_a_010_5FF7C8: two nm
        # names sharing one address AND size. The caller (main()) merges
        # names for the same address via load_rom_symbols, so
        # find_script_prefixes only ever sees the address once regardless of
        # how many names map to it.
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x01, 0, BASE + 0x2000), (0x00, 0, 0)])
        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(addr, end - addr)])
        self.assertEqual(len(prefixes), 1)

    def test_zero_size_symbols_are_reported_separately(self):
        rom = FakeRom()
        real = BASE + 0x1000
        real_end = make_script(rom, real, [(0x04, 0, 0), (0x00, 0, 0)])
        zero = BASE + 0x2000
        # zero has no following candidate at all, so even with the backstop
        # enabled there is nothing to bound an extended decode against.
        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(real, real_end - real), (zero, 0)])
        self.assertEqual(set(prefixes.keys()), {real})
        self.assertEqual(zero_size, [zero])
        self.assertEqual(zsr, [])


class ZeroSizeBackstopTest(unittest.TestCase):
    """Covers the zero-size backstop mechanism itself: a zero-size candidate
    is promoted into `prefixes` (and reported in `zero_size_recovered`) ONLY
    if extending its decode up to the next known candidate address(es)
    reaches a valid terminator; otherwise it stays an honest `zero_size`
    report, never silently guessed or unbounded."""

    def test_zero_size_candidate_recovered_when_next_candidate_bounds_it(self):
        rom = FakeRom()
        zero = BASE + 0x1000
        # No declared size, but a real 2-record PROC_END-terminated script
        # sits right there, and there IS a following candidate to bound it.
        script_end = make_script(rom, zero, [(0x04, 0, 0), (0x00, 0, 0)])
        following = script_end  # next candidate begins exactly where this ends
        make_script(rom, following, [(0x00, 0, 0)])

        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(zero, 0), (following, 8)])
        self.assertEqual(zsr, [zero])
        self.assertIn(zero, prefixes)
        self.assertEqual(zero_size, [])

    def test_zero_size_candidate_not_recovered_without_valid_terminator(self):
        rom = FakeRom()
        zero = BASE + 0x1000
        following = BASE + 0x1010
        # Non-terminal opcodes run all the way through `zero` AND `following`
        # without ever hitting PROC_END/a terminal opcode, so even the
        # extended (bounded-to-`following`) decode still never terminates.
        make_record(rom, zero, 0x04, 0, 0)
        make_record(rom, zero + p.RECORD_SIZE, 0x04, 0, 0)
        make_record(rom, following, 0x04, 0, 0)

        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(zero, 0), (following, 8)])
        self.assertEqual(zsr, [])
        self.assertNotIn(zero, prefixes)
        self.assertEqual(zero_size, [zero])

    def test_zero_size_candidate_with_no_following_candidate_stays_unrecovered(self):
        rom = FakeRom()
        zero = BASE + 0x1000
        make_script(rom, zero, [(0x04, 0, 0), (0x00, 0, 0)])
        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(zero, 0)])
        self.assertEqual(zsr, [])
        self.assertEqual(zero_size, [zero])

    def test_zero_size_backstop_can_be_disabled(self):
        rom = FakeRom()
        zero = BASE + 0x1000
        script_end = make_script(rom, zero, [(0x04, 0, 0), (0x00, 0, 0)])
        following = script_end
        make_script(rom, following, [(0x00, 0, 0)])

        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(zero, 0), (following, 8)], verify_zero_size_backstop=False)
        self.assertEqual(zsr, [])
        self.assertEqual(zero_size, [zero])
        self.assertNotIn(zero, prefixes)

    def test_recovered_zero_size_pointers_are_still_relocation_audited(self):
        # The whole point of recovery is that the promoted events go through
        # the SAME audit_prefix relocation check as any other prefix.
        rom = FakeRom()
        zero = BASE + 0x1000
        target = BASE + 0x2000
        script_end = make_script(rom, zero, [(0x01, 0, target), (0x00, 0, 0)])
        following = script_end
        make_script(rom, following, [(0x00, 0, 0)])

        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(zero, 0), (following, 8)])
        self.assertEqual(zsr, [zero])
        result = p.audit_prefix(prefixes[zero], relocs=set())
        self.assertEqual(len(result["missing"]), 1)
        self.assertEqual(result["missing"][0]["source"], zero + 4)
        self.assertEqual(result["missing"][0]["target"], target)


class ZeroSizeBackstopBoundaryRegressionTest(unittest.TestCase):
    """Regression fixtures for the exact real-ROM overreach the independent
    reviewer demonstrated: the zero-size backstop reused the SAME
    multi-hop, full-neighbor-size `extended_bound` as split-continuation and
    reintroduced the cross-object annexation bug through this different
    path. `gProcScr_PhaseIntroUnk` (truly 16 B / 2 records) swallowed the
    ENTIRE following, independently-sized `gProcScr_PhaseIntroText` (72 B)
    into one bogus 88 B / 11-record blob; `gProcScr_ShopFadeIn` (a
    zero-size sub-label inside its enclosing object's own tail) walked
    through the entire following sibling object, annexing 56 B that was
    never its own. The fix: a zero-size candidate's backstop ceiling is
    HARD-bounded at the next nonzero-size candidate's START, never any part
    of its span."""

    def test_phase_intro_unk_shape_stops_exactly_at_sibling_start(self):
        # gProcScr_PhaseIntroUnk-shaped: a zero-size candidate whose TRUE
        # content is exactly 2 records (16 B), immediately followed (no
        # gap) by a SEPARATE, independently nonzero-sized candidate that
        # ALSO happens to be a real, validly-decoding script on its own
        # (gProcScr_PhaseIntroText). The backstop must stop exactly at the
        # sibling's start and must NOT merge the two into one recovery.
        rom = FakeRom()
        zero = BASE + 0x1000
        # Exactly 2 records / 16 B -- terminates cleanly within that window.
        sibling_start = make_script(rom, zero, [(0x04, 0, 0), (0x00, 0, 0)])
        self.assertEqual(sibling_start - zero, 16)
        # The independently-sized sibling: itself a real, validly-decoding
        # 2-record script -- if the backstop wrongly walked through it, the
        # merged decode would report 4 records / 32 B instead of 2 / 16.
        sibling_end = make_script(rom, sibling_start, [(0x04, 0, 0), (0x00, 0, 0)])

        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(zero, 0), (sibling_start, sibling_end - sibling_start)])

        self.assertIn(zero, zsr)
        self.assertEqual(len(prefixes[zero]), 4)  # exactly 2 records (2 events each) -- not 4
        # The sibling is independently, separately decoded/reported too.
        self.assertIn(sibling_start, prefixes)
        self.assertEqual(len(prefixes[sibling_start]), 4)

    def test_shop_fade_in_shape_stays_unrecovered_at_hard_boundary(self):
        # gProcScr_ShopFadeIn-shaped: a zero-size candidate with only a
        # sliver of room (less than one whole 8 B record) before the next
        # nonzero-size candidate's start. It must NOT walk through that
        # candidate to "find" a terminator; it must stay honestly
        # unrecovered.
        rom = FakeRom()
        zero = BASE + 0x1000
        sibling_start = zero + 4  # only 4 B of room -- less than one record
        sibling_end = make_script(rom, sibling_start, [(0x04, 0, 0), (0x00, 0, 0)])

        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(zero, 0), (sibling_start, sibling_end - sibling_start)])

        self.assertNotIn(zero, prefixes)
        self.assertEqual(zsr, [])
        self.assertEqual(zero_size, [zero])
        # The sibling remains correctly, independently decoded.
        self.assertIn(sibling_start, prefixes)

    def test_multiple_consecutive_zero_size_labels_still_stop_at_first_nonzero(self):
        # Several zero-size labels chained together before the real
        # boundary must all be skipped over (they own no bytes), but the
        # FIRST nonzero-size candidate encountered is still the hard,
        # non-crossable ceiling -- confirms `first_nonzero_neighbor` walks
        # PAST zero-size labels without treating any of them as the bound.
        rom = FakeRom()
        zero = BASE + 0x1000
        label_a = zero  # zero-size label #1 (same address as `zero` here)
        label_b = BASE + 0x1004
        label_c = BASE + 0x1008
        sibling_start = make_script(rom, zero, [(0x04, 0, 0), (0x00, 0, 0)])
        sibling_end = make_script(rom, sibling_start, [(0x04, 0, 0), (0x00, 0, 0)])

        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(),
            [(label_a, 0), (label_b, 0), (label_c, 0),
             (sibling_start, sibling_end - sibling_start)])

        self.assertIn(zero, zsr)
        self.assertEqual(len(prefixes[zero]), 4)  # exactly 2 records, not merged with sibling


class BoundaryCrossingAuditTest(unittest.TestCase):
    """The general `crossed_nonzero_objects` safety net applied to
    split-continuation: even if a single-hop extended decode happens to
    terminate validly, if its consumed range crosses into MORE than one
    independently-sized object, the promotion must be rejected (reported in
    `boundary_rejected`), never silently accepted as a genuine continuation."""

    def test_extension_crossing_two_independently_sized_objects_is_rejected(self):
        rom = FakeRom()
        first_addr = BASE + 0x1000
        first_end = make_script(rom, first_addr, [
            (0x01, 0, BASE + 0x2000),
            (0x02, 0, BASE + 0x3000),  # non-terminal -- genuinely truncated
        ])
        # The single sanctioned neighbor `extended_bound` would extend into:
        neighbor_addr = first_end
        # A SECOND, independently-sized candidate nested strictly INSIDE
        # that neighbor's own declared span (e.g. a sub-labeled alias with
        # its own nonzero `nm` size) -- if the extended decode's terminator
        # only appears after this second object's start, the consumed range
        # is annexing two distinct objects, not one verified continuation.
        second_nested_addr = neighbor_addr + 8
        neighbor_size = 24  # covers both the padding record and the real end
        # First record inside the neighbor is itself non-terminal (so decode
        # must continue into where `second_nested_addr` starts) before the
        # real terminator.
        make_record(rom, neighbor_addr, 0x02, 0, BASE + 0x4000)
        make_record(rom, second_nested_addr, 0x00, 0, 0)  # real terminator

        addr_sizes = [
            (first_addr, first_end - first_addr),
            (neighbor_addr, neighbor_size),
            (second_nested_addr, 8),  # nested, nonzero-size candidate
        ]
        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), addr_sizes)

        self.assertEqual(splits, [])
        self.assertIn(first_addr, brej)
        self.assertNotIn(first_addr, prefixes)
        self.assertIn(first_addr, truncated)


class UniquePointerSlotsTest(unittest.TestCase):
    """`unique_pointer_slots` deduplicates pointer-bearing slot events by
    PHYSICAL ROM source address across overlapping/nested prefixes -- e.g. a
    verified split-continuation target that ALSO independently forms its
    own standalone prefix must have its shared bytes counted exactly ONCE
    in the relocation-completeness denominator, never once per prefix."""

    def test_shared_physical_slot_counted_once_across_overlapping_prefixes(self):
        rom = FakeRom()
        first_addr = BASE + 0x1000
        first_end = make_script(rom, first_addr, [
            (0x01, 0, BASE + 0x2000),
            (0x02, 0, BASE + 0x3000),
        ])
        second_addr = first_end
        target = BASE + 0x4000
        second_end = make_script(rom, second_addr, [
            (0x02, 0, target),
            (0x00, 0, 0),
        ])
        addr_sizes = [(first_addr, first_end - first_addr), (second_addr, second_end - second_addr)]
        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), addr_sizes)
        # Both the split-continuation (first_addr) and the standalone
        # (second_addr) prefixes physically include the SAME slot at
        # `second_addr + 4` (the PROC_CALL target `target`).
        self.assertIn(first_addr, prefixes)
        self.assertIn(second_addr, prefixes)

        unique_slots = p.unique_pointer_slots(prefixes)
        # Deduplicated by physical address: exactly ONE entry for
        # `second_addr + 4`, regardless of how many prefixes touch it.
        self.assertEqual(unique_slots[second_addr + 4]["target"], target)
        shared_sources = [addr for addr in unique_slots if addr == second_addr + 4]
        self.assertEqual(len(shared_sources), 1)

    def test_null_pointer_slots_reported_separately_from_non_null(self):
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [
            (0x01, 0, BASE + 0x2000),  # non-null pointer-bearing
            (0x01, 0, 0),              # null pointer-bearing
            (0x00, 0, 0),
        ])
        prefixes, truncated, zero_size, noload_skipped, splits, zsr, brej = p.find_script_prefixes(
            rom.bytes(), [(addr, end - addr)])
        non_null = p.unique_pointer_slots(prefixes)
        null_only = p.unique_pointer_slots(prefixes, want_null=True)
        self.assertEqual(len(non_null), 1)
        self.assertEqual(len(null_only), 1)
        self.assertNotEqual(set(non_null), set(null_only))


class ParseNmSOutputTest(unittest.TestCase):
    """Direct, text-level regression tests for the `nm -S` line-shape parser
    (the actual bug: an earlier `len(parts) < 4: continue` silently dropped
    every 3-field zero-size line before it ever reached the zero-size
    bucket). These feed realistic `nm -S` text strings straight through
    `parse_nm_s_output`, not pre-built tuples, so they would have caught the
    real defect."""

    def test_four_field_sized_line_is_parsed_with_its_size(self):
        text = "08001000 00000010 T ProcScr_Example\n"
        out = p.parse_nm_s_output(text)
        self.assertEqual(out[0x08001000], (["ProcScr_Example"], 0x10))

    def test_three_field_zero_size_line_is_parsed_as_size_zero(self):
        text = "08001000 T ProcScr_NoSize\n"
        out = p.parse_nm_s_output(text)
        self.assertEqual(out[0x08001000], (["ProcScr_NoSize"], 0))

    def test_mixed_three_and_four_field_lines_both_captured(self):
        text = (
            "08001000 00000008 T ProcScr_Sized\n"
            "08002000 T ProcScr_ZeroSize\n"
        )
        out = p.parse_nm_s_output(text)
        self.assertEqual(set(out.keys()), {0x08001000, 0x08002000})
        self.assertEqual(out[0x08001000][1], 0x8)
        self.assertEqual(out[0x08002000][1], 0)

    def test_alias_same_address_names_merge_and_max_size_kept(self):
        text = (
            "08001000 00000008 T ProcScr_A\n"
            "08001000 T ProcScr_B\n"          # zero-size alias, same address
            "08001000 00000010 t ProcScr_C\n"  # larger sized alias
        )
        out = p.parse_nm_s_output(text)
        names, size = out[0x08001000]
        self.assertEqual(names, sorted(["ProcScr_A", "ProcScr_B", "ProcScr_C"]))
        self.assertEqual(size, 0x10)

    def test_malformed_or_unexpected_shape_lines_are_skipped(self):
        text = (
            "         U ProcScr_Undefined\n"  # 2-field undefined symbol
            "08001000 00000008 T ProcScr_Good\n"
            "not a valid nm line at all\n"
            "\n"
        )
        out = p.parse_nm_s_output(text)
        self.assertEqual(set(out.keys()), {0x08001000})

    def test_addresses_outside_rom_range_are_dropped(self):
        text = (
            "02000000 00000008 T IwramThing\n"   # EWRAM, not ROM
            "08001000 00000008 T ProcScr_InRom\n"
        )
        out = p.parse_nm_s_output(text)
        self.assertEqual(set(out.keys()), {0x08001000})

    def test_names_are_sorted_within_an_address(self):
        text = (
            "08001000 00000008 T ZzzName\n"
            "08001000 00000008 t AaaName\n"
        )
        out = p.parse_nm_s_output(text)
        self.assertEqual(out[0x08001000][0], ["AaaName", "ZzzName"])


class VerifyShiftTest(unittest.TestCase):
    def _build_pair(self, shift):
        rom = FakeRom(0x10000)
        addr = BASE + 0x1000
        target = BASE + 0x2000
        end = make_script(rom, addr, [
            (0x01, 0, target),
            (0x0F, 0xA, 0),   # non-pointer opcode: must NOT be checked/shifted
            (0x00, 0, 0),
        ])
        base_bytes = rom.bytes()
        shifted = bytearray(len(base_bytes) + shift)
        shifted[shift:shift + len(base_bytes)] = base_bytes

        def patch_u32(a, value):
            off = (a - BASE) + shift
            shifted[off:off + 4] = (value & 0xFFFFFFFF).to_bytes(4, "little")

        patch_u32(addr + 4, target + shift)
        return base_bytes, bytes(shifted), addr, end - addr

    def test_clean_shift_has_no_mismatches(self):
        shift = 0x40000
        base_bytes, shifted_bytes, addr, size = self._build_pair(shift)
        events = p.decode_prefix(base_bytes, addr, size)["events"]
        checked, mismatches = p.verify_shift(events, base_bytes, shifted_bytes, shift)
        self.assertEqual(checked, 1)
        self.assertEqual(mismatches, [])

    def test_stale_link_is_reported(self):
        shift = 0x40000
        base_bytes, shifted_bytes, addr, size = self._build_pair(shift)
        events = p.decode_prefix(base_bytes, addr, size)["events"]
        mutable = bytearray(shifted_bytes)
        off = (addr + 4 - BASE) + shift
        # Corrupt it back to the UNSHIFTED value -- the exact issue #143 bug:
        # a raw literal that never moved.
        mutable[off:off + 4] = (BASE + 0x2000).to_bytes(4, "little")

        checked, mismatches = p.verify_shift(events, base_bytes, bytes(mutable), shift)
        self.assertEqual(len(mismatches), 1)
        self.assertEqual(mismatches[0]["source"], addr + 4)
        self.assertEqual(mismatches[0]["expected"], BASE + 0x2000 + shift)
        self.assertEqual(mismatches[0]["shifted"], BASE + 0x2000)


if __name__ == "__main__":
    unittest.main()
