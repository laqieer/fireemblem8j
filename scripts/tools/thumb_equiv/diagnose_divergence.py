#!/usr/bin/env python3
"""Diagnose WHICH observable term a prove_nonmatching.py DIVERGENCE comes from.

For a function the ARM-vs-ARM prover reports DIVERGENCE on, this isolates the
specific diverging observable (return reg r0, a callee-saved reg, data memory, or a
particular call arg / MMIO event) at a given loop bound + path pair. Used to tell a
*real* inequivalence from a modular-model false-positive (e.g. r0 on a void function,
or a call arg that is a pointer into the function's own stack frame).

Usage:
  $HOME/z3-venv/bin/python scripts/tools/thumb_equiv/diagnose_divergence.py <fn> [bound] [ti] [ci]
Example:
  ... diagnose_divergence.py sub_800A34C 1 0 0
"""
import sys, time, z3, os

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import prove_nonmatching as P


def main():
    fn = sys.argv[1] if len(sys.argv) > 1 else "sub_800A34C"
    lb = int(sys.argv[2]) if len(sys.argv) > 2 else 1
    ti = int(sys.argv[3]) if len(sys.argv) > 3 else 0
    ci = int(sys.argv[4]) if len(sys.argv) > 4 else 0

    vma, tsize, csize = P.func_vma_size(fn)
    tcode, tcall = P.target_bytes_callmap(vma, tsize)
    ccode, ccall = P.candidate_bytes_callmap(fn, vma, tsize)
    rom = P.rom_image()
    regs, data, stack, flags = P.shared_init()
    oracle = P.CallOracle()
    dl = time.time() + 180
    et = P.Engine(P.Fn(vma, tcode, tcall, "tgt", rom=rom), oracle, "T", loop_bound=lb, deadline=dl)
    ec = P.Engine(P.Fn(vma, ccode, ccall, "C", rom=rom), oracle, "C", loop_bound=lb, deadline=dl)
    lt = et.run(P.mk_state(regs, data, stack, flags), vma)
    lc = ec.run(P.mk_state(regs, data, stack, flags), vma)
    print(f"{fn}: paths target={len(lt)} candidate={len(lc)}  (probing pair {ti},{ci} @ bound {lb})")
    if ti >= len(lt) or ci >= len(lc):
        print("  requested path index out of range"); return
    a, b = lt[ti], lc[ci]
    pre = regs[13] & 7 == 0
    s = z3.Solver(); s.set("timeout", 20000)
    s.add(pre); s.add(P._pc(a)); s.add(P._pc(b))
    if s.check() != z3.sat:
        print("  pair not jointly-satisfiable (paths take incompatible branches)"); return

    def probe(name, term):
        s.push(); s.add(term); r = s.check(); s.pop()
        if r == z3.sat:
            print(f"  CAN-DIFFER : {name}")
        elif r == z3.unknown:
            print(f"  ?unknown   : {name}")

    probe("r0 (return reg)", a.regs[0] != b.regs[0])
    for r in P.CALLEE_SAVED:
        probe(f"callee-saved r{r}", a.regs[r] != b.regs[r])
    probe("data-memory", a.data != b.data)
    print(f"  calls: target={len(a.calls)} candidate={len(b.calls)} ; mmio: {len(a.mmio)}/{len(b.mmio)}")
    if len(a.calls) == len(b.calls):
        for i, (ca, cb) in enumerate(zip(a.calls, b.calls)):
            probe(f"call{i}.target ({ca['target']} vs {cb['target']})",
                  z3.BoolVal(str(ca["target"]) != str(cb["target"])))
            for j in range(4):
                probe(f"call{i}.arg{j}", ca["args"][j] != cb["args"][j])
    print("  (only CAN-DIFFER terms are the divergence source; check if each is benign:\n"
          "   r0 on a void fn = not observable; a call arg that is a stack pointer =\n"
          "   frame-layout-sensitive, semantically equal.)")


if __name__ == "__main__":
    main()
