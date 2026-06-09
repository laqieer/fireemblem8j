#!/usr/bin/env python3
"""NON_MATCHING staging lint (D26): every src/nonmatching/<fn>.c must have a
committed byte source asm/<fn>.s.

A NON_MATCHING staging body documents/stages a region-different function whose
*bytes still come from the asm*. So it is only legitimate for a function that
already has an oracle byte source (asm/<fn>.s + a carved_rom row). A staging C
with no asm/<fn>.s would be documenting a function that the oracle does not even
build -- a dangling, unverifiable body. Flag it.

Exit non-zero (listing offenders) if any src/nonmatching/<fn>.c lacks asm/<fn>.s.
This is a fast lint: no toolchain, no ROM.
"""
import glob
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)


def main():
    staging = sorted(glob.glob("src/nonmatching/*.c"))
    missing = []
    for c in staging:
        fn = os.path.basename(c)[:-2]  # strip .c
        asm = os.path.join("asm", fn + ".s")
        if not os.path.exists(asm):
            missing.append((c, asm))

    if missing:
        print(f"NON_MATCHING INCONSISTENT: {len(missing)} staging C file(s) have NO "
              f"byte source asm/<fn>.s (a staging body needs an oracle byte source):")
        for c, asm in missing:
            print(f"  {c}   (need {asm})")
        print("\nFix: carve asm/<fn>.s first (the oracle byte source), or remove the "
              "staging C.")
        return 1

    print(f"non-matching staging OK: all {len(staging)} src/nonmatching/*.c file(s) "
          f"have a byte source asm/<fn>.s")
    return 0


if __name__ == "__main__":
    sys.exit(main())
