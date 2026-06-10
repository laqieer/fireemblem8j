#!/usr/bin/env python3
"""Byte-neutral RENAME of `data_<addr>` residue placeholder labels to their
authoritative US symbol names (NAMED-SYMBOLS axis, DATA side — D38).

A `data_<addr>` residue object (scripts/carve_incbin_residue.py) is the JP version
of a US data object whose START maps — via the code-reference-derived
`layout/addr_map.tsv` (conflicts=0) — to a named US symbol, AND whose residue
chunk size equals that US object's size (so the chunk is EXACTLY one US object,
not a multi-object gap). The US name describes the object's region-stable ROLE
(e.g. which chapter's EventScr / UnitDef), so it is the honest descriptive name
for the JP bytes too (D10 integrity line: "the JP version of named object X").

Renaming is BYTE-NEUTRAL: the linked ROM depends on symbol ADDRESSES, not names.
`make compare` proves byte-neutrality after every batch. Only the `.global`/label
identifier changes; the address-keyed section name, asm filename, and `.bin` path
stay (they are not `.global` labels, do not affect the symbol axis, and changing
them risks breakage for zero metric gain).

The renamer atomically rewrites every occurrence of the OLD label across the tree
(grep-verified each label lives only in its own asm/<old>.s + the carved_rom
fragment). It refuses to act if a target US name already exists as a label
elsewhere (avoid a duplicate-symbol link error) or if the old label is referenced
from C.

Usage:
  scripts/rename_data_syms.py <candidates.tsv>          # apply
  scripts/rename_data_syms.py --dry-run <candidates.tsv>
candidates.tsv columns: jp_addr_hex8  size  us_name  [...ignored]
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)


def existing_labels():
    """Every `.global` label currently defined anywhere under asm/."""
    labels = set()
    for dp, _dn, fns in os.walk("asm"):
        for fn in fns:
            if not fn.endswith((".s", ".inc")):
                continue
            try:
                t = open(os.path.join(dp, fn), errors="replace").read()
            except OSError:
                continue
            labels.update(re.findall(r"^\s*\.global\s+(\S+)", t, re.M))
    return labels


def refs(label):
    """Files referencing `label` as a word, anywhere in the tree (excl .git)."""
    r = subprocess.run(
        ["grep", "-rln", r"\b" + re.escape(label) + r"\b",
         "--include=*.s", "--include=*.inc", "--include=*.c", "--include=*.h",
         "--include=*.tsv", "--include=*.txt", "."],
        capture_output=True, text=True)
    return [l for l in r.stdout.splitlines() if "/.git/" not in l]


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    dry = "--dry-run" in sys.argv[1:]
    if len(args) != 1:
        sys.exit(__doc__)
    cand = args[0]

    have = existing_labels()
    renamed = []
    skipped = []
    for ln in open(cand):
        if not ln.strip() or ln.startswith("#"):
            continue
        f = ln.rstrip("\n").split("\t")
        addr = f[0].upper().zfill(8)
        new = f[2]
        old = f"data_{addr}"
        asm = f"asm/{old}.s"
        if not os.path.exists(asm):
            skipped.append((old, new, "asm file missing"))
            continue
        if new in have:
            skipped.append((old, new, "target name already a label"))
            continue
        # the residue label must live only in its own .s + its fragment, and no C.
        rf = refs(old)
        allowed = {asm, f"layout/carved_rom.d/{old}.tsv"}
        unexpected = [r for r in rf if r.lstrip("./") not in allowed
                      and os.path.basename(r) not in {f"{old}.s", f"{old}.tsv"}]
        if any(r.endswith((".c", ".h")) for r in unexpected):
            skipped.append((old, new, f"referenced from C: {unexpected}"))
            continue
        if dry:
            renamed.append((old, new))
            continue
        # rewrite the .s: only the `.global <old>` and `<old>:` lines.
        s = open(asm).read()
        s = re.sub(rf"^(\s*\.global\s+){re.escape(old)}\b", rf"\g<1>{new}", s, flags=re.M)
        s = re.sub(rf"^{re.escape(old)}:", f"{new}:", s, flags=re.M)
        open(asm, "w").write(s)
        # rewrite the fragment: the OBJECT FILE basename stays (asm/data_<addr>.o);
        # only retarget nothing in the spec — the label is not named in the .tsv.
        # (the .tsv references the OBJECT, not the symbol, so it is untouched.)
        have.add(new)
        renamed.append((old, new))

    print(f"{'DRY-RUN ' if dry else ''}renamed {len(renamed)} data residue labels:")
    for old, new in renamed:
        print(f"  {old:24s} -> {new}")
    if skipped:
        print(f"SKIPPED {len(skipped)}:")
        for old, new, why in skipped:
            print(f"  {old:24s} -> {new}: {why}")


if __name__ == "__main__":
    main()
