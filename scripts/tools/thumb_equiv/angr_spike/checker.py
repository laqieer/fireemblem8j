#!/usr/bin/env python3
"""Minimal angr/claripy relational checker used only for the FE8J angr spike.

This is intentionally conservative. Unsupported effects become UNKNOWN rather
than PROVEN: symbolic-address memory, unmodelled non-stack writes, and callees
that may write memory/havoc are hard diagnostics for this spike.
"""
from __future__ import annotations

import logging
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import angr
import claripy

logging.getLogger("angr").setLevel(logging.ERROR)

RET_SENTINEL = 0x0EF00000
STACK_BASE = 0x07000000
STACK_LO = STACK_BASE - 0x10000
STACK_HI = STACK_BASE + 0x10000
OBS_REGS = [0, 4, 5, 6, 7, 8, 9, 10, 11, 13]
REG_NAMES = {0: "r0", 1: "r1", 2: "r2", 3: "r3", 4: "r4", 5: "r5", 6: "r6", 7: "r7", 8: "r8", 9: "r9", 10: "r10", 11: "r11", 13: "sp"}


@dataclass
class Program:
    name: str
    path: Path
    base: int = 0x1000
    entry: int = 0x1001
    externals: dict[str, int] | None = None


@dataclass
class Final:
    state: angr.SimState
    trace: list[tuple[Any, tuple[Any, ...]]]


@dataclass
class CheckResult:
    verdict: str
    reason: str
    finals_left: int = 0
    finals_right: int = 0
    model: dict[str, int] | None = None


class SharedOracle:
    def __init__(self):
        self._cache: dict[tuple[Any, tuple[str, ...]], Any] = {}
        self._next = 0

    def get(self, target: Any, args: tuple[Any, ...]):
        key = (target, tuple(map(str, args)))
        if key not in self._cache:
            self._cache[key] = claripy.BVS(f"call_ret_{self._next}", 32)
            self._next += 1
        return self._cache[key]


class ReturnSink(angr.SimProcedure):
    NO_RET = True

    def run(self):
        self.state.globals["returned"] = True
        self.exit(0)


class ExternalCall(angr.SimProcedure):
    NO_RET = False

    def run(self, target_identity=None, oracle=None, havoc=False):
        args = tuple(getattr(self.state.regs, f"r{i}") for i in range(4))
        
        if "call_trace" not in self.state.globals:
            self.state.globals["call_trace"] = []
        self.state.globals["call_trace"].append((target_identity, args))
        if havoc:
            self.state.globals["unknown"] = f"callee {target_identity} may write/havoc memory"
        self.state.regs.r0 = oracle.get(target_identity, args)
        return self.state.regs.r0


def _reg(state, reg: int):
    return getattr(state.regs, REG_NAMES[reg])


def _is_concrete_stack_addr(state, expr) -> bool:
    if state.solver.symbolic(expr):
        return False
    val = state.solver.eval(expr)
    return STACK_LO <= val < STACK_HI


def _install_soundness_hooks(state: angr.SimState):
    def mark_unknown(st, why):
        
        if "unknown" not in st.globals:
            st.globals["unknown"] = why

    def mem_read(st):
        addr = st.inspect.mem_read_address
        if st.solver.symbolic(addr):
            mark_unknown(st, f"symbolic memory read address concretized/used: {addr}")

    def mem_write(st):
        addr = st.inspect.mem_write_address
        if st.solver.symbolic(addr):
            mark_unknown(st, f"symbolic memory write address concretized/used: {addr}")
        elif not _is_concrete_stack_addr(st, addr):
            mark_unknown(st, f"non-stack data write not modelled in spike: 0x{st.solver.eval(addr):08x}")

    def concretize(st):
        expr = getattr(st.inspect, "address_concretization_expr", None)
        if expr is not None and getattr(expr, "symbolic", False):
            mark_unknown(st, f"address concretization on symbolic expression: {expr}")

    state.inspect.b("mem_read", when=angr.BP_BEFORE, action=mem_read)
    state.inspect.b("mem_write", when=angr.BP_BEFORE, action=mem_write)
    state.inspect.b("address_concretization", when=angr.BP_BEFORE, action=concretize)


def _project(program: Program, oracle: SharedOracle, havoc_targets=frozenset()):
    proj = angr.Project(str(program.path), main_opts={"backend": "blob", "arch": "armel", "base_addr": program.base, "entry_point": program.entry}, auto_load_libs=False)
    proj.hook(RET_SENTINEL, ReturnSink())
    proj.hook(RET_SENTINEL + 1, ReturnSink())
    for ident, addr in (program.externals or {}).items():
        proj.hook(addr + 1, ExternalCall(target_identity=ident, oracle=oracle, havoc=ident in havoc_targets), length=2, replace=True)
        proj.hook(addr, ExternalCall(target_identity=ident, oracle=oracle, havoc=ident in havoc_targets), length=2, replace=True)
    return proj


def _state(proj, entry: int, shared_regs: dict[int, Any]):
    opts = {angr.options.SYMBOL_FILL_UNCONSTRAINED_MEMORY, angr.options.SYMBOL_FILL_UNCONSTRAINED_REGISTERS}
    st = proj.factory.blank_state(addr=entry, add_options=opts)
    for i, sym in shared_regs.items():
        setattr(st.regs, REG_NAMES.get(i, f"r{i}"), sym)
    st.regs.sp = claripy.BVV(STACK_BASE, 32)
    st.regs.lr = claripy.BVV(RET_SENTINEL | 1, 32)
    st.regs.pc = claripy.BVV(entry, 32)
    st.regs.itstate = claripy.BVV(0, 32)
    st.globals["call_trace"] = []
    _install_soundness_hooks(st)
    return st


def _collect(program: Program, oracle: SharedOracle, shared_regs, havoc_targets=frozenset(), max_steps=256, max_states=256):
    proj = _project(program, oracle, havoc_targets)
    sim = proj.factory.simgr(_state(proj, program.entry, shared_regs))
    finals: list[Final] = []
    unknowns: list[str] = []
    for _ in range(max_steps):
        for st in sim.deadended:
            if st.globals.get("returned", False):
                if "unknown" in st.globals:
                    unknowns.append(st.globals["unknown"])
                finals.append(Final(st, list(st.globals.get("call_trace", []))))
        sim.stashes["deadended"] = []
        still = []
        for st in sim.active:
            if (st.addr & ~1) == RET_SENTINEL:
                if "unknown" in st.globals:
                    unknowns.append(st.globals["unknown"])
                finals.append(Final(st, list(st.globals.get("call_trace", []))))
            else:
                still.append(st)
        sim.stashes["active"] = still
        if not sim.active:
            break
        if len(sim.active) + len(finals) > max_states:
            return finals, [f"state budget exceeded ({len(sim.active)} active)"]
        sim.step()
        if sim.errored:
            unknowns.extend(str(e.error) for e in sim.errored)
            sim._errored = []
    else:
        unknowns.append("step budget exceeded")
    return finals, unknowns


def _trace_neq(left, right):
    if len(left) != len(right):
        return claripy.true()
    terms = []
    for (lt, la), (rt, ra) in zip(left, right):
        if lt != rt or len(la) != len(ra):
            return claripy.true()
        terms.extend(a != b for a, b in zip(la, ra))
    return claripy.Or(*terms) if terms else claripy.false()


def _model(solver, symbols):
    out = {}
    for name, sym in symbols.items():
        try:
            val = solver.eval(sym, 1)[0]
            out[name] = int(val) if isinstance(val, int) else val.args[0]
        except Exception:
            pass
    return out


def check_equiv(left: Program, right: Program, *, havoc_targets=frozenset(), max_steps=256, max_states=256) -> CheckResult:
    oracle = SharedOracle()
    shared = {i: claripy.BVS(f"r{i}_in", 32) for i in range(12)}
    lf, lu = _collect(left, oracle, shared, havoc_targets, max_steps, max_states)
    rf, ru = _collect(right, oracle, shared, havoc_targets, max_steps, max_states)
    if lu or ru:
        return CheckResult("UNKNOWN", "; ".join(lu + ru), len(lf), len(rf))
    if not lf or not rf:
        return CheckResult("UNKNOWN", "no final states", len(lf), len(rf))

    overlap = 0
    for a in lf:
        for b in rf:
            pair = claripy.Solver()
            constraints = a.state.solver.constraints + b.state.solver.constraints
            if constraints:
                pair.add(*constraints)
            if not pair.satisfiable():
                continue
            overlap += 1
            neqs = [_reg(a.state, r) != _reg(b.state, r) for r in OBS_REGS]
            neqs.append(_trace_neq(a.trace, b.trace))
            pair.add(claripy.Or(*neqs))
            if pair.satisfiable():
                return CheckResult("REFUTE", "overlapping final states differ", len(lf), len(rf), _model(pair, {f"r{i}": shared[i] for i in range(4)}))
    if overlap == 0:
        return CheckResult("UNKNOWN", "no overlapping final path conditions", len(lf), len(rf))
    return CheckResult("PROVE", f"all {overlap} overlapping final-state pairs equivalent", len(lf), len(rf))
