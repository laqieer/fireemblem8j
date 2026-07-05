#!/usr/bin/env python3
"""Discussion #149 PoC -- lift *actual FE8J ROM bytes* and prove each real leaf
function equivalent to a byte-different rewrite (the exact workflow the idea is
about: accept a non-matching but provably-equivalent form of a real function).

Reads the real functions straight out of ``fireemblem8.gba`` (flat ROM mapped at
0x08000000) and checks them against a re-assembled variant.

Run:  $HOME/z3-venv/bin/python real_smoke.py
"""

import os
import subprocess
import sys

import equiv
from thumb_lift import lift

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
GBA = os.path.join(ROOT, "fireemblem8.gba")
TMP = "/tmp/thumb_equiv"
ROM_BASE = 0x08000000


def rom_bytes(vma, size):
    data = open(GBA, "rb").read()
    off = vma - ROM_BASE
    return data[off:off + size]


def assemble(body, base=0x08000000):
    os.makedirs(TMP, exist_ok=True)
    src = f"{TMP}/v.s"
    # place variant at the real VMA so any literal pool math matches reality
    with open(src, "w") as fh:
        fh.write(f".thumb\n.syntax unified\n.section .text\nf:\n{body}\n.pool\n")
    subprocess.run(["arm-none-eabi-as", "-mthumb", "-mcpu=arm7tdmi", src,
                    "-o", f"{TMP}/v.o"], check=True)
    subprocess.run(["arm-none-eabi-objcopy", "-O", "binary",
                    "--only-section=.text", f"{TMP}/v.o", f"{TMP}/v.bin"],
                   check=True)
    return open(f"{TMP}/v.bin", "rb").read()


PASS = True


def case(name, vma, size, variant_asm, returns=("r0",)):
    global PASS
    real = rom_bytes(vma, size)
    var = assemble(variant_asm, base=vma)
    print(f"\n--- {name} @ {vma:#010x} ({size} B) ---")
    print(f"  real ROM bytes : {real.hex()}")
    print(f"  variant bytes  : {var.hex()}   (byte-different: {real != var})")
    # smoke: the lifter decodes the real bytes at all
    eff = lift(vma, real, "real")
    print(f"  lifted real: r0_out = {eff.regs[0]}")
    r = equiv.check(vma, real, vma, var, returns=returns)
    print("  ->", r.detail)
    ok = r.equivalent and (real != var)
    PASS = PASS and ok
    print(f"  [{'PASS' if ok else 'FAIL'}] {name}")


def main():
    if not os.path.exists(GBA):
        print("fireemblem8.gba not found; run `make compare` first.")
        sys.exit(2)

    # byte at [r0] += 1, computed with an extra reg -> different bytes, same effect
    case("AiScriptCmd_14_DoNothing", 0x0803CEA8, 8,
         "movs r2, #1\n ldrb r1, [r0]\n adds r1, r1, r2\n strb r1, [r0]\n bx lr")

    # return *(u32*)0x03000010, address materialised in a scratch reg (r1)
    case("GetGameClock", 0x08000CD8, 12,
         "ldr r1, =0x03000010\n ldr r0, [r1]\n bx lr")

    # *(u16*)(r0+100) = 0, with the two setup insns reordered
    case("BG0Shaker_Init", 0x08081968, 8,
         "movs r1, #0\n adds r0, #100\n strh r1, [r0]\n bx lr")

    print("\n" + ("REAL-ROM SMOKE: ALL PASS" if PASS else "REAL-ROM SMOKE: FAIL"))
    sys.exit(0 if PASS else 1)


if __name__ == "__main__":
    main()
