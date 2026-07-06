#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

import angr

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / "scripts" / "tools" / "thumb_equiv"))
from thumb_lift import LiftError, lift  # type: ignore

from assemble import assemble_thumb


def probe(name, asm):
    blob = assemble_thumb("lift_" + name, asm)
    print(f"\n{name}: bytes={blob.code.hex()}")
    try:
        lift(blob.base, blob.code, tag="hand")
        print("  hand thumb_lift.py: accepted")
    except LiftError as e:
        print(f"  hand thumb_lift.py: LiftError: {e}")
    proj = angr.Project(str(blob.path), main_opts={"backend": "blob", "arch": "armel", "base_addr": blob.base, "entry_point": blob.entry}, auto_load_libs=False)
    block = proj.factory.block(blob.entry, thumb=True, opt_level=0, num_inst=8)
    print(f"  VEX/angr: jumpkind={block.vex.jumpkind}, instructions={block.instructions}")
    print("  capstone:")
    for insn in block.capstone.insns:
        print(f"    0x{insn.address:08x}: {insn.mnemonic}\t{insn.op_str}")


def main():
    probe("conditional branch from sub_80A3300-style CFG", "cmp r0, #0\nbeq 1f\nadds r0, #1\n1:\nbx lr")
    probe("external bl/call", "bl ext\nbx lr\next:\nbx lr")
    probe("high-register prologue from sub_8001570", "push {r4,r5,r6,r7,lr}\nmov r7, sl\nmov r6, r9\nmov r5, r8\npush {r5,r6,r7}\nbx lr")


if __name__ == "__main__":
    raise SystemExit(main())
