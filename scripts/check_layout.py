#!/usr/bin/env python3
"""Layout consistency lint: every object the build LINKS must have a git-tracked source.

Why this exists (the bug it prevents): the whole-ROM build links the objects named in
``layout/carved_rom*.tsv`` (+ ``src/*.c`` via the Makefile). A carve that adds a layout
row but doesn't COMMIT the object's ``.s``/``.c`` source still builds fine LOCALLY -- a
stale ``.o`` from a prior build survives ``make clean`` because the ``asm/*.s`` wildcard
can no longer see the deleted ``.s``, so ``$(ALL_OBJECTS)`` doesn't list it. CI's FRESH
checkout has no stale ``.o`` and fails the link with ``ld: cannot find asm/X.o``. This
lint catches that class in seconds (no toolchain, no ROM) before it reaches CI -- run it
locally (``make check``) and in CI.

Exit non-zero (listing the offenders) if any layout-referenced object's source is missing
on disk OR present but not tracked in git (a fresh checkout would miss it either way).
"""
import glob
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)


def tracked_files():
    out = subprocess.run(["git", "ls-files"], capture_output=True, text=True).stdout
    return set(out.splitlines())


def main():
    tracked = tracked_files()
    manifests = (
        ["layout/carved_rom.tsv", "layout/carved_ram.tsv"]
        + sorted(glob.glob("layout/carved_rom.d/*.tsv"))
        + sorted(glob.glob("layout/carved_ram.d/*.tsv"))
    )
    refs = set()
    for p in manifests:
        if not os.path.exists(p):
            continue
        for ln in open(p):
            if ln.lstrip().startswith("#"):
                continue
            # object spec is `asm/foo.o(.section)` or `src/foo.o(.section)`
            for m in re.finditer(r"((?:asm|src)/\S+?\.o)\(", ln):
                refs.add(m.group(1))

    missing, untracked = [], []
    for o in sorted(refs):
        srcs = [o[:-2] + ext for ext in (".s", ".c")]  # .o -> .s / .c
        existing = [s for s in srcs if os.path.exists(s)]
        if not existing:
            missing.append(o)
        elif not any(s in tracked for s in existing):
            untracked.append(existing[0])

    # gen_layout / apply_patches also read per-task FRAGMENTS (layout/<name>.d/*.tsv). An
    # untracked .tsv in one of those dirs -- e.g. a new carve's baseline_syms_drop.d that the
    # broad '*.d' gitignore rule swallowed -- builds LOCALLY but is absent in CI's fresh
    # checkout, breaking the link ('multiple definition' / unresolved symbol). Flag those too.
    frag_untracked = []
    for d in ("layout/carved_rom.d", "layout/carved_ram.d", "layout/baseline_syms.d",
              "layout/baseline_syms_drop.d", "layout/patches.d"):
        for f in sorted(glob.glob(d + "/*.tsv")):
            if f not in tracked:
                frag_untracked.append(f)

    if missing:
        print(f"LAYOUT INCONSISTENT: {len(missing)} object(s) referenced by layout have NO "
              f"source on disk (CI link will fail with 'cannot find'):")
        for o in missing[:40]:
            print(f"  {o}   (need {o[:-2]}.s or {o[:-2]}.c)")
        if len(missing) > 40:
            print(f"  ... +{len(missing) - 40} more")
    if untracked:
        print(f"LAYOUT INCONSISTENT: {len(untracked)} object source(s) exist locally but are "
              f"NOT git-tracked (CI's fresh checkout will miss them):")
        for s in untracked[:40]:
            print(f"  {s}")
        if len(untracked) > 40:
            print(f"  ... +{len(untracked) - 40} more")
    if frag_untracked:
        print(f"LAYOUT INCONSISTENT: {len(frag_untracked)} layout fragment(s) exist locally but are "
              f"NOT git-tracked (gen_layout reads them; CI's fresh checkout will miss them):")
        for f in frag_untracked[:40]:
            print(f"  {f}   (git add it; if it's gitignored, un-ignore the dir in .gitignore)")
        if len(frag_untracked) > 40:
            print(f"  ... +{len(frag_untracked) - 40} more")

    if missing or untracked or frag_untracked:
        print("\nFix: commit/regenerate the missing source(s)/fragment(s), or remove the dangling rows.")
        return 1
    print(f"layout consistency OK: all {len(refs)} layout-referenced objects + their fragments "
          f"are git-tracked")
    return 0


if __name__ == "__main__":
    sys.exit(main())
