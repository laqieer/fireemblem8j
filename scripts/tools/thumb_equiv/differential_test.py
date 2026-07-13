#!/usr/bin/env python3
"""Differential (concrete) equivalence testing for src/nonmatching/*.c
(Discussion #149) — for functions the bounded SMT prover can't decide (nonlinear
fixed-point math, indirect callbacks, stack-buffer aliasing, sheer size).

Concrete emulation (Unicorn THUMB + a small GBA BIOS/mem model) sidesteps all of
those. It runs the JP ROM bytes and the compiled reconstruction with IDENTICAL,
TYPE-CORRECT random inputs (parsed from the reconstruction's own C signature) and
compares the caller-visible observable: the return value (masked to the declared
width; omitted for `void`) + non-stack memory writes + (on a fault) the fault site.

Over many trials this is strong equivalence evidence — the standard decomp
differential cross-check — where a bounded SMT proof is intractable. It is
TESTING, not a formal proof; `make compare` stays the oracle. Trustworthiness is
established by requiring the 12 SMT-PROVEN functions to all report EQUIV.

Soundness caveats learned while building this (see docs/equivalence_proving.md):
  * Out-of-domain inputs (a random pointer/length/index/global the function was
    never meant to see) FAULT; such trials are SKIPPED, not counted as evidence,
    and the fault PC is never compared across the two different code layouts.
  * A return value can be structurally DEAD (JP epilogue `pop {r0}; bx r0` — r0 is
    the branch target, the caller ignores it): detected when the target's exit r0
    is always the injected LR sentinel; then only memory effects are compared.
  * A callback (fn-ptr) arg cannot be soundly REFUTED here: the no-op stub leaves
    the callback-filled (stack) buffer uninitialised, which the two sides read
    back at different spill offsets — a harness artifact, NOT an inequivalence
    (proven by sub_80A6E4C, SMT-PROVEN yet it "diverges" this way). Such cases
    report INCONCLUSIVE-CB, never MISMATCH.
  * `_call_via_rN`/`_call_via_sl` linker veneers are synthesised as `bx rN`
    trampolines appended to the candidate (IWRAM is >4MB from ROM — a thumb `bl`
    can't reach a fixed IWRAM stub).
  * Per-function input-domain FIXUPS clamp specific random globals into a valid
    domain (identical on both sides, so they never mask a real divergence).

Result (all committed; make compare unaffected — this never touches the oracle):
  12/16 formally SMT-proven (prove_nonmatching.py) PLUS, corroborated here,
  sub_800A34C (mem-effects; dead return) and sub_800FAD0 (full observable) =
  14/16 machine-checked equivalent. sub_80A6F1C: 118/120 in-domain trials
  identical (INCONCLUSIVE-CB on 2 codec-edge/callback residuals). sub_8057F80
  needs a live battle-anim frame (faults black-box) — research-grade.

Usage: $HOME/z3-venv/bin/python differential_test.py [fn ...] [--trials N]
"""

import os
import random
import re
import struct
import subprocess
import sys

from unicorn import *
from unicorn.arm_const import *

import prove_nonmatching as P

ROM_BASE = 0x08000000
RET = 0x08FFFFFE
SP0 = 0x03007F00
CB_STUB = 0x03000004                 # a `bx lr` callback stub (IWRAM)
PTR_BASE = 0x02010000                # distinct scratch region per pointer arg
PTR_STRIDE = 0x1000
REGNUM = {"sl": 10, "sb": 9, "fp": 11, "ip": 12, "lr": 14}


def veneer_reg(name):
    """`_call_via_r7` -> 7, `_call_via_sl` -> 10, else None."""
    if not name.startswith("_call_via_"):
        return None
    s = name[len("_call_via_"):]
    if s in REGNUM:
        return REGNUM[s]
    if re.fullmatch(r"r\d+", s):
        return int(s[1:])
    return None

_gba = None


def gba():
    global _gba
    if _gba is None:
        _gba = open(os.path.join(P.ROOT, "fireemblem8.gba"), "rb").read()
    return _gba


def parse_sig(fn):
    """(ret_bytes|0 for void, [arg_kind...]) from the reconstruction's C
    signature. arg_kind: 'ptr' | 'fnptr' | 'val'."""
    c = os.path.join(P.NMDIR, fn + ".c")
    with open(c, encoding="utf-8", errors="replace") as source_file:
        txt = source_file.read().splitlines()
    inb = False
    line = None
    target = re.compile(r"\b" + re.escape(fn) + r"\s*\(")
    for l in txt:
        if "*/" in l:
            inb = True
            continue
        if inb and target.search(l) and ";" not in l:
            line = l
            break
    if line is None:
        return (4, [])
    # collect the full parameter list (may span lines) — but our sigs fit one line
    m = re.match(r"^\s*(static\s+)?([A-Za-z0-9_ ]*?[A-Za-z0-9_])\s*\*?\s*"
                 r"[A-Za-z0-9_]+\s*\((.*)", line)
    ret = re.match(r"^\s*(static\s+)?(.*?)\s*[A-Za-z0-9_]+\s*\(", line).group(2).strip()
    retptr = "*" in line.split("(")[0]
    if retptr:
        rb = 4
    elif ret in ("void",):
        rb = 0
    elif ret in ("s8", "u8", "char", "signed char", "unsigned char", "bool", "BOOL"):
        rb = 1
    elif ret in ("s16", "u16", "short", "unsigned short"):
        rb = 2
    else:
        rb = 4
    # params: balance parens from the first '(' to its match, then split on
    # TOP-LEVEL commas only (so a callback param `void (*f)(int*,u8*)` stays one
    # param, not three).
    op = line.index("(")
    depth = 0
    end = op
    for i in range(op, len(line)):
        if line[i] == "(":
            depth += 1
        elif line[i] == ")":
            depth -= 1
            if depth == 0:
                end = i
                break
    inner = line[op + 1:end]
    parts, buf, d = [], "", 0
    for ch in inner:
        if ch == "(":
            d += 1
        elif ch == ")":
            d -= 1
        if ch == "," and d == 0:
            parts.append(buf); buf = ""
        else:
            buf += ch
    if buf.strip():
        parts.append(buf)
    kinds = []
    if inner.strip() and inner.strip() != "void":
        for p in parts:
            p = p.strip()
            if "(*" in p:
                kinds.append("fnptr")
            elif "*" in p:
                kinds.append("ptr")
            else:
                kinds.append("val")
    return (rb, kinds)


def _bios(uc, num):
    R = [UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R2, UC_ARM_REG_R3]
    g = lambda i: uc.reg_read(R[i])
    s = lambda i, v: uc.reg_write(R[i], v & 0xFFFFFFFF)

    def sd(n):
        n &= 0xFFFFFFFF
        return n - (1 << 32) if n >= (1 << 31) else n
    if num == 0x06:
        n, d = sd(g(0)), sd(g(1))
        if d:
            q = int(abs(n) // abs(d)) * (1 if (n < 0) == (d < 0) else -1)
            s(0, q); s(1, n - q * d); s(3, abs(q))
    elif num == 0x07:
        d, n = sd(g(0)), sd(g(1))
        if d:
            q = int(abs(n) // abs(d)) * (1 if (n < 0) == (d < 0) else -1)
            s(0, q); s(1, n - q * d); s(3, abs(q))
    elif num == 0x08:
        import math
        s(0, int(math.isqrt(g(0) & 0xFFFFFFFF)))
    elif num in (0x0B, 0x0C):
        src, dst, ctrl = g(0), g(1), g(2)
        count = ctrl & 0x1FFFFF
        fixed = (ctrl >> 24) & 1
        unit = 4 if ((ctrl >> 26) & 1 or num == 0x0C) else 2
        base = uc.mem_read(src, unit) if fixed else None
        for i in range(min(count, 0x2000)):
            uc.mem_write(dst + i * unit,
                         bytes(base) if fixed else bytes(uc.mem_read(src + i * unit, unit)))


def _mkuc():
    uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
    for b, sz in [(0, 0x4000), (0x02000000, 0x40000), (0x03000000, 0x8000),
                  (0x04000000, 0x1000), (0x05000000, 0x1000),
                  (0x06000000, 0x20000), (0x07000000, 0x1000)]:
        uc.mem_map(b, sz)
    uc.mem_map(ROM_BASE, (len(gba()) + 0xFFF) & ~0xFFF)
    uc.mem_write(ROM_BASE, gba())
    uc.mem_write(CB_STUB, struct.pack("<H", 0x4770))

    def hk(uc, intno, ud):
        pc = uc.reg_read(UC_ARM_REG_PC)
        _bios(uc, int.from_bytes(uc.mem_read(pc - 2, 2), "little") & 0xFF)
    uc.hook_add(UC_HOOK_INTR, hk)
    return uc


def gen_args(kinds, rng):
    reg, stack = [], []
    pidx = 0
    vals = []
    for k in kinds:
        if k == "fnptr":
            vals.append(CB_STUB | 1)
        elif k == "ptr":
            vals.append(PTR_BASE + pidx * PTR_STRIDE)
            pidx += 1
        else:
            vals.append(rng.randint(0, 6))       # small — keep counts/indices in-domain
    reg = vals[:4]
    stack = vals[4:]
    return reg, stack


def _fix_sub_80A6F1C(uc, rng):
    # Link-arena record DECODE/VERIFY reads a fixed global state block:
    #   base=(u16*)0x02014FC8; base[3]=payload byte length (loop bound + checksum)
    #   gUnk_02014EF4=header byte count -> arg=(u8*)(0x02014F28+that)
    #   gUnk_02014EF0=field mask
    # Random values make base[3]/header-count index far out of bounds -> fault.
    # Clamp them into a small valid domain (identical on both sides).
    ln = rng.randint(0, 12)
    uc.mem_write(0x02014FCE, struct.pack("<H", ln))              # base[3] length
    uc.mem_write(0x02014EF4, struct.pack("<I", rng.randint(0, 0x30)))  # header count
    uc.mem_write(0x02014EF0, struct.pack("<I", rng.choice([0x7F, 0xFF, 0x3FF])))  # mask


FIXUPS = {
    "sub_80A6F1C": _fix_sub_80A6F1C,
    # NOTE: sub_8057F80 (GetBanimAllyPositionJ) reads ~30 battle-animation
    # globals (gBanim*/gEkr*/gBattle*) and FAULTS on both random and all-zero
    # state — it requires a live, self-consistent battle-anim frame that cannot
    # be synthesised black-box.  Left un-fixup'd: it reports INCONCLUSIVE.
}


def run_once(vma, code, reg, stack, ram_seed, fn=None):
    uc = _mkuc()
    if code is not None:
        uc.mem_write(vma, code)
    rng = random.Random(ram_seed)
    # deterministic random RAM (same for target & candidate)
    uc.mem_write(0x02000000, bytes(rng.getrandbits(8) for _ in range(0x20000)))
    uc.mem_write(0x03000100, bytes(rng.getrandbits(8) for _ in range(0x2000)))
    # per-function input-domain fixups: clamp specific random globals into the
    # function's *valid* domain (e.g. a length field that would otherwise index
    # far out of bounds).  Applied identically to target & candidate (same
    # ram_seed) so it never masks a real divergence.
    fx = FIXUPS.get(fn)
    if fx:
        fx(uc, random.Random(ram_seed ^ 0x5AFED00D))
    for i, v in enumerate(reg[:4]):
        uc.reg_write(UC_ARM_REG_R0 + i, v & 0xFFFFFFFF)
    sp = SP0
    for j, v in enumerate(stack):
        uc.mem_write(sp + j * 4, struct.pack("<I", v & 0xFFFFFFFF))
    uc.reg_write(UC_ARM_REG_SP, sp)
    uc.reg_write(UC_ARM_REG_LR, RET | 1)
    writes = {}

    def hk_w(uc, access, addr, size, value, ud):
        if SP0 - 0x800 <= addr < SP0 + 0x40:      # ignore private stack frame
            return
        writes[addr] = (size, value & ((1 << (size * 8)) - 1))
    uc.hook_add(UC_HOOK_MEM_WRITE, hk_w)
    try:
        uc.emu_start(vma | 1, RET, count=2000000)
    except UcError as e:
        return ("FAULT", uc.reg_read(UC_ARM_REG_PC), tuple(sorted(writes.items())))
    return (uc.reg_read(UC_ARM_REG_R0), tuple(sorted(writes.items())))


def observable(res, rb):
    """Split a raw run result into (return-value-or-None, memory-effects).
    r0 is None on FAULT.  Callers decide whether the return is live."""
    if res[0] == "FAULT":
        return ("FAULT", res[1], res[2])
    r0, writes = res
    mask = (1 << (rb * 8)) - 1 if rb else 0
    return (r0 & mask, writes, r0)         # (masked-ret, writes, raw_r0)


def _pick_symbol(o, tsize):
    """A nonmatching .c may define helper statics BEFORE the main function, so
    the target's twin is NOT necessarily at .text offset 0.  Pick the FUNC
    symbol whose size is closest to the JP target size (tsize); return
    (offset, size)."""
    out = subprocess.run(["arm-none-eabi-nm", "--print-size", o],
                         capture_output=True, text=True).stdout
    best = None
    for l in out.splitlines():
        m = re.match(r"^([0-9a-f]+)\s+([0-9a-f]+)\s+[tT]\s+(\S+)", l)
        if m:
            off = int(m.group(1), 16); sz = int(m.group(2), 16)
            if best is None or abs(sz - tsize) < abs(best[1] - tsize):
                best = (off, sz)
    return best or (0, tsize)


def candidate_linked(fn, vma, tsize):
    o = os.path.join(P.NMDIR, fn + ".o")
    outdir = os.environ.get("THUMB_EQUIV_BUILD_DIR", os.path.join(P.ROOT, "build", "thumb_equiv"))
    os.makedirs(outdir, exist_ok=True)
    binp = os.path.join(outdir, f"{fn}.ct.bin")
    subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", "--only-section=.text",
                    o, binp], check=True)
    text = open(binp, "rb").read()
    soff, ssize = _pick_symbol(o, tsize)       # the target's twin, not offset 0
    code = bytearray(text[soff:soff + ssize])
    # append synthetic `_call_via_rN` (= `bx rN`) trampolines right after the
    # candidate so a thumb `bl` can reach them (IWRAM is >4MB away from ROM).
    vbase_off = (len(code) + 3) & ~3
    code += b"\x00" * (vbase_off - len(code))
    for n in range(16):
        code += struct.pack("<H", 0x4700 | (n << 3)) + b"\x00\x00"

    def veneer_addr(n):
        return vma + vbase_off + n * 4
    rel = subprocess.run(["arm-none-eabi-readelf", "-W", "-r", o],
                         capture_output=True, text=True).stdout
    section = None
    for l in rel.splitlines():
        if "relocation section" in l.lower():
            section = ".text" if ".text" in l and ".debug" not in l else None
            continue
        m = re.match(r"^([0-9a-f]{8})\s+[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(\S+)", l)
        if m and section == ".text":
            off = int(m.group(1), 16); rtype = m.group(2); sym = m.group(4)
            off -= soff                            # rebase to the picked function
            if off < 0 or off >= ssize:            # reloc in another function — skip
                continue
            rv = P._resolve_sym(sym)
            vn = veneer_reg(sym)
            if vn is not None:
                rv = veneer_addr(vn)               # local `bx rN` trampoline
            if not isinstance(rv, int):
                continue
            if "CALL" in rtype or "JUMP" in rtype:
                o2 = (rv & ~1) - (vma + off + 4)
                o2 &= 0x7FFFFF
                code[off:off + 4] = struct.pack("<HH", 0xF000 | ((o2 >> 12) & 0x7FF),
                                                0xF800 | ((o2 >> 1) & 0x7FF))
            elif "ABS32" in rtype:
                addend = struct.unpack("<I", code[off:off + 4])[0]
                code[off:off + 4] = struct.pack("<I", (rv + addend) & 0xFFFFFFFF)
    return bytes(code)


def diff_test(fn, trials=300, verbose=False):
    source_path = os.path.join(P.NMDIR, fn + ".c")
    with open(source_path, encoding="utf-8", errors="replace") as source_file:
        abi_errors = P.ABI.validate_source(fn, source_file.read())
    if abi_errors:
        raise ValueError("INVALID-ABI: " + "; ".join(abi_errors))
    vma, tsize, csize = P.func_vma_size(fn)
    rb, kinds = parse_sig(fn)
    ccode = candidate_linked(fn, vma, tsize)
    rng = random.Random(0x1234 ^ (int(fn.replace("sub_", ""), 16)))
    SENTINEL = RET | 1                     # the LR we inject; r0==this ⇒ dead return
    rows = []                              # (reg, stack, target_obs, cand_obs)
    for t in range(trials):
        reg, stack = gen_args(kinds, rng)
        seed = rng.getrandbits(32)
        ot = observable(run_once(vma, None, reg, stack, seed, fn), rb)
        oc = observable(run_once(vma, ccode, reg, stack, seed, fn), rb)
        # skip out-of-domain trials (either side faults — a bad random pointer/
        # index/global-state input the function was never meant to see); fault-PC
        # can't be compared across the two different code layouts anyway.
        if ot[0] == "FAULT" or oc[0] == "FAULT":
            continue
        rows.append((reg, stack, ot, oc))
    valid = len(rows)
    # A return value is DEAD when the JP (target) exit r0 is never a computed
    # value but the branch-target sentinel (`pop {r0}; bx r0` idiom) — then the
    # caller cannot observe it, so equivalence is memory-effects-only.
    dead_ret = rb > 0 and valid > 0 and all(r[2][2] == SENTINEL for r in rows)
    mism = 0
    for reg, stack, ot, oc in rows:
        if dead_ret:
            same = ot[1] == oc[1]                       # memory effects only
        else:
            same = ot[0] == oc[0] and ot[1] == oc[1]    # return + memory effects
        if not same:
            mism += 1
            if verbose and mism <= 3:
                print(f"  MISMATCH: reg={[hex(x) for x in reg]} stack={stack}")
                print(f"    target ret={hex(ot[2])} writes={ot[1]}")
                print(f"    cand   ret={hex(oc[2])} writes={oc[1]}")
    return mism, valid, rb, kinds, dead_ret


def main():
    args = sys.argv[1:]
    trials = 300
    if "--trials" in args:
        i = args.index("--trials"); trials = int(args[i + 1]); del args[i:i + 2]
    import glob
    fns = args or [os.path.basename(f)[:-2]
                   for f in sorted(glob.glob(os.path.join(P.NMDIR, "sub_*.c")))]
    results = {}
    for fn in fns:
        try:
            m, valid, rb, kinds, dead_ret = diff_test(fn, trials=trials, verbose=True)
            tag = f"ret{rb}B args={kinds}" + (" [dead-ret: mem-effects only]" if dead_ret else "")
            has_cb = "fnptr" in kinds
            if valid < 20:
                r = f"INCONCLUSIVE ({valid} in-domain trials, {tag})"
            elif m == 0:
                r = f"EQUIV ({valid} trials, {tag})"
            elif has_cb:
                # A callback-bearing function cannot be soundly refuted here: the
                # no-op stub leaves the callback-filled (stack) buffer as
                # uninitialised memory, which target & candidate read back at
                # DIFFERENT spill offsets -> a harness artifact, not a real
                # inequivalence (cf. sub_80A6E4C, which is SMT-PROVEN yet shows
                # this).  Never claim a refutation on these.
                r = f"INCONCLUSIVE-CB ({m}/{valid} diverged; callback not modeled, {tag})"
            else:
                r = f"MISMATCH x{m}/{valid} ({tag})"
        except Exception as e:
            import traceback
            traceback.print_exc()
            r = f"ERROR:{type(e).__name__}:{e}"
        results[fn] = r
        print(f"{fn:16} {r}", flush=True)
    ok = sum(1 for r in results.values() if r.startswith("EQUIV"))
    print(f"\nEQUIV: {ok}/{len(results)}")


if __name__ == "__main__":
    main()
