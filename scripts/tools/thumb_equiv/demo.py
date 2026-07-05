#!/usr/bin/env python3
"""Discussion #149 proof-of-concept: prove/refute equivalence of non-byte-matching
THUMB leaf functions with Z3, and show why MMIO/timing need a stronger notion.

Run:  $HOME/z3-venv/bin/python demo.py      (needs arm-none-eabi-as + z3-solver)

It assembles four pairs of *real* ARMv4T THUMB with arm-none-eabi-as, lifts them
(thumb_lift.py) and checks them (equiv.py):

  A. equivalent-but-byte-different       -> PROVEN ABI-functional equivalent
  B. subtly different (add vs sub)       -> REFUTED with a concrete counterexample
  C. same result, different MMIO writes  -> ABI-functional EQUIVALENT but
                                            observationally REFUTED (macabeus's point)
  D. same result, different MMIO reads    -> ABI-functional EQUIVALENT but
                                            observationally REFUTED (volatile reads)

The script exits non-zero if any verdict differs from the expectation, so it also
serves as a regression self-test.
"""

import subprocess
import sys

import z3

import equiv
from thumb_lift import lift

AS = "arm-none-eabi-as"
OBJCOPY = "arm-none-eabi-objcopy"
OBJDUMP = "arm-none-eabi-objdump"
TMP = "/tmp/thumb_equiv"


def assemble(body: str):
    """Assemble a THUMB snippet; return (code_bytes, disasm_text)."""
    import os
    os.makedirs(TMP, exist_ok=True)
    src = f"/tmp/thumb_equiv/f.s"
    with open(src, "w") as fh:
        fh.write(".thumb\n.syntax unified\n.global f\nf:\n" + body + "\n.pool\n")
    subprocess.run([AS, "-mthumb", "-mcpu=arm7tdmi", src, "-o", f"{TMP}/f.o"],
                   check=True)
    subprocess.run([OBJCOPY, "-O", "binary", "--only-section=.text",
                    f"{TMP}/f.o", f"{TMP}/f.bin"], check=True)
    code = open(f"{TMP}/f.bin", "rb").read()
    dis = subprocess.run([OBJDUMP, "-d", "-M", "force-thumb", f"{TMP}/f.o"],
                         capture_output=True, text=True).stdout
    lines = [l.split("\t", 1)[-1].strip()
             for l in dis.splitlines() if l.strip().startswith(tuple("0123456789abcdef")) and ":" in l]
    return code, "  ".join(x for x in lines if x)


def counterexample(model):
    vals = {}
    for d in model.decls():
        if d.name().endswith("_in") and d.name().startswith("r"):
            vals[d.name()] = model[d]
    return {k: hex(v.as_long()) for k, v in sorted(vals.items())
            if z3.is_bv_value(v) and v.as_long() != 0} or {"(inputs)": "0"}


def banner(t):
    print("\n" + "=" * 72 + f"\n{t}\n" + "=" * 72)


PASS = True


def expect(name, got, want):
    global PASS
    ok = got == want
    PASS = PASS and ok
    print(f"  [{'PASS' if ok else 'FAIL'}] {name}: got {got!r}, want {want!r}")


def main():
    # ---- A: equivalent but byte-different (instruction selection) ----------
    banner("A. x*9 two ways -> PROVEN ABI-functional equivalent (non-matching!)")
    a1, d1 = assemble("lsls r1, r0, #3\n adds r0, r0, r1\n bx lr")          # x + 8x
    a2, d2 = assemble("lsls r1, r0, #2\n adds r1, r1, r1\n adds r0, r0, r1\n bx lr")  # x + (4x+4x)
    print(f"  f1 bytes {a1.hex()}   [{d1}]")
    print(f"  f2 bytes {a2.hex()}   [{d2}]")
    expect("bytes differ", a1 != a2, True)
    r = equiv.check(0, a1, 0, a2)
    print("  ->", r.detail)
    expect("A equivalent", r.equivalent, True)

    # ---- B: subtly different (soundness: catches a real bug) ---------------
    banner("B. add vs sub -> REFUTED (soundness: a wrong 'equivalent' is caught)")
    b1, d1 = assemble("lsls r1, r0, #3\n adds r0, r0, r1\n bx lr")   # 9x
    b2, d2 = assemble("lsls r1, r0, #3\n subs r0, r1, r0\n bx lr")   # 7x
    print(f"  f1 bytes {b1.hex()}   [{d1}]")
    print(f"  f2 bytes {b2.hex()}   [{d2}]")
    r = equiv.check(0, b1, 0, b2)
    print("  ->", r.detail)
    expect("B refuted", r.equivalent, False)
    if r.counterexample is not None:
        print("     counterexample input:", counterexample(r.counterexample))

    # ---- C: same architectural state, different MMIO writes ----------------
    banner("C. MMIO write pattern 1;2 vs 2 -> functional EQUIV but observational REFUTED")
    c1, _ = assemble("ldr r3, =0x04000000\n movs r2, #1\n str r2, [r3]\n"
                     " movs r2, #2\n str r2, [r3]\n bx lr")
    c2, _ = assemble("ldr r3, =0x04000000\n movs r2, #2\n str r2, [r3]\n bx lr")
    print("  f1 volatile trace:", equiv.trace_summary(0, c1, "c1"))
    print("  f2 volatile trace:", equiv.trace_summary(0, c2, "c2"))
    rf = equiv.check(0, c1, 0, c2, observational=False)
    ro = equiv.check(0, c1, 0, c2, observational=True)
    print("  functional   ->", rf.detail)
    print("  observational->", ro.detail)
    expect("C functional equivalent", rf.equivalent, True)
    expect("C observational refuted", ro.equivalent, False)

    # ---- D: same architectural state, different MMIO reads ------------------
    banner("D. MMIO read once vs twice -> functional EQUIV but observational REFUTED")
    d1c, _ = assemble("ldr r3, =0x04000000\n ldr r2, [r3]\n movs r0, #0\n bx lr")
    d2c, _ = assemble("ldr r3, =0x04000000\n ldr r2, [r3]\n ldr r2, [r3]\n"
                      " movs r0, #0\n bx lr")
    print("  f1 volatile trace:", equiv.trace_summary(0, d1c, "d1"))
    print("  f2 volatile trace:", equiv.trace_summary(0, d2c, "d2"))
    rf = equiv.check(0, d1c, 0, d2c, observational=False)
    ro = equiv.check(0, d1c, 0, d2c, observational=True)
    print("  functional   ->", rf.detail)
    print("  observational->", ro.detail)
    expect("D functional equivalent", rf.equivalent, True)
    expect("D observational refuted", ro.equivalent, False)

    banner("RESULT: " + ("ALL EXPECTATIONS MET" if PASS else "SOME CHECKS FAILED"))
    sys.exit(0 if PASS else 1)


if __name__ == "__main__":
    main()
