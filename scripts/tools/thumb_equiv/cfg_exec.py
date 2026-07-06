"""Bounded symbolic-equivalence engine for THUMB functions (Discussion #149).

Extends the straight-line PoC (thumb_lift.py) to real functions: full flags,
conditional branches (path forking), bounded loop unrolling, and sound
uninterpreted call summaries. Used by prove_nonmatching.py to prove that a
`src/nonmatching/*.c` reconstruction is equivalent to its `asm/*.s` byte source.

Method: enumerate bounded execution paths of a function from a shared symbolic
input state; each path yields (path_condition, observable). Two functions are
**bounded-equivalent** iff for every pair of paths, their path conditions are
jointly satisfiable only when their observables are equal. Loops are unrolled to
a per-run bound (BMC); results are reported as PROVEN-BOUNDED(N), never
unconditionally "proved" (see docs/equivalence_proving.md + rubber-duck review).

Soundness contract (see the review write-up for detail):
  * Observable = return r0 (+r1), callee-saved r4-r11 & sp restored, data memory,
    and the ordered call/MMIO event trace. Private stack scratch is a separate
    array (no stack/pointer aliasing assumed).
  * Calls: at the k-th call on a path both functions share fresh symbols
    (ret_k, mem_k, clobber_k); the observable includes each call's
    (target, r0-r3), so equivalence is only concluded when the two functions make
    the *same calls with the same arguments in the same order* — then identical
    results follow. `_call_via_rN` veneers are modelled as an indirect call whose
    target is the pointer in rN (so a different veneer register is NOT a diff).
  * Flags at function exit are not required (C ABI); they are tracked because
    conditional branches consume them.
"""

from __future__ import annotations

import dataclasses
import time as _time
from typing import Optional

import z3

WORD = 32
SP, LR, PC = 13, 14, 15
MMIO_LO, MMIO_HI = 0x04000000, 0x05000000


class LiftError(Exception):
    pass


def bits(hw, hi, lo):
    return (hw >> lo) & ((1 << (hi - lo + 1)) - 1)


def sgn(x):
    return z3.Extract(WORD - 1, WORD - 1, x)


class State:
    __slots__ = ("regs", "flags", "data", "stack", "calls", "mmio",
                 "pc_cond", "visits")

    def __init__(self, regs, flags, data, stack, calls, mmio, pc_cond, visits):
        self.regs = regs
        self.flags = flags
        self.data = data
        self.stack = stack
        self.calls = calls      # list of event dicts
        self.mmio = mmio
        self.pc_cond = pc_cond  # list[BoolRef]
        self.visits = visits    # dict addr->count (loop bounding)

    def copy(self):
        return State(dict(self.regs), dict(self.flags), self.data, self.stack,
                     list(self.calls), list(self.mmio), list(self.pc_cond),
                     dict(self.visits))


# Shared call symbols (indexed by call ordinal) — identical for both programs so
# that matching call sequences (same target+args) yield identical effects.
class CallOracle:
    def __init__(self):
        self.ret = {}
        self.mem = {}
        self.clob = {}

    def _mk(self, k):
        if k not in self.ret:
            self.ret[k] = z3.BitVec(f"callret_{k}", WORD)
            self.mem[k] = z3.Array(f"callmem_{k}", z3.BitVecSort(WORD),
                                   z3.BitVecSort(8))
            self.clob[k] = {r: z3.BitVec(f"clob_{k}_{r}", WORD) for r in (1, 2, 3, 12)}
        return k


class Fn:
    """A decoded THUMB function: raw bytes at base_addr + a call-target map.
    `rom`/`rom_base` give the full read-only ROM image so literal pools and ROM
    tables anywhere in cart space resolve to their true constant bytes."""

    def __init__(self, base, code, callmap, name="fn", rom=None, rom_base=0x08000000):
        self.base = base
        self.code = code
        self.callmap = callmap   # instr_addr -> target symbol string
        self.name = name
        self.rom = rom
        self.rom_base = rom_base

    def hw(self, addr):
        off = addr - self.base
        return int.from_bytes(self.code[off:off + 2], "little")

    def word_at(self, addr):
        off = addr - self.base
        return int.from_bytes(self.code[off:off + 4], "little")

    def rom_bytes(self, addr, width):
        if self.rom is not None and self.rom_base <= addr < self.rom_base + len(self.rom):
            o = addr - self.rom_base
            return int.from_bytes(self.rom[o:o + width], "little")
        o = addr - self.base
        return int.from_bytes(self.code[o:o + width], "little")


class Engine:
    def __init__(self, fn: Fn, oracle: CallOracle, tag: str, loop_bound=6,
                 max_paths=8000, deadline=None):
        self.fn = fn
        self.oracle = oracle
        self.tag = tag
        self.loop_bound = loop_bound
        self.max_paths = max_paths
        self.deadline = deadline
        self.leaves = []   # list of State at return
        self.npaths = 0

    # ---------- memory ----------
    def is_stack(self, base_reg):
        return base_reg == SP

    def load(self, st, addr, width, base_reg, signed=False):
        if base_reg is not None and self.is_stack(base_reg):
            v = self._aload(st.stack, addr, width)
        else:
            c = self._const(addr)
            if c is not None and MMIO_LO <= c < MMIO_HI:
                sym = z3.BitVec(f"mmio_{self.tag}_{len(st.mmio)}", width * 8)
                st.mmio.append(("R", c, width, sym))
                v = z3.ZeroExt(WORD - width * 8, sym) if width < 4 else sym
                return v
            if c is not None and 0x08000000 <= c < 0x0A000000:
                # ROM is read-only: serve the true constant bytes, immune to
                # call-memory havoc (fixes ROM literal-pool / table loads).
                raw = self.fn.rom_bytes(c, width)
                if signed and width < 4:
                    return z3.SignExt(WORD - width * 8, z3.BitVecVal(raw, width * 8))
                return z3.BitVecVal(raw, WORD)
            v = self._aload(st.data, addr, width)
        if signed and width < 4:
            v = z3.SignExt(WORD - width * 8, z3.Extract(width * 8 - 1, 0, v))
        return v

    def store(self, st, addr, width, value, base_reg):
        val = z3.Extract(width * 8 - 1, 0, value) if width < 4 else value
        if base_reg is not None and self.is_stack(base_reg):
            st.stack = self._astore(st.stack, addr, width, val)
            return
        c = self._const(addr)
        if c is not None and MMIO_LO <= c < MMIO_HI:
            st.mmio.append(("W", c, width, val))
            return
        st.data = self._astore(st.data, addr, width, val)

    @staticmethod
    def _const(e):
        s = z3.simplify(e)
        return s.as_long() if z3.is_bv_value(s) else None

    @staticmethod
    def _aload(arr, addr, width):
        parts = [z3.Select(arr, addr + i) for i in range(width)]
        v = parts[-1]
        for b in reversed(parts[:-1]):
            v = z3.Concat(v, b)
        return z3.ZeroExt(WORD - width * 8, v) if width < 4 else v

    @staticmethod
    def _astore(arr, addr, width, val):
        for i in range(width):
            arr = z3.Store(arr, addr + i, z3.Extract(8 * i + 7, 8 * i, val))
        return arr

    # ---------- flags ----------
    @staticmethod
    def _nz(res):
        return {"N": sgn(res),
                "Z": z3.If(res == 0, z3.BitVecVal(1, 1), z3.BitVecVal(0, 1))}

    def _addf(self, st, a, b, cin=0):
        ea, eb = z3.ZeroExt(1, a), z3.ZeroExt(1, b)
        ec = z3.BitVecVal(cin, WORD + 1) if isinstance(cin, int) else z3.ZeroExt(WORD, cin)
        ext = ea + eb + ec
        res = z3.Extract(WORD - 1, 0, ext)
        f = self._nz(res)
        f["C"] = z3.Extract(WORD, WORD, ext)
        sa, sb, sr = sgn(a), sgn(b), sgn(res)
        f["V"] = z3.If(z3.And(sa == sb, sa != sr), z3.BitVecVal(1, 1), z3.BitVecVal(0, 1))
        st.flags = f
        return res

    def _subf(self, st, a, b):
        return self._addf(st, a, ~b, 1)

    # ---------- condition codes ----------
    def cond(self, st, cc):
        N, Z, C, V = (st.flags[k] == 1 for k in "NZCV")
        table = {
            0x0: Z, 0x1: z3.Not(Z), 0x2: C, 0x3: z3.Not(C),
            0x4: N, 0x5: z3.Not(N), 0x6: V, 0x7: z3.Not(V),
            0x8: z3.And(C, z3.Not(Z)), 0x9: z3.Or(z3.Not(C), Z),
            0xA: N == V, 0xB: N != V,
            0xC: z3.And(z3.Not(Z), N == V), 0xD: z3.Or(Z, N != V),
        }
        return table[cc]

    # ---------- path exploration ----------
    def run(self, init: State, start):
        self._walk(init, start)
        return self.leaves

    def _walk(self, st, addr):
        while True:
            if self.npaths > self.max_paths or len(self.leaves) > self.max_paths:
                raise LiftError("path budget exceeded")
            if self.deadline and _time.time() > self.deadline:
                raise LiftError("enumeration timeout")
            cnt = st.visits.get(addr, 0) + 1
            if cnt > self.loop_bound:
                # bound reached: drop this continuation (BMC pruning)
                return
            st.visits[addr] = cnt
            hw = self.fn.hw(addr)
            if bits(hw, 15, 11) in (0b11110, 0b11111):  # bl (32-bit)
                self._do_call(st, addr)
                addr += 4
                continue
            res = self._exec(st, hw, addr)
            if res is None:            # returned
                self.leaves.append(st)
                self.npaths += 1
                return
            if isinstance(res, tuple) and res[0] == "branch":
                _, cc, target = res
                nxt = addr + 2
                if cc is None:         # unconditional
                    addr = target
                    continue
                c = self.cond(st, cc)
                s_taken = st.copy(); s_taken.pc_cond.append(c)
                s_fall = st.copy(); s_fall.pc_cond.append(z3.Not(c))
                self._walk(s_taken, target)
                st = s_fall
                addr = nxt
                continue
            addr = res                 # normal next addr

    # ---------- call summary ----------
    def _do_call(self, st, addr):
        tgt = self.fn.callmap.get(addr, addr)   # int address, or veneer string
        if isinstance(tgt, str) and tgt.startswith("_call_via_"):
            reg = tgt[len("_call_via_"):]
            regmap = {"r0":0,"r1":1,"r2":2,"r3":3,"r4":4,"r5":5,"r6":6,"r7":7,
                      "r8":8,"sb":9,"r9":9,"sl":10,"r10":10,"fp":11,"r11":11,"ip":12}
            target = ("INDIRECT", z3.simplify(st.regs[regmap[reg]]))
        else:
            target = tgt                          # canonical: an int address
        k = len(st.calls)
        self.oracle._mk(k)
        args = [st.regs[i] for i in range(4)]
        st.calls.append({"target": target, "args": args})
        st.regs[0] = self.oracle.ret[k]
        for r, sv in self.oracle.clob[k].items():
            st.regs[r] = sv
        st.data = self.oracle.mem[k]
        st.flags = {f: z3.BitVec(f"cf_{self.tag}_{addr:x}_{f}", 1) for f in "NZCV"}

    # ---------- instruction semantics ----------
    def _exec(self, st, hw, addr):
        R = st.regs
        t5, t4, t6, t3 = bits(hw,15,11), bits(hw,15,12), bits(hw,15,10), bits(hw,15,13)

        # conditional branch (format 16)
        if t4 == 0b1101:
            cc = bits(hw, 11, 8)
            if cc == 0b1110:
                raise LiftError("undefined cond 0b1110")
            if cc == 0b1111:
                raise LiftError("swi")
            off = bits(hw, 7, 0)
            off = off - 256 if off >= 128 else off
            target = addr + 4 + off * 2
            return ("branch", cc, target)
        # unconditional branch (format 18)
        if t5 == 0b11100:
            off = bits(hw, 10, 0)
            off = off - 2048 if off >= 1024 else off
            return ("branch", None, addr + 4 + off * 2)

        # add/sub (format 2)
        if t5 == 0b00011:
            I, op, rn, rs, rd = bits(hw,10,10), bits(hw,9,9), bits(hw,8,6), bits(hw,5,3), bits(hw,2,0)
            b = z3.BitVecVal(rn, WORD) if I else R[rn]
            R[rd] = self._subf(st, R[rs], b) if op else self._addf(st, R[rs], b)
            return addr + 2
        # shift imm (format 1)
        if t3 == 0b000:
            op, imm, rs, rd = bits(hw,12,11), bits(hw,10,6), bits(hw,5,3), bits(hw,2,0)
            v = R[rs]
            if op == 0: res = v if imm == 0 else v << imm
            elif op == 1: res = z3.BitVecVal(0,WORD) if imm==0 else z3.LShR(v, imm)
            else: res = (v >> 31) if imm==0 else (v >> imm)
            R[rd] = res
            st.flags.update(self._nz(res))
            return addr + 2
        # mov/cmp/add/sub imm8 (format 3)
        if t3 == 0b001:
            op, rd, imm = bits(hw,12,11), bits(hw,10,8), bits(hw,7,0)
            iv = z3.BitVecVal(imm, WORD)
            if op == 0: R[rd] = iv; st.flags.update(self._nz(iv))
            elif op == 1: self._subf(st, R[rd], iv)
            elif op == 2: R[rd] = self._addf(st, R[rd], iv)
            else: R[rd] = self._subf(st, R[rd], iv)
            return addr + 2
        # ALU (format 4)
        if t6 == 0b010000:
            op, rs, rd = bits(hw,9,6), bits(hw,5,3), bits(hw,2,0)
            a, b = R[rd], R[rs]
            if op==0x0: R[rd]=a&b; st.flags.update(self._nz(R[rd]))
            elif op==0x1: R[rd]=a^b; st.flags.update(self._nz(R[rd]))
            elif op==0x2: R[rd]=a<<z3.ZeroExt(WORD-8,z3.Extract(7,0,b)); st.flags.update(self._nz(R[rd]))
            elif op==0x3: R[rd]=z3.LShR(a,z3.ZeroExt(WORD-8,z3.Extract(7,0,b))); st.flags.update(self._nz(R[rd]))
            elif op==0x4: R[rd]=a>>z3.ZeroExt(WORD-8,z3.Extract(7,0,b)); st.flags.update(self._nz(R[rd]))
            elif op==0x5: R[rd]=self._addf(st,a,b,st.flags["C"])
            elif op==0x6: R[rd]=self._addf(st,a,~b,st.flags["C"])
            elif op==0x7: R[rd]=z3.RotateRight(a,z3.ZeroExt(WORD-8,z3.Extract(7,0,b))); st.flags.update(self._nz(R[rd]))
            elif op==0x8: st.flags.update(self._nz(a&b))
            elif op==0x9: R[rd]=self._subf(st,z3.BitVecVal(0,WORD),b)
            elif op==0xA: self._subf(st,a,b)
            elif op==0xB: self._addf(st,a,b)
            elif op==0xC: R[rd]=a|b; st.flags.update(self._nz(R[rd]))
            elif op==0xD: R[rd]=a*b; st.flags.update(self._nz(R[rd]))
            elif op==0xE: R[rd]=a&~b; st.flags.update(self._nz(R[rd]))
            elif op==0xF: R[rd]=~b; st.flags.update(self._nz(R[rd]))
            return addr + 2
        # hi-reg / BX (format 5)
        if t6 == 0b010001:
            op, h1, h2 = bits(hw,9,8), bits(hw,7,7), bits(hw,6,6)
            rs = bits(hw,5,3) | (h2<<3); rd = bits(hw,2,0) | (h1<<3)
            if op==0: R[rd] = R[rd] + R[rs]
            elif op==1: self._subf(st, R[rd], R[rs])
            elif op==2: R[rd] = R[rs]
            else:
                # bx rN: function return (epilogue often `pop {rK}; bx rK`).
                # A bare indirect bx at end-of-function is the return.
                return None
            return addr + 2
        # PC-relative load (format 6)
        if t5 == 0b01001:
            rd, imm = bits(hw,10,8), bits(hw,7,0)
            ea = z3.BitVecVal(((addr+4)&~3)+imm*4, WORD)
            R[rd] = self.load(st, ea, 4, None)
            return addr + 2
        # load/store reg offset (format 7) + sign-extended (format 8)
        if t4 == 0b0101:
            ro, rb, rd = bits(hw,8,6), bits(hw,5,3), bits(hw,2,0)
            ea = R[rb] + R[ro]
            op = bits(hw,11,9)
            # format 7: 0101 LB0; format 8: 0101 HS1
            if bits(hw,9,9)==0:  # format 7
                L,B = bits(hw,11,11), bits(hw,10,10)
                w = 1 if B else 4
                if L: R[rd]=self.load(st,ea,w,rb)
                else: self.store(st,ea,w,R[rd],rb)
            else:  # format 8: H S
                H,S = bits(hw,11,11), bits(hw,10,10)
                if not S:  # strh(H=0)/ldrh(H=1)
                    if H: R[rd]=self.load(st,ea,2,rb)
                    else: self.store(st,ea,2,R[rd],rb)
                else:  # ldrsb(H=0)/ldrsh(H=1)
                    R[rd]=self.load(st,ea,2 if H else 1,rb,signed=True)
            return addr + 2
        # load/store word/byte imm (format 9)
        if t3 == 0b011:
            B,L,imm,rb,rd = bits(hw,12,12),bits(hw,11,11),bits(hw,10,6),bits(hw,5,3),bits(hw,2,0)
            w = 1 if B else 4
            ea = R[rb] + imm*(1 if B else 4)
            if L: R[rd]=self.load(st,ea,w,rb)
            else: self.store(st,ea,w,R[rd],rb)
            return addr + 2
        # load/store halfword imm (format 10)
        if t4 == 0b1000:
            L,imm,rb,rd = bits(hw,11,11),bits(hw,10,6),bits(hw,5,3),bits(hw,2,0)
            ea = R[rb] + imm*2
            if L: R[rd]=self.load(st,ea,2,rb)
            else: self.store(st,ea,2,R[rd],rb)
            return addr + 2
        # SP-relative load/store (format 11)
        if t4 == 0b1001:
            L,rd,imm = bits(hw,11,11),bits(hw,10,8),bits(hw,7,0)
            ea = R[SP] + imm*4
            if L: R[rd]=self.load(st,ea,4,SP)
            else: self.store(st,ea,4,R[rd],SP)
            return addr + 2
        # load address (format 12)
        if t4 == 0b1010:
            sp,rd,imm = bits(hw,11,11),bits(hw,10,8),bits(hw,7,0)
            R[rd] = R[SP]+imm*4 if sp else z3.BitVecVal(((addr+4)&~3)+imm*4,WORD)
            return addr + 2
        # add offset to SP (format 13)
        if bits(hw,15,8) == 0b10110000:
            s,imm = bits(hw,7,7),bits(hw,6,0)
            R[SP] = R[SP]-imm*4 if s else R[SP]+imm*4
            return addr + 2
        # push/pop (format 14)
        if t4 == 0b1011 and bits(hw,10,9) == 0b10:
            L,Rb = bits(hw,11,11), bits(hw,8,8)
            rlist = [i for i in range(8) if (hw>>i)&1]
            if not L:
                regs = rlist + ([LR] if Rb else [])
                R[SP] = R[SP]-4*len(regs)
                for i,r in enumerate(regs): self.store(st, R[SP]+4*i, 4, R[r], SP)
            else:
                regs = rlist + ([PC] if Rb else [])
                for i,r in enumerate(regs): R[r]=self.load(st, R[SP]+4*i, 4, SP)
                R[SP]=R[SP]+4*len(regs)
                if Rb: return None
            return addr + 2
        # multiple load/store (format 15): stmia/ldmia Rb!, {list}
        if t4 == 0b1100:
            L,rb = bits(hw,11,11), bits(hw,10,8)
            rlist = [i for i in range(8) if (hw>>i)&1]
            a = R[rb]
            for i,r in enumerate(rlist):
                if L: R[r]=self.load(st, a+4*i, 4, None)
                else: self.store(st, a+4*i, 4, R[r], None)
            R[rb] = a + 4*len(rlist)
            return addr + 2

        raise LiftError(f"unhandled 0x{hw:04x} @ 0x{addr:08x}")
