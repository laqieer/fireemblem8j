#!/usr/bin/env python3
"""Repoint `Base + hardcoded_offset` pointer words that cross a resource boundary
onto the *nearest global symbol that actually owns the target address* (Layer 1b
of the shiftability harness, scan_offsets.py, flags these).

A stored pointer written `Base + 0xNN` whose value lands inside a *different*
resource does not track under shift if Base and the real target move
independently. The shiftable form references the owning resource directly:
`Owner + 0x<addend>` (addend 0 when it hits the start). This rewrite is
byte-identical (same numeric value -> `make compare` stays OK) and, because the
new base *is* the owner, scan_offsets no longer treats it as cross-resource and
can never mis-bucket it HIGH (b_start == t_start is skipped).

Idempotent and re-runnable. Only rewrites `.4byte`/inline-asm pointer tokens whose
current base is one of --bases and for which a *closer* referenceable global owns
the value. Prints every rewrite; use --apply to write.

    python3 scripts/shiftcheck/repoint_crossres_offsets.py \
        --bases frontier_df4_voice_000b_1F5898,data_08AAFCAC,gProcScr_opinfogaugedraw \
        src/data/gClassReelData_ref/dat_gClassReelData_ref.s \
        src/data/frontier_df4_menu/frontier_df4_menu.c --apply
"""
import argparse
import bisect
import re
import subprocess
import sys

ROM_BASE = 0x08000000
ROM_HI = 0x0A000000


def load_globals(elf, prefix):
    """Return (sorted addrs, {addr: name}) for referenceable GLOBAL symbols in ROM.

    nm uppercase type == external/global (referenceable from another object);
    skip section / dot-prefixed symbols. Prefer the first name seen per address."""
    out = {}
    for ln in subprocess.run([prefix + "nm", elf], capture_output=True, text=True,
                             check=True).stdout.splitlines():
        p = ln.split()
        if len(p) < 3:
            continue
        addr, typ, name = p[0], p[1], " ".join(p[2:])
        if len(typ) != 1 or not typ.isupper() or typ == "U":
            continue  # locals (lowercase) / undefined are not referenceable
        if name.startswith(".") or typ in ("A",) and name.startswith("_"):
            continue
        try:
            a = int(addr, 16)
        except ValueError:
            continue
        if not (ROM_BASE <= a < ROM_HI):
            continue
        out.setdefault(a, name)
    addrs = sorted(out)
    return addrs, out


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("files", nargs="+")
    ap.add_argument("--bases", required=True,
                    help="comma-separated base symbol names to repoint from")
    ap.add_argument("--ref-elf", default="fireemblem8.elf")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--apply", action="store_true")
    args = ap.parse_args()

    addrs, byaddr = load_globals(args.ref_elf, args.prefix)
    name2addr = {}
    for a in addrs:
        name2addr.setdefault(byaddr[a], a)
    bases = args.bases.split(",")
    for b in bases:
        if b not in name2addr:
            sys.exit(f"base symbol not found as global: {b}")

    def owner(v):
        i = bisect.bisect_right(addrs, v) - 1
        return (addrs[i], byaddr[addrs[i]]) if i >= 0 else (None, None)

    # match "<base> + 0x<hex>"  (also bare "<base>" with no offset == +0)
    base_alt = "|".join(re.escape(b) for b in bases)
    rx = re.compile(r"\b(" + base_alt + r")\b(\s*\+\s*0x([0-9A-Fa-f]+))?")
    total = 0
    for path in args.files:
        text = open(path).read()
        n = [0]

        def repl(m):
            base = m.group(1)
            off = int(m.group(3), 16) if m.group(3) else 0
            val = name2addr[base] + off
            oaddr, oname = owner(val)
            if oname is None or oname == base:
                return m.group(0)  # already owns it
            addend = val - oaddr
            if addend < 0:
                return m.group(0)  # never emit a negative addend
            n[0] += 1
            new = oname if addend == 0 else f"{oname} + 0x{addend:X}"
            print(f"  {path}: {m.group(0)}  ->  {new}   "
                  f"(0x{val:08X} = {oname}+0x{addend:X})")
            return new

        newtext = rx.sub(repl, text)
        total += n[0]
        if n[0] and args.apply:
            open(path, "w").write(newtext)
    print(f"# {'APPLIED' if args.apply else 'DRY-RUN'} rewrites: {total}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
