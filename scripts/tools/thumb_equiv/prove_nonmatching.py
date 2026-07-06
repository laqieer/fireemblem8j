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
from cfg_exec import CallOracle, Engine, Fn, LiftError, State

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
    rel = subprocess.run(["arm-none-eabi-readelf", "-r", o], capture_output=True, text=True).stdout
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


def obs_differ(a, b):
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
        if isinstance(ta, tuple) and isinstance(tb, tuple):
            terms.append(ta[1] != tb[1])          # indirect: compare pointer value
        elif type(ta) == type(tb) and not isinstance(ta, tuple):
            if ta != tb:                          # int addr or str: must match
                return z3.BoolVal(True)
        else:
            return z3.BoolVal(True)               # kind mismatch (direct vs indirect)
        for x, y in zip(ca["args"], cb["args"]):
            terms.append(x != y)
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
