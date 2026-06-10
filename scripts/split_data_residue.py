#!/usr/bin/env python3
"""Byte-neutral SPLIT of a multi-object `data_<addr>` residue chunk into its
constituent named US objects (NAMED-SYMBOLS axis, DATA side — D38).

Some residue gaps are a contiguous run of SEVERAL US data objects (e.g. a block of
EventScr_Ch10A_1..7). When the chunk's total size equals the US run's size AND
every interior object boundary is INDEPENDENTLY confirmed by the code-reference-
derived layout/addr_map.tsv (conflicts=0) at jp = us_addr - delta, the chunk can
be split into that many named JP labels — each at its proven JP address, carrying
exactly the JP bytes for that sub-object.

Byte-neutral: each label sits at its real JP VMA and the incbins together cover the
exact original chunk bytes with NO padding (no .align), so the linked ROM is
unchanged. make compare proves it.

The split rewrites:
  * asm/data_<addr>.s            -> one .global+label+.incbin per sub-object
  * layout/carved_rom.d/data_<addr>.tsv -> one carved_rom row per sub-object
    (each row still points at asm/data_<addr>.o, distinct sub-sections).

Input: a JSON list of {start, end, parts:[[jp_addr, name], ...]} (absolute VMAs).
Usage: scripts/split_data_residue.py <spec.json> [--dry-run]
"""
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
BASE = 0x08000000


def existing_labels():
    labels = set()
    for dp, _dn, fns in os.walk("asm"):
        for fn in fns:
            if fn.endswith((".s", ".inc")):
                try:
                    t = open(os.path.join(dp, fn), errors="replace").read()
                except OSError:
                    continue
                labels.update(re.findall(r"^\s*\.global\s+(\S+)", t, re.M))
    return labels


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    dry = "--dry-run" in sys.argv[1:]
    spec = json.load(open(args[0]))
    have = existing_labels()

    done = 0
    names = 0
    skipped = []
    for ch in spec:
        start, end = ch["start"], ch["end"]
        parts = ch["parts"]
        addr = f"{start:08X}"
        asm = f"asm/data_{addr}.s"
        frag = f"layout/carved_rom.d/data_{addr}.tsv"
        if not os.path.exists(asm):
            skipped.append((addr, "asm missing"))
            continue
        # sanity: parts sorted, within [start,end), names not already labels
        ja = [p[0] for p in parts]
        if ja != sorted(ja) or ja[0] != start or ja[-1] >= end:
            skipped.append((addr, "parts not ordered/in-range"))
            continue
        clash = [p[1] for p in parts if p[1] in have]
        if clash:
            skipped.append((addr, f"name already a label: {clash}"))
            continue
        if dry:
            done += 1
            names += len(parts)
            continue
        # the chunk's committed extracted bytes (SELF-CONTAINED source — NOT
        # baserom.gba). Each sub-object incbins a slice of this same file so
        # self-containment is preserved and the bytes are byte-identical.
        binf = f"data/residual/data_{addr}.bin"
        if not os.path.exists(binf):
            skipped.append((addr, f"residual bin missing: {binf}"))
            continue
        # emit asm: one section per sub-object (address-keyed unique section names)
        body = [
            f"@ data_{addr}: region-different residue split into {len(parts)} named US",
            f"@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,",
            f"@ per-boundary confirmed); incbins slice the committed residual .bin (NOT",
            f"@ baserom.gba) so self-containment is kept and the ROM is byte-identical.",
            f"@ make compare is the oracle.",
            "",
        ]
        rows = []
        for i, (ja_i, name) in enumerate(parts):
            hi = parts[i + 1][0] if i + 1 < len(parts) else end
            sz = hi - ja_i
            off = ja_i - start  # offset of this sub-object within the residual .bin
            sec = f".data.residue.{ja_i:08X}"
            body.append(f'\t.section {sec}, "a", %progbits')
            body.append(f"\t.global {name}")
            body.append(f"{name}:")
            body.append(f'\t.incbin "{binf}", 0x{off:X}, 0x{sz:X}')
            body.append("")
            rows.append((ja_i - BASE, hi - BASE, f"asm/data_{addr}.o({sec})",
                         f"{name} region-diff data ({sz} B, residue split D38)"))
            have.add(name)
        open(asm, "w").write("\n".join(body) + "\n")
        with open(frag, "w") as f:
            f.write("# carve_incbin_residue.py residue split into named US objects (D38)\n")
            for s, e, obj, desc in rows:
                f.write(f"{s:06X}\t{e:06X}\t{obj}\t{desc}\n")
        done += 1
        names += len(parts)

    print(f"{'DRY-RUN ' if dry else ''}split {done} chunks into {names} named labels")
    for a, w in skipped:
        print(f"  SKIP data_{a}: {w}")


if __name__ == "__main__":
    main()
