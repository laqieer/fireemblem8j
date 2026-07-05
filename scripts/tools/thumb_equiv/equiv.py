"""Equivalence checking between two lifted THUMB leaf functions (Discussion #149).

Two notions, per the functional-vs-observational taxonomy:

  * ABI-functional equivalence -- the caller-visible *state* effect matches:
      return value (r0[/r1]), callee-saved regs r4-r11 and sp restored to their
      incoming values, and the data memory (globals / pointer-arg targets) equal
      for every address.  Private stack scratch is excluded by construction
      (SP-based accesses use a separate array).  This is what a normal C caller
      relies on under the agbcc/AAPCS calling convention.

  * Observational equivalence -- ABI-functional AND the ordered trace of volatile
      MMIO accesses (reads *and* writes: kind/address/width, and store values)
      matches.  This is the notion macabeus asked about: same architectural
      result but different MMIO behaviour must NOT be accepted.

Neither notion implies cycle-timing equivalence.  Byte-match remains the only
practical guarantee of cycle+MMIO exactness (see docs/equivalence_proving.md).
"""

from __future__ import annotations

import dataclasses

import z3

from thumb_lift import FuncEffect, lift

CALLEE_SAVED = list(range(4, 12)) + [13]  # r4..r11, sp


@dataclasses.dataclass
class Result:
    equivalent: bool
    counterexample: object  # z3 model or None
    detail: str


def _shared_inputs(tag_free_regs=True):
    """Build one shared symbolic input state fed to BOTH functions."""
    regs = {i: z3.BitVec(f"r{i}_in", 32) for i in range(16)}
    data = z3.Array("data_in", z3.BitVecSort(32), z3.BitVecSort(8))
    return regs, data


def _preconditions(regs):
    """Explicit modelling preconditions (rubber-duck review, stack safety)."""
    sp = regs[13]
    return [
        sp & 7 == 0,                      # AAPCS 8-byte stack alignment
    ]


def check(base1, code1, base2, code2, *, returns=("r0",),
          observational=False, extra_pre=None):
    """Prove/refute equivalence of two assembled THUMB leaf functions.

    Returns a Result.  ``equivalent=True`` means Z3 proved it (UNSAT negation);
    ``equivalent=False`` carries a concrete counterexample input state.
    """
    regs, data = _shared_inputs()
    e1 = lift(base1, code1, "a", init_regs=dict(regs), init_data=data)
    e2 = lift(base2, code2, "b", init_regs=dict(regs), init_data=data)

    goals = []

    # return value(s)
    ret_idx = {"r0": 0, "r1": 1}
    for r in returns:
        i = ret_idx[r]
        goals.append(e1.regs[i] == e2.regs[i])

    # callee-saved + sp restored identically (both must equal each other)
    for i in CALLEE_SAVED:
        goals.append(e1.regs[i] == e2.regs[i])

    # data memory equal at every address (extensional array equality)
    goals.append(e1.data_mem == e2.data_mem)

    if observational:
        goals.extend(_trace_equal(e1.trace, e2.trace))

    pre = _preconditions(regs)
    if extra_pre:
        pre += extra_pre

    solver = z3.Solver()
    solver.add(pre)
    solver.add(z3.Not(z3.And(*goals)))
    res = solver.check()
    if res == z3.unsat:
        kind = "observational" if observational else "ABI-functional"
        return Result(True, None, f"PROVEN {kind} equivalent (negation UNSAT)")
    if res == z3.sat:
        return Result(False, solver.model(), "REFUTED: counterexample exists")
    return Result(False, None, f"UNKNOWN: solver returned {res}")


def _trace_equal(t1, t2):
    """Constraints asserting two volatile-MMIO traces are identical."""
    if len(t1) != len(t2):
        # Structural mismatch: force UNSAT-of-equality by asserting False.
        return [z3.BoolVal(False)]
    cons = []
    for a, b in zip(t1, t2):
        if a.kind != b.kind or a.addr != b.addr or a.width != b.width:
            return [z3.BoolVal(False)]
        if a.kind == "W":
            cons.append(a.value == b.value)
        # For reads, matching kind/addr/width/order is the observable; the
        # returned value is a fresh volatile symbol (see thumb_lift caveat).
    return cons


def trace_summary(base, code, tag="t"):
    """Human-readable volatile-access trace for one function (concrete addrs)."""
    e = lift(base, code, tag)
    out = []
    for ev in e.trace:
        v = z3.simplify(ev.value)
        vs = hex(v.as_long()) if z3.is_bv_value(v) else str(v)
        out.append(f"{ev.kind} [{ev.addr:#010x}] w{ev.width} = {vs}")
    return out
