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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
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

        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
            rom.bytes(), [(good, good_end - good), (bad, 8)])
        self.assertEqual(set(prefixes.keys()), {good})
        self.assertEqual(truncated, {})

    def test_nested_alias_addresses_decoded_once_each(self):
        # Mirrors ProcScr_efxFireOBJ / frontier_df4_banim_a_010_5FF7C8: two nm
        # names sharing one address AND size. The caller (main()) merges
        # names for the same address via load_rom_symbols, so
        # find_script_prefixes only ever sees the address once regardless of
        # how many names map to it.
        rom = FakeRom()
        addr = BASE + 0x1000
        end = make_script(rom, addr, [(0x01, 0, BASE + 0x2000), (0x00, 0, 0)])
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
            rom.bytes(), [(addr, end - addr)])
        self.assertEqual(len(prefixes), 1)

    def test_zero_size_symbols_are_reported_separately(self):
        rom = FakeRom()
        real = BASE + 0x1000
        real_end = make_script(rom, real, [(0x04, 0, 0), (0x00, 0, 0)])
        zero = BASE + 0x2000
        prefixes, truncated, zero_size, noload_skipped, splits = p.find_script_prefixes(
            rom.bytes(), [(real, real_end - real), (zero, 0)])
        self.assertEqual(set(prefixes.keys()), {real})
        self.assertEqual(zero_size, [zero])


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
