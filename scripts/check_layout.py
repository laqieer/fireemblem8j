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


# Build-GENERATED object sources: not git-tracked themselves, but regenerated at
# build time from committed source (so CI's fresh checkout DOES produce them).
# asm/msg_data.s <- texts/jp_texts.txt (+ textdefs + huffman tiebreaks) via
# scripts/texttools/msg_jp.py. Each maps to the committed inputs that MUST exist.
GENERATED_SOURCES = {
    "asm/msg_data.s": [
        "texts/jp_texts.txt",
        "texts/jp_textdefs.txt",
        "texts/jp_huffman_tiebreaks.txt",
        "scripts/texttools/msg_jp.py",
    ],
}


def check_nonmatching_isolation():
    """ORACLE-INTEGRITY (D26): NON_MATCHING staging C (src/nonmatching/<fn>.c)
    must NEVER enter the make-compare oracle. The oracle links exactly the
    objects named in carved_rom*.tsv rows, so a carved_rom row referencing an
    object under src/nonmatching/ would place a NON_MATCHING object's bytes into
    the compared ROM -- exactly the fake-match the design forbids. Assert no
    carved_rom row references such an object."""
    carved_rom = ["layout/carved_rom.tsv"] + sorted(glob.glob("layout/carved_rom.d/*.tsv"))
    offenders = []
    for p in carved_rom:
        if not os.path.exists(p):
            continue
        for i, ln in enumerate(open(p), 1):
            if ln.lstrip().startswith("#"):
                continue
            if re.search(r"src/nonmatching/\S+\.o", ln):
                offenders.append((p, i, ln.strip()))
    if offenders:
        print(f"ORACLE INTEGRITY VIOLATION: {len(offenders)} carved_rom row(s) reference "
              f"an object under src/nonmatching/ -- non-matching C must NOT be placed in "
              f"the oracle layout (it would corrupt the make-compare ROM):")
        for p, i, ln in offenders[:40]:
            print(f"  {p}:{i}: {ln}")
        print("\nFix: remove the row. NON_MATCHING C is prove-builds-only (make nonmatching); "
              "the oracle byte source stays asm/<fn>.s.")
        return 1
    return 0


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
        # Build-generated sources: validate their COMMITTED inputs instead of the
        # generated .s itself (which is gitignored / may be absent before a build).
        gen = next((s for s in srcs if s in GENERATED_SOURCES), None)
        if gen is not None:
            for inp in GENERATED_SOURCES[gen]:
                if inp not in tracked:
                    untracked.append(inp)
            continue
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

    # ORACLE-INTEGRITY: never let NON_MATCHING staging C enter the oracle layout.
    nonmatching_rc = check_nonmatching_isolation()

    if missing or untracked or frag_untracked:
        print("\nFix: commit/regenerate the missing source(s)/fragment(s), or remove the dangling rows.")
        return 1
    if nonmatching_rc:
        return nonmatching_rc
    print(f"layout consistency OK: all {len(refs)} layout-referenced objects + their fragments "
          f"are git-tracked; no src/nonmatching/ object in the oracle layout")
    return 0


if __name__ == "__main__":
    sys.exit(main())
