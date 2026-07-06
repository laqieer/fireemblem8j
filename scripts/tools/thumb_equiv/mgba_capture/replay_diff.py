#!/usr/bin/env python3
"""Replay a captured live game state (from capture.c) through both the JP ROM
bytes and the compiled reconstruction, and compare the caller-visible observable
(return + non-stack memory writes).  This exercises functions the black-box
differential tester can't reach because they read a live, self-consistent battle
state (e.g. sub_8057F80 = PrepareBattleGraphicsMaybe).

Prereq:  build+run mgba_capture/capture.c to produce
${MGBA_CAPTURE_DIR:-build/mgba_capture}/{regs,ewram,iwram}.
   gcc capture.c -o capture -I/usr/include -lmgba
   ./capture fireemblem8.gba 08057f80 12100 60000000
Then:    $HOME/z3-venv/bin/python replay_diff.py sub_8057F80
"""
import os
import struct
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))
import differential_test as D          # noqa: E402
import prove_nonmatching as P          # noqa: E402
from unicorn import UcError, UC_HOOK_MEM_WRITE          # noqa: E402
from unicorn.arm_const import (UC_ARM_REG_R0, UC_ARM_REG_SP,          # noqa: E402
                               UC_ARM_REG_LR, UC_ARM_REG_PC)

SNAP = os.environ.get("MGBA_CAPTURE_DIR", "build/mgba_capture")


def replay(fn):
    vma, tsize, _ = P.func_vma_size(fn)
    cc = D.candidate_linked(fn, vma, tsize)       # size-matched: the right twin
    ew = open(f"{SNAP}/ewram.bin", "rb").read()
    iw = open(f"{SNAP}/iwram.bin", "rb").read()
    regs = [int(x, 16) for x in open(f"{SNAP}/regs.txt").read().split()]
    sp = regs[13]

    def run(code):
        uc = D._mkuc()
        if code is not None:
            uc.mem_write(vma, code)
        uc.mem_write(0x02000000, ew)
        uc.mem_write(0x03000000, iw)
        for i in range(13):
            uc.reg_write(UC_ARM_REG_R0 + i, regs[i])
        uc.reg_write(UC_ARM_REG_SP, sp)
        uc.reg_write(UC_ARM_REG_LR, D.RET | 1)
        w = {}

        def hk(uc, acc, addr, size, val, ud):
            if sp - 0x800 <= addr < sp + 0x40:
                return
            w[addr] = (size, val & ((1 << (size * 8)) - 1))
        uc.hook_add(UC_HOOK_MEM_WRITE, hk)
        try:
            uc.emu_start(vma | 1, D.RET, count=5000000)
        except UcError:
            return ("FAULT", hex(uc.reg_read(UC_ARM_REG_PC)), tuple(sorted(w.items())))
        return (uc.reg_read(UC_ARM_REG_R0) & 0xFFFF, tuple(sorted(w.items())))

    print(f"{fn}: captured args r0={regs[0]:#010x} r1={regs[1]:#010x} sp={sp:#010x}")
    t = run(None)
    c = run(cc)
    ts = t if t[0] == "FAULT" else f"ret={t[0]} writes={len(t[1])}"
    cs = c if c[0] == "FAULT" else f"ret={c[0]} writes={len(c[1])}"
    print(f"  TARGET: {ts}")
    print(f"  CAND  : {cs}")
    if t != c and t[0] != "FAULT" and c[0] != "FAULT":
        tw = dict(t[1])
        cw = dict(c[1])
        for addr in sorted(set(tw) | set(cw)):
            if tw.get(addr) != cw.get(addr):
                print(f"    diff {addr:#010x}: target={tw.get(addr)} cand={cw.get(addr)}")
    print("  => " + ("MATCH" if t == c else "DIFF"))
    return t == c


if __name__ == "__main__":
    fns = sys.argv[1:] or ["sub_8057F80"]
    if not os.path.exists(f"{SNAP}/regs.txt"):
        sys.exit(f"no capture at {SNAP} — run mgba_capture/capture.c first")
    ok = sum(replay(fn) for fn in fns)
    print(f"\nMATCH: {ok}/{len(fns)}")
