#!/usr/bin/env python3
"""Re-apply per-object edits from layout/patches.tsv to a freshly-compiled .o.

Some carved TUs reference region-different ROM data left in the incbin baseline (placed
NOLOAD at its JP address — see port_run). Making that work needs two .o edits that the
build would otherwise lose when it regenerates the object from src/*.c, so this script
re-applies them after every compile (invoked from the Makefile C rule):

  ALIGN rows  `obj  section  ALIGN  N`        -> set the section's alignment to N bytes,
                                                so the linker places it at its (maybe
                                                non-4-aligned) JP base exactly.
  byte rows   `obj  section  offset_hex  val` -> rewrite 4 bytes at the section offset
                                                (a reloc addend = jp[ref]-base). Editing
                                                the section's FILE bytes preserves the
                                                relocations (separate .rel section), so
                                                they still fire: base+addend = jp[ref].

ALIGN rows are applied first (objcopy rewrites the file), then byte rows (direct write,
using fresh section offsets). No-op (exit 0) when the manifest or object is missing or
has no rows for this object.
"""
import sys, os, subprocess

if len(sys.argv) < 2:
    sys.exit(0)
obj = sys.argv[1]
base = os.path.basename(obj)
import glob
# Read the monolith plus any per-task fragments under layout/patches.d/*.tsv, so a
# parallel carve (carve_exact / carve_data_refs) that wrote its patch rows to its own
# fragment is still applied. Rows are keyed by object basename, so distinct objects
# never collide and fragment order is irrelevant.
manifests = (["layout/patches.tsv"] if os.path.exists("layout/patches.tsv") else []) \
    + sorted(glob.glob("layout/patches.d/*.tsv"))
if not manifests or not os.path.exists(obj):
    sys.exit(0)
rows = [l.rstrip("\n").split("\t") for m in manifests for l in open(m)
        if l.strip() and not l.startswith("#")]
mine = [r for r in rows if len(r) >= 4 and r[0] == base]
if not mine:
    sys.exit(0)

# 1) alignment edits (objcopy rewrites the file)
for r in mine:
    if r[2] == "ALIGN":
        subprocess.run(["arm-none-eabi-objcopy", "--set-section-alignment",
                        f"{r[1]}={int(r[3])}", obj, obj], check=False)

# 2) byte edits (direct file write; needs fresh section offsets after the objcopy above)
byte_rows = [r for r in mine if r[2] != "ALIGN"]
if byte_rows:
    secfoff = {}
    for l in subprocess.run(["arm-none-eabi-objdump", "-h", obj],
                            capture_output=True, text=True).stdout.splitlines():
        p = l.split()
        if len(p) >= 6 and p[0].isdigit() and all(c in "0123456789abcdef" for c in p[5]):
            secfoff[p[1]] = int(p[5], 16)
    raw = bytearray(open(obj, "rb").read())
    for r in byte_rows:
        fo = secfoff.get(r[1])
        if fo is not None:
            off, val = int(r[2], 16), int(r[3], 16)
            raw[fo + off:fo + off + 4] = val.to_bytes(4, "little")
    open(obj, "wb").write(raw)
