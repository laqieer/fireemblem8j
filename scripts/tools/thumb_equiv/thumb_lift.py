"""Lift a straight-line THUMB (ARMv4T) leaf function into a Z3 symbolic effect.

This is a *proof-of-concept* symbolic executor built to explore Discussion #149
(prove equivalence for non-byte-matching functions with Z3).  It is deliberately
narrow and honest about its assumptions -- see ``README.md`` and
``docs/equivalence_proving.md`` for the full modelling contract and caveats.

Scope (hard limits, enforced with explicit errors):
  * ARMv4T 16-bit THUMB only, one basic block: no conditional/uncond. branches,
    no loops, no ``bl`` calls.  Execution runs until ``bx lr`` or ``pop {...,pc}``.
  * Memory is split into explicit regions (rubber-duck review, region model):
      - stack     : SP-based accesses (push/pop/sp-relative). Private scratch,
                    NOT part of the caller-visible observable.
      - data      : every other load/store (EWRAM/IWRAM/ROM globals, pointer args).
      - rom-pool  : PC-relative literal loads are served from the *concrete*
                    assembled bytes (agbcc literal pools).
      - mmio      : concrete addresses in [0x04000000, 0x05000000) are treated as
                    volatile events (both reads and writes) and recorded on an
                    ordered trace -- they never touch the data array.
  * Volatile MMIO loads return a fresh unconstrained value and are recorded as a
    read event.  (Value-carrying volatile reads that must agree across the two
    programs need a shared read-oracle; that is an intentional, documented
    extension -- the PoC only tracks the *access pattern* for reads.)

The lifter returns a ``FuncEffect`` capturing the caller-visible observable.
"""

from __future__ import annotations

import dataclasses
from typing import Callable, Optional

import z3

WORD = 32
LR = 14
PC = 15
SP = 13

MMIO_LO = 0x04000000
MMIO_HI = 0x05000000


class LiftError(Exception):
    """Raised when the fragment leaves the supported PoC subset."""


@dataclasses.dataclass
class Event:
    """One volatile (MMIO) access on the observable trace."""

    kind: str          # 'R' or 'W'
    addr: int          # concrete MMIO address
    width: int         # 1, 2 or 4 bytes
    value: object      # Z3 BitVec (store value, or fresh symbol for a load)

    def key(self):
        # For equivalence we compare kind/addr/width/value.  Load values are
        # fresh symbols, so two matching read *patterns* compare structurally.
        return (self.kind, self.addr, self.width)


@dataclasses.dataclass
class FuncEffect:
    regs: dict            # r0..r15 final Z3 BitVecs
    flags: dict           # 'N','Z','C','V' final 1-bit BitVecs
    data_mem: z3.ArrayRef # final EWRAM/IWRAM data memory (byte addressed)
    trace: list           # ordered list[Event] of volatile MMIO accesses
    init_regs: dict       # initial reg symbols (shared inputs)
    init_data_mem: z3.ArrayRef
    insn_count: int       # abstract cost proxy (NOT a GBA cycle model)


def _bits(hw: int, hi: int, lo: int) -> int:
    return (hw >> lo) & ((1 << (hi - lo + 1)) - 1)


def _sethi(z, n=WORD):
    return z3.Extract(n - 1, n - 1, z)


class _CPU:
    def __init__(self, base_addr: int, code: bytes, tag: str,
                 init_regs=None, init_data=None):
        self.base = base_addr
        self.code = code
        self.tag = tag
        self.insn_count = 0
        self.trace: list[Event] = []
        self._read_ord = 0

        if init_regs is None:
            init_regs = {i: z3.BitVec(f"r{i}_{tag}_in", WORD) for i in range(16)}
        self.init_regs = init_regs
        self.regs = dict(init_regs)

        if init_data is None:
            init_data = z3.Array(f"data_{tag}_in", z3.BitVecSort(WORD),
                                  z3.BitVecSort(8))
        self.init_data = init_data
        self.data = init_data
        self.stack = z3.Array(f"stack_{tag}", z3.BitVecSort(WORD),
                              z3.BitVecSort(8))

        self.flags = {f: z3.BitVec(f"{f}_{tag}_in", 1) for f in "NZCV"}
        self.done = False

    # ---- memory helpers -------------------------------------------------
    @staticmethod
    def _is_stack_base(rb: int) -> bool:
        return rb == SP

    def _concrete(self, expr):
        s = z3.simplify(expr)
        if z3.is_bv_value(s):
            return s.as_long()
        return None

    def _load(self, addr, width: int, base_reg: Optional[int]):
        if base_reg is not None and self._is_stack_base(base_reg):
            return self._array_load(self.stack, addr, width)
        c = self._concrete(addr)
        if c is not None and MMIO_LO <= c < MMIO_HI:
            val = z3.BitVec(f"mmio_r{self._read_ord}_{self.tag}", width * 8)
            self._read_ord += 1
            self.trace.append(Event("R", c, width, val))
            return z3.ZeroExt(WORD - width * 8, val) if width < 4 else val
        if c is not None and self.base <= c < self.base + len(self.code):
            # ROM literal pool: serve concrete bytes.
            off = c - self.base
            v = int.from_bytes(self.code[off:off + width], "little")
            return z3.BitVecVal(v, WORD)
        return self._array_load(self.data, addr, width)

    def _store(self, addr, width: int, value, base_reg: Optional[int]):
        val = z3.Extract(width * 8 - 1, 0, value) if width < 4 else value
        if base_reg is not None and self._is_stack_base(base_reg):
            self.stack = self._array_store(self.stack, addr, width, val)
            return
        c = self._concrete(addr)
        if c is not None and MMIO_LO <= c < MMIO_HI:
            self.trace.append(Event("W", c, width, val))
            return
        self.data = self._array_store(self.data, addr, width, val)

    @staticmethod
    def _array_load(arr, addr, width):
        parts = []
        for i in range(width):
            parts.append(z3.Select(arr, addr + i))
        # little-endian: byte0 is least significant
        val = parts[-1]
        for b in reversed(parts[:-1]):
            val = z3.Concat(val, b)
        if width < 4:
            val = z3.ZeroExt(WORD - width * 8, val)
        return val

    @staticmethod
    def _array_store(arr, addr, width, val):
        for i in range(width):
            byte = z3.Extract(8 * i + 7, 8 * i, val)
            arr = z3.Store(arr, addr + i, byte)
        return arr

    # ---- flag helpers ---------------------------------------------------
    def _set_nz(self, res):
        self.flags["N"] = _sethi(res)
        self.flags["Z"] = z3.If(res == 0, z3.BitVecVal(1, 1), z3.BitVecVal(0, 1))

    def _add_flags(self, a, b, cin=0):
        ea = z3.ZeroExt(1, a)          # 33-bit
        eb = z3.ZeroExt(1, b)          # 33-bit
        if isinstance(cin, int):
            ec = z3.BitVecVal(cin, WORD + 1)
        else:                          # 1-bit BitVec carry flag
            ec = z3.ZeroExt(WORD, cin)  # 1 + 32 = 33-bit
        res_ext = ea + eb + ec
        res = z3.Extract(WORD - 1, 0, res_ext)
        self._set_nz(res)
        self.flags["C"] = z3.Extract(WORD, WORD, res_ext)
        # overflow: signs of operands equal and differ from result
        sa, sb, sr = _sethi(a), _sethi(b), _sethi(res)
        self.flags["V"] = z3.If(z3.And(sa == sb, sa != sr),
                                z3.BitVecVal(1, 1), z3.BitVecVal(0, 1))
        return res

    def _sub_flags(self, a, b):
        return self._add_flags(a, ~b, 1)

    # ---- main loop ------------------------------------------------------
    def run(self, start_off: int = 0, max_insns: int = 4096) -> FuncEffect:
        off = start_off
        while not self.done:
            if self.insn_count >= max_insns:
                raise LiftError("instruction budget exceeded (loop?)")
            if off + 2 > len(self.code):
                raise LiftError("ran off end of code without a return")
            hw = int.from_bytes(self.code[off:off + 2], "little")
            instr_addr = self.base + off
            self.regs[PC] = z3.BitVecVal((instr_addr + 4) & 0xFFFFFFFF, WORD)
            off += 2
            self.insn_count += 1
            self._exec(hw, instr_addr)
        return FuncEffect(self.regs, self.flags, self.data, self.trace,
                          self.init_regs, self.init_data, self.insn_count)

    def _exec(self, hw: int, addr: int):
        top5 = _bits(hw, 15, 11)
        top4 = _bits(hw, 15, 12)
        top6 = _bits(hw, 15, 10)
        top3 = _bits(hw, 15, 13)

        # BL / BLX prefix -> call (out of scope)
        if top5 in (0b11110, 0b11111):
            raise LiftError("bl/call encountered (non-leaf, out of PoC scope)")
        # branches
        if top4 == 0b1101:
            cond = _bits(hw, 11, 8)
            if cond == 0b1111:
                raise LiftError("swi encountered")
            raise LiftError("conditional branch (multi-path, out of PoC scope)")
        if top5 == 0b11100:
            raise LiftError("unconditional branch (out of PoC scope)")

        # format 2: add/subtract register/imm3
        if top5 == 0b00011:
            I = _bits(hw, 10, 10)
            opc = _bits(hw, 9, 9)
            rn = _bits(hw, 8, 6)
            rs = _bits(hw, 5, 3)
            rd = _bits(hw, 2, 0)
            b = z3.BitVecVal(rn, WORD) if I else self.regs[rn]
            a = self.regs[rs]
            res = self._sub_flags(a, b) if opc else self._add_flags(a, b)
            self.regs[rd] = res
            return

        # format 1: shift by immediate
        if top3 == 0b000:
            opc = _bits(hw, 12, 11)
            imm = _bits(hw, 10, 6)
            rs = _bits(hw, 5, 3)
            rd = _bits(hw, 2, 0)
            v = self.regs[rs]
            if opc == 0b00:      # LSL
                res = v if imm == 0 else v << imm
            elif opc == 0b01:    # LSR (imm 0 => 32)
                sh = 32 if imm == 0 else imm
                res = z3.BitVecVal(0, WORD) if sh == 32 else z3.LShR(v, sh)
            else:                # ASR (imm 0 => 32)
                sh = 32 if imm == 0 else imm
                res = (v >> 31) if sh == 32 else (v >> sh)  # z3 >> is arithmetic
            self.regs[rd] = res
            self._set_nz(res)
            return

        # format 3: mov/cmp/add/sub imm8
        if top3 == 0b001:
            opc = _bits(hw, 12, 11)
            rd = _bits(hw, 10, 8)
            imm = _bits(hw, 7, 0)
            iv = z3.BitVecVal(imm, WORD)
            if opc == 0b00:      # MOV
                self.regs[rd] = iv
                self._set_nz(iv)
            elif opc == 0b01:    # CMP
                self._sub_flags(self.regs[rd], iv)
            elif opc == 0b10:    # ADD
                self.regs[rd] = self._add_flags(self.regs[rd], iv)
            else:                # SUB
                self.regs[rd] = self._sub_flags(self.regs[rd], iv)
            return

        # format 4: ALU
        if top6 == 0b010000:
            opc = _bits(hw, 9, 6)
            rs = _bits(hw, 5, 3)
            rd = _bits(hw, 2, 0)
            a = self.regs[rd]
            b = self.regs[rs]
            if opc == 0b0000:    # AND
                res = a & b; self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b0001:  # EOR
                res = a ^ b; self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b0010:  # LSL reg
                sh = z3.Extract(7, 0, b)
                res = a << z3.ZeroExt(WORD - 8, sh)
                self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b0011:  # LSR reg
                res = z3.LShR(a, z3.ZeroExt(WORD - 8, z3.Extract(7, 0, b)))
                self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b0100:  # ASR reg
                res = a >> z3.ZeroExt(WORD - 8, z3.Extract(7, 0, b))
                self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b0111:  # ROR
                res = z3.RotateRight(a, z3.ZeroExt(WORD - 8, z3.Extract(7, 0, b)))
                self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b1000:  # TST
                self._set_nz(a & b)
            elif opc == 0b1001:  # NEG
                res = self._sub_flags(z3.BitVecVal(0, WORD), b)
                self.regs[rd] = res
            elif opc == 0b1010:  # CMP
                self._sub_flags(a, b)
            elif opc == 0b1011:  # CMN
                self._add_flags(a, b)
            elif opc == 0b1100:  # ORR
                res = a | b; self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b1101:  # MUL
                res = a * b; self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b1110:  # BIC
                res = a & ~b; self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b1111:  # MVN
                res = ~b; self.regs[rd] = res; self._set_nz(res)
            elif opc == 0b0101:  # ADC
                res = self._add_flags(a, b, self.flags["C"])
                self.regs[rd] = res
            elif opc == 0b0110:  # SBC
                res = self._add_flags(a, ~b, self.flags["C"])
                self.regs[rd] = res
            else:
                raise LiftError(f"unhandled ALU op {opc:04b}")
            return

        # format 5: hi-reg ops / BX
        if top6 == 0b010001:
            opc = _bits(hw, 9, 8)
            h1 = _bits(hw, 7, 7)
            h2 = _bits(hw, 6, 6)
            rs = _bits(hw, 5, 3) | (h2 << 3)
            rd = _bits(hw, 2, 0) | (h1 << 3)
            if opc == 0b00:      # ADD (no flags)
                self.regs[rd] = self.regs[rd] + self.regs[rs]
            elif opc == 0b01:    # CMP
                self._sub_flags(self.regs[rd], self.regs[rs])
            elif opc == 0b10:    # MOV (no flags)
                self.regs[rd] = self.regs[rs]
            else:                # BX
                if rs == LR:
                    self.done = True
                    return
                raise LiftError(f"bx r{rs} (indirect branch, out of scope)")
            return

        # format 6: PC-relative load (literal pool)
        if top5 == 0b01001:
            rd = _bits(hw, 10, 8)
            imm = _bits(hw, 7, 0)
            base = (addr + 4) & ~3
            ea = z3.BitVecVal((base + imm * 4) & 0xFFFFFFFF, WORD)
            self.regs[rd] = self._load(ea, 4, None)
            return

        # format 9: load/store word/byte imm offset
        if top3 == 0b011:
            B = _bits(hw, 12, 12)
            L = _bits(hw, 11, 11)
            imm = _bits(hw, 10, 6)
            rb = _bits(hw, 5, 3)
            rd = _bits(hw, 2, 0)
            width = 1 if B else 4
            scale = 1 if B else 4
            ea = self.regs[rb] + imm * scale
            if L:
                self.regs[rd] = self._load(ea, width, rb)
            else:
                self._store(ea, width, self.regs[rd], rb)
            return

        # format 10: load/store halfword imm offset
        if top4 == 0b1000:
            L = _bits(hw, 11, 11)
            imm = _bits(hw, 10, 6)
            rb = _bits(hw, 5, 3)
            rd = _bits(hw, 2, 0)
            ea = self.regs[rb] + imm * 2
            if L:
                self.regs[rd] = self._load(ea, 2, rb)
            else:
                self._store(ea, 2, self.regs[rd], rb)
            return

        # format 11: SP-relative load/store
        if top4 == 0b1001:
            L = _bits(hw, 11, 11)
            rd = _bits(hw, 10, 8)
            imm = _bits(hw, 7, 0)
            ea = self.regs[SP] + imm * 4
            if L:
                self.regs[rd] = self._load(ea, 4, SP)
            else:
                self._store(ea, 4, self.regs[rd], SP)
            return

        # format 12: load address (ADD Rd, PC/SP, #imm)
        if top4 == 0b1010:
            sp_bit = _bits(hw, 11, 11)
            rd = _bits(hw, 10, 8)
            imm = _bits(hw, 7, 0)
            if sp_bit:
                self.regs[rd] = self.regs[SP] + imm * 4
            else:
                self.regs[rd] = z3.BitVecVal((((addr + 4) & ~3) + imm * 4) & 0xFFFFFFFF, WORD)
            return

        # format 13: add offset to SP
        if _bits(hw, 15, 8) == 0b10110000:
            s = _bits(hw, 7, 7)
            imm = _bits(hw, 6, 0)
            delta = imm * 4
            self.regs[SP] = self.regs[SP] - delta if s else self.regs[SP] + delta
            return

        # format 14: push/pop
        if top4 == 0b1011 and _bits(hw, 10, 9) == 0b10:
            L = _bits(hw, 11, 11)
            R = _bits(hw, 8, 8)
            rlist = [i for i in range(8) if (hw >> i) & 1]
            if not L:  # PUSH  (LR pushed at highest address, r0 at lowest)
                regs = rlist + ([LR] if R else [])
                self.regs[SP] = self.regs[SP] - 4 * len(regs)
                a = self.regs[SP]
                for i, r in enumerate(regs):
                    self._store(a + 4 * i, 4, self.regs[r], SP)
            else:      # POP
                regs = rlist + ([PC] if R else [])
                a = self.regs[SP]
                for i, r in enumerate(regs):
                    self.regs[r] = self._load(a + 4 * i, 4, SP)
                self.regs[SP] = self.regs[SP] + 4 * len(regs)
                if R:  # pop {..., pc} -> return
                    self.done = True
            return

        raise LiftError(f"unhandled opcode 0x{hw:04x} at 0x{addr:08x}")


def lift(base_addr: int, code: bytes, tag: str,
         init_regs=None, init_data=None, start_off: int = 0) -> FuncEffect:
    """Symbolically execute one leaf basic block; return its FuncEffect."""
    cpu = _CPU(base_addr, code, tag, init_regs=init_regs, init_data=init_data)
    return cpu.run(start_off=start_off)
