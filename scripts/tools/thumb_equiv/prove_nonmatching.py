#!/usr/bin/env python3
"""Prove each src/nonmatching/*.c reconstruction bounded-equivalent to its
asm/*.s byte source, using the Z3 engine in cfg_exec.py (Discussion #149).

For one function:
  target    = JP ROM bytes (the asm byte-source, from fireemblem8.gba/.elf)
  candidate = compiled src/nonmatching/<fn>.o .text (relocations resolved)
Both are lifted from a *shared* symbolic input state; we then check that for
every pair of bounded execution paths the observables agree (return value,
callee-saved regs + sp restored, data memory, and the ordered call/MMIO trace).

Status labels (per rubber-duck review — bounded != unconditional proof):
  PROVEN-BOUNDED(N)  all path pairs equivalent with loops unrolled to N
  DIVERGENCE         a reachable path pair has differing observables under the
                     modular model (external-state havoc can cause this on a
                     faithful reconstruction -> NOT a confirmed reconstruction bug)
  UNKNOWN:<reason>   unsupported insn / path budget / solver unknown

Usage:
  $HOME/z3-venv/bin/python prove_nonmatching.py [fn ...]   # default: all 16
"""

import os
import subprocess
import sys
import time

import z3

import cfg_exec
from cfg_exec import CallOracle, Engine, Fn, LiftError, State, bits

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
GBA = os.path.join(ROOT, "fireemblem8.gba")
ELF = os.path.join(ROOT, "fireemblem8.elf")
NMDIR = os.path.join(ROOT, "src", "nonmatching")
ROM_BASE = 0x08000000
CALLEE_SAVED = list(range(4, 12)) + [13]

_symtab = None


def symtab():
    global _symtab
    if _symtab is None:
        _symtab = {}
        out = subprocess.run(["arm-none-eabi-nm", ELF], capture_output=True, text=True).stdout
        for l in out.splitlines():
            p = l.split()
            if len(p) == 3:
                _symtab[p[2]] = int(p[0], 16)
    return _symtab


def func_vma_size(fn):
    """Return (vma, target_size, candidate_size). Non-matching functions differ
    in length, so the target size comes from assembling asm/<fn>.s (the true JP
    byte extent incl. literal pool) and the candidate size from its .o .text."""
    vma = int(fn.replace("sub_", ""), 16)
    o = os.path.join(NMDIR, fn + ".o")
    csize = _text_size(o)
    # assemble the committed asm byte-source to get the true target extent
    asm = os.path.join(ROOT, "asm", fn + ".s")
    tsize = None
    if os.path.exists(asm):
        os.makedirs("/tmp/thumb_equiv", exist_ok=True)
        to = f"/tmp/thumb_equiv/{fn}.tgt.o"
        r = subprocess.run(["arm-none-eabi-as", "-mthumb", "-mcpu=arm7tdmi",
                            asm, "-o", to], capture_output=True, text=True)
        if r.returncode == 0:
            tsize = _text_size(to)
    if tsize is None:
        tsize = csize
    return vma, tsize, csize


def _text_size(obj):
    """Size (bytes) of the code section of an object (.text or .text.sub_*)."""
    h = subprocess.run(["arm-none-eabi-objdump", "-h", obj],
                       capture_output=True, text=True).stdout
    size = 0
    import re
    for l in h.splitlines():
        m = re.search(r"\s\d+\s+(\.text\S*)\s+([0-9a-f]{8})", l)
        if m:
            size = max(size, int(m.group(2), 16))
    return size


def target_bytes_callmap(vma, size):
    data = open(GBA, "rb").read()
    code = data[vma - ROM_BASE:vma - ROM_BASE + size]
    dis = subprocess.run(["arm-none-eabi-objdump", "-d", ELF,
                          f"--start-address={vma}", f"--stop-address={vma+size}"],
                         capture_output=True, text=True).stdout
    callmap = {}
    import re
    for l in dis.splitlines():
        m = re.match(r"\s*([0-9a-f]+):\s+[0-9a-f ]+\s+(bl|blx)\s+([0-9a-f]+)\s+<([^>+]+)", l)
        if m:
            site = int(m.group(1), 16)
            taddr = int(m.group(3), 16)
            name = m.group(4)
            callmap[site] = name if name.startswith("_call_via_") else taddr
    return code, callmap


def _resolve_sym(sym):
    """Resolve a call-target symbol to a canonical address (int), or a veneer
    marker string. Handles friendly names (via ELF nm), sub_XXXX / gUnk_XXXX
    (address encoded in the name)."""
    if sym.startswith("_call_via_"):
        return sym
    st = symtab()
    if sym in st:
        return st[sym]
    import re
    m = re.fullmatch(r"(?:sub_|j_sub_|nullsub_|loc_|j_)?([0-9A-Fa-f]{5,8})", sym)
    if m:
        try:
            return int(m.group(1), 16)
        except ValueError:
            pass
    # names that embed a full ROM/RAM address (e.g. gUnk_02014EF0, off_80D1234)
    m = re.search(r"_((?:08|02|03)[0-9A-Fa-f]{6})$", sym)
    if m:
        return int(m.group(1), 16)
    return sym  # unresolved (compared by name, both sides)


def candidate_bytes_callmap(fn, vma, size):
    o = os.path.join(NMDIR, fn + ".o")
    binp = f"/tmp/thumb_equiv/{fn}.text.bin"
    os.makedirs("/tmp/thumb_equiv", exist_ok=True)
    subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", "--only-section=.text",
                    o, binp], check=True)
    code = bytearray(open(binp, "rb").read())
    st = symtab()
    callmap = {}
    rel = subprocess.run(["arm-none-eabi-readelf", "-W", "-r", o], capture_output=True, text=True).stdout
    section = None
    import re
    for l in rel.splitlines():
        if "relocation section" in l.lower():
            section = ".text" if ".text" in l and ".debug" not in l else None
            continue
        m = re.match(r"^([0-9a-f]{8})\s+[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(\S+)", l)
        if m and section == ".text":
            off = int(m.group(1), 16); rtype = m.group(2); sym = m.group(4)
            addr = vma + off
            if "CALL" in rtype or "JUMP" in rtype:
                callmap[addr] = _resolve_sym(sym)
            elif "ABS32" in rtype:
                rv = _resolve_sym(sym)
                if isinstance(rv, int):
                    code[off:off+4] = rv.to_bytes(4, "little")
    return bytes(code[:size]), callmap


def shared_init():
    regs = {i: z3.BitVec(f"r{i}_in", 32) for i in range(16)}
    data = z3.Array("data_in", z3.BitVecSort(32), z3.BitVecSort(8))
    stack = z3.Array("stack_in", z3.BitVecSort(32), z3.BitVecSort(8))
    flags = {f: z3.BitVec(f"{f}_in", 1) for f in "NZCV"}
    return regs, data, stack, flags


def mk_state(regs, data, stack, flags):
    return State(dict(regs), dict(flags), data, stack, [], [], [], {})


_arg_cache = {}


def _reg_rw(hw):
    """(reads, writes, kind) over r-registers for a data insn; kind in
    {'normal','return'}; None for branch/call/unknown. WRITES are UNDER-reported
    when unsure (safe): a dropped arg is always provably dead."""
    t5, t4, t6, t3 = bits(hw,15,11), bits(hw,15,12), bits(hw,15,10), bits(hw,15,13)
    if t5 in (0b11110, 0b11111) or t4 == 0b1101 or t5 == 0b11100:
        return None                                  # bl / branches
    if t5 == 0b00011:                                # add/sub reg/imm3
        I, rn, rs, rd = bits(hw,10,10), bits(hw,8,6), bits(hw,5,3), bits(hw,2,0)
        return (({rs} if I else {rs, rn}), {rd}, 'normal')
    if t3 == 0b000:                                  # shift imm
        return ({bits(hw,5,3)}, {bits(hw,2,0)}, 'normal')
    if t3 == 0b001:                                  # mov/cmp/add/sub imm8
        op, rd = bits(hw,12,11), bits(hw,10,8)
        if op == 0: return (set(), {rd}, 'normal')
        if op == 1: return ({rd}, set(), 'normal')
        return ({rd}, {rd}, 'normal')
    if t6 == 0b010000:                               # ALU
        op, rs, rd = bits(hw,9,6), bits(hw,5,3), bits(hw,2,0)
        if op in (0x8, 0xA, 0xB): return ({rd, rs}, set(), 'normal')   # tst/cmp/cmn
        if op in (0x9, 0xF): return ({rs}, {rd}, 'normal')             # neg/mvn
        return ({rd, rs}, {rd}, 'normal')
    if t6 == 0b010001:                               # hi-reg / bx
        op, h1, h2 = bits(hw,9,8), bits(hw,7,7), bits(hw,6,6)
        rs = bits(hw,5,3) | (h2<<3); rd = bits(hw,2,0) | (h1<<3)
        if op == 3: return ({rs}, set(), 'return')           # bx (reads target reg)
        if op == 2: return ({rs}, {rd}, 'normal')
        if op == 0: return ({rd, rs}, {rd}, 'normal')
        return ({rd, rs}, set(), 'normal')                   # cmp
    if t5 == 0b01001:                                # pc-rel load
        return (set(), {bits(hw,10,8)}, 'normal')
    if t4 == 0b0101:                                 # load/store reg offset
        ro, rb, rd = bits(hw,8,6), bits(hw,5,3), bits(hw,2,0)
        L = bits(hw,11,11) if bits(hw,9,9) == 0 else (1 if bits(hw,11,11) else (0 if bits(hw,10,10)==0 else 1))
        if L: return ({rb, ro}, {rd}, 'normal')
        return ({rd, rb, ro}, set(), 'normal')
    if t3 == 0b011 or t4 == 0b1000:                  # load/store imm word/byte/half
        L, rb, rd = bits(hw,11,11), bits(hw,5,3), bits(hw,2,0)
        if L: return ({rb}, {rd}, 'normal')
        return ({rd, rb}, set(), 'normal')
    if t4 == 0b1001:                                 # sp-rel load/store
        L, rd = bits(hw,11,11), bits(hw,10,8)
        return ((set(), {rd}, 'normal') if L else ({rd}, set(), 'normal'))
    if t4 == 0b1010:                                 # load address
        return (set(), {bits(hw,10,8)}, 'normal')
    if bits(hw,15,8) == 0b10110000:                  # add sp
        return (set(), set(), 'normal')
    if t4 == 0b1011 and bits(hw,10,9) == 0b10:       # push/pop
        L, Rb = bits(hw,11,11), bits(hw,8,8)
        rlist = {i for i in range(8) if (hw>>i)&1}
        if not L: return (rlist, set(), 'normal')
        if Rb: return (set(), rlist, 'return')       # pop {..,pc}
        return (set(), rlist, 'normal')
    if t4 == 0b1100:                                 # ldmia/stmia
        L, rb = bits(hw,11,11), bits(hw,10,8)
        rlist = {i for i in range(8) if (hw>>i)&1}
        if L: return ({rb}, rlist | {rb}, 'normal')
        return (rlist | {rb}, {rb}, 'normal')
    return None


def _decode_liveness(rom, addr):
    """(reads, writes, kind, successors, call_target) for the r0-r3 liveness scan;
    None if the instruction is unrecognised (caller keeps all args). call_target
    is the resolved `bl` destination address (for interprocedural narrowing) or
    None."""
    off = addr - 0x08000000
    if off < 0 or off + 2 > len(rom):
        return None
    hw = int.from_bytes(rom[off:off+2], "little")
    t5, t4, t6 = bits(hw,15,11), bits(hw,15,12), bits(hw,15,10)
    if t5 in (0b11110, 0b11111):                     # bl (call) — decode target
        tgt = None
        if off + 4 <= len(rom):
            h2 = int.from_bytes(rom[off+2:off+4], "little")
            if bits(h2,15,11) in (0b11111, 0b11101):
                offhi = bits(hw, 10, 0)
                if offhi & 0x400:
                    offhi -= 0x800
                tgt = (addr + 4 + (offhi << 12) + (bits(h2,10,0) << 1)) & 0xFFFFFFFF
        return (set(), set(), 'call', [addr + 4], tgt)
    if t4 == 0b1101:                                 # conditional branch
        cc = bits(hw, 11, 8)
        if cc >= 0b1110:
            return None                              # swi (BIOS call) / undef -> conservative
        o = bits(hw, 7, 0); o = o - 256 if o >= 128 else o
        return (set(), set(), 'branch', [addr + 4 + o * 2, addr + 2], None)
    if t5 == 0b11100:                                # unconditional branch
        o = bits(hw, 10, 0); o = o - 2048 if o >= 1024 else o
        return (set(), set(), 'branch', [addr + 4 + o * 2], None)
    rw = _reg_rw(hw)
    if rw is None:
        return None
    reads, writes, kind = rw
    return (reads, writes, kind, [] if kind == 'return' else [addr + 2], None)


def callee_arg_regs(rom, entry, _visiting=None, _depth=0):
    """Sound over-approximation of which of r0-r3 a callee reads as inputs.
    Full-CFG read-before-write over (addr, written-set) states (finite lattice ->
    terminates). Interprocedural: a `bl T` only consumes T's own argument
    registers (recursively), not all of r0-r3. Returns {0,1,2,3} when the callee
    can't be fully/soundly analysed (unknown insn, state/recursion budget, cycle)."""
    if not isinstance(entry, int):
        return {0, 1, 2, 3}
    entry &= ~1
    if entry in _arg_cache:
        return _arg_cache[entry]
    if _visiting is None:
        _visiting = set()
    if entry in _visiting or _depth > 12:
        return {0, 1, 2, 3}                          # recursion cycle/too deep -> conservative
    _visiting = _visiting | {entry}
    args, seen, stack, steps = set(), set(), [(entry, frozenset())], 0
    complete = True
    while stack:
        addr, written = stack.pop()
        if (addr, written) in seen:
            continue
        seen.add((addr, written))
        steps += 1
        if steps > 8000:
            complete = False; break
        d = _decode_liveness(rom, addr)
        if d is None:
            complete = False; break
        reads, writes, kind, succs, ctgt = d
        for r in reads:
            if r in (0, 1, 2, 3) and r not in written:
                args.add(r)
        nw = set(written) | {r for r in writes if r in (0, 1, 2, 3)}
        if kind == 'call':
            sub = callee_arg_regs(rom, ctgt, _visiting, _depth + 1) if ctgt else {0, 1, 2, 3}
            for r in sub:
                if r in (0, 1, 2, 3) and r not in nw:
                    args.add(r)
            nw |= {0, 1, 2, 3}                        # r0-r3 clobbered by the call
        if len(args) == 4:
            break                                    # all args live; nothing to drop
        if kind == 'return':
            continue
        for s in succs:
            stack.append((s, frozenset(nw)))
    res = args if complete else {0, 1, 2, 3}
    if complete:                                     # only cache fully-analysed results
        _arg_cache[entry] = res
    return res


def obs_differ(a, b):
    rom = rom_image()
    terms = []
    terms.append(a.regs[0] != b.regs[0])
    for r in CALLEE_SAVED:
        terms.append(a.regs[r] != b.regs[r])
    terms.append(a.data != b.data)
    # call trace
    if len(a.calls) != len(b.calls):
        return z3.BoolVal(True)
    for ca, cb in zip(a.calls, b.calls):
        ta, tb = ca["target"], cb["target"]
        # Normalise a call target to an address bit-vector (direct int address or
        # an indirect pointer). Two calls hit the same callee iff their target
        # addresses match modulo the Thumb bit (a direct `bl F` and an indirect
        # `bx &F` are the same call). Unresolved string symbols must match by name.
        def _addr(t):
            if isinstance(t, tuple):
                return ('bv', t[1])
            if isinstance(t, int):
                return ('bv', z3.BitVecVal(t, 32))
            return ('name', t)
        na, nb = _addr(ta), _addr(tb)
        if na[0] == 'name' or nb[0] == 'name':
            if ta != tb:
                return z3.BoolVal(True)
            argset = {0, 1, 2, 3}
        else:
            terms.append((na[1] & ~1) != (nb[1] & ~1))
            ca_addr = None
            for t in (ta, tb):
                if isinstance(t, int):
                    ca_addr = t; break
                if isinstance(t, tuple):
                    sv = z3.simplify(t[1])
                    if z3.is_bv_value(sv):
                        ca_addr = sv.as_long() & ~1; break
            argset = callee_arg_regs(rom, ca_addr) if ca_addr is not None else {0, 1, 2, 3}
        for j in range(4):
            if j in argset:
                terms.append(ca["args"][j] != cb["args"][j])
    # mmio trace
    if len(a.mmio) != len(b.mmio):
        return z3.BoolVal(True)
    for ea, eb in zip(a.mmio, b.mmio):
        if ea[0] != eb[0] or ea[1] != eb[1] or ea[2] != eb[2]:
            return z3.BoolVal(True)
        if ea[0] == "W":
            terms.append(ea[3] != eb[3])
    return z3.Or(*terms)


def _pc(state):
    return z3.And(*state.pc_cond) if state.pc_cond else z3.BoolVal(True)


def _check_product(lt, lc, pre, deadline):
    """General sound check: for every jointly-satisfiable path pair, observables
    must agree. O(Nt*Nc) but each pre-check is cheap boolean; used for small N."""
    s = z3.Solver(); s.set("timeout", 30000)
    for a in lt:
        for b in lc:
            if time.time() > deadline:
                return "UNKNOWN:timeout"
            s.push(); s.add(pre); s.add(_pc(a)); s.add(_pc(b))
            if s.check() != z3.sat:      # incompatible branch directions
                s.pop(); continue
            s.add(obs_differ(a, b))
            r = s.check(); s.pop()
            if r == z3.sat:
                return f"DIVERGENCE@{lt.index(a)},{lc.index(b)}"
            if r == z3.unknown:
                return "UNKNOWN:solver-unknown"
    return None


def _check_indexed(lt, lc, pre, deadline):
    """Fast path for 1:1-CFG functions: pair paths by DFS order, verify the
    correspondence (path conditions coincide) and check observables per pair."""
    s = z3.Solver(); s.set("timeout", 30000)
    for i, (a, b) in enumerate(zip(lt, lc)):
        if time.time() > deadline:
            return "UNKNOWN:timeout"
        Pa, Pb = _pc(a), _pc(b)
        s.push(); s.add(pre); s.add(z3.Xor(Pa, Pb))
        r = s.check(); s.pop()
        if r == z3.sat:
            return f"UNKNOWN:cfg-path-mismatch@{i}"
        if r == z3.unknown:
            return "UNKNOWN:solver-unknown"
        s.push(); s.add(pre); s.add(Pa); s.add(obs_differ(a, b))
        r = s.check(); s.pop()
        if r == z3.sat:
            return f"DIVERGENCE@path{i}"
        if r == z3.unknown:
            return "UNKNOWN:solver-unknown"
    return None


_rom = None


def rom_image():
    global _rom
    if _rom is None:
        _rom = open(GBA, "rb").read()
    return _rom


def prove(fn, loop_bound=3, verbose=True, time_budget=90, product_cap=4000):
    deadline = time.time() + time_budget
    vma, tsize, csize = func_vma_size(fn)
    if not tsize or not csize:
        return "UNKNOWN:no-size"
    tcode, tcall = target_bytes_callmap(vma, tsize)
    ccode, ccall = candidate_bytes_callmap(fn, vma, csize)
    rom = rom_image()
    regs, data, stack, flags = shared_init()
    oracle = CallOracle()
    enum_deadline = min(deadline, time.time() + max(10, time_budget * 0.5))
    try:
        et = Engine(Fn(vma, tcode, tcall, "tgt", rom=rom), oracle, "T", loop_bound=loop_bound, deadline=enum_deadline)
        ec = Engine(Fn(vma, ccode, ccall, "C", rom=rom), oracle, "C", loop_bound=loop_bound, deadline=enum_deadline)
        lt = et.run(mk_state(regs, data, stack, flags), vma)
        lc = ec.run(mk_state(regs, data, stack, flags), vma)
    except LiftError as e:
        return f"UNKNOWN:{e}"
    if not lt or not lc:
        return "UNKNOWN:no-paths"
    if verbose:
        print(f"  paths: target={len(lt)} candidate={len(lc)}  (bytes t={len(tcode)} c={len(ccode)})")
    pre = regs[13] & 7 == 0
    if len(lt) * len(lc) <= product_cap:
        res = _check_product(lt, lc, pre, deadline)
    elif len(lt) == len(lc):
        res = _check_indexed(lt, lc, pre, deadline)
    else:
        return f"UNKNOWN:path-explosion(t={len(lt)},c={len(lc)})"
    if res is not None:
        return res
    return f"PROVEN-BOUNDED({loop_bound})"


def prove_auto(fn, bounds=(1, 2, 3), time_budget=90):
    """Try increasing loop bounds; report the HIGHEST bound that proves
    (standard BMC: a proof holds up to the unroll depth). A bound-1 DIVERGENCE is
    a genuine modular divergence; a divergence only at a deeper bound just caps
    the proven depth, so we return the highest clean PROVEN-BOUNDED(N)."""
    best_proven = None
    for lb in bounds:
        r = prove(fn, loop_bound=lb, verbose=False, time_budget=time_budget)
        if r.startswith("PROVEN"):
            best_proven = r
            continue                      # try to push the bound higher
        if r.startswith("DIVERGENCE"):
            return best_proven or r        # highest clean bound, else the divergence
        # UNKNOWN (path explosion / timeout): higher bounds only get worse
        return best_proven or r
    return best_proven or "UNKNOWN"


def main():
    import glob as _glob
    fns = sys.argv[1:] or [os.path.basename(f)[:-2]
                           for f in sorted(_glob.glob(os.path.join(NMDIR, "sub_*.c")))]
    results = {}
    for fn in fns:
        r = prove_auto(fn)
        results[fn] = r
        print(f"{fn:16} {r}", flush=True)
    print("\n===== SUMMARY =====")
    proven = sum(1 for r in results.values() if r.startswith("PROVEN"))
    for fn, r in sorted(results.items()):
        print(f"  {fn:16} {r}")
    print(f"\nPROVEN: {proven}/{len(results)}")


if __name__ == "__main__":
    main()
