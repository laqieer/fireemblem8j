#!/usr/bin/env python3
"""Generate src/data/map/data_map_change.c (typed C) from the fe8u assembly
source (src/data/map/data_map_change.s + change/*.inc).

The fe8u region is structurally identical to the JP ROM: the JP differences are
(a) pointer relocations, resolved by the linker because the table entries
reference the tile arrays by C symbol, and (b) a small number of tile-value
edits (region-different map content). The optional --jp-fixups file lists those
byte edits so the emitted C reproduces JP bytes exactly.

Usage:
    gen_data_map_change.py <us_src_dir> <out.c>
"""
import os
import re
import sys

# region-different tile-value fixups, keyed by (array_name, index) -> u16 value.
# Discovered by diffing US vs JP ROM over the data_map_change region.
JP_FIXUPS = {
    # Ch14EirikaMapChanges_change_1: US .short 0x0CD0 -> JP 0x0C40 (one tile id)
    ("Ch14EirikaMapChanges_change_1", "0x0CD0_to_0x0C40"): None,
}


def parse_inc(path):
    """Parse a change/*.inc map-change table into a list of entries.
    Each entry is (id, x, y, w, h, pad0, pad1, pad2, tiles_symbol_or_None).
    The terminator `.word 0xff, 0, 0` becomes (-1,0,0,0,0,0,0,0,None)."""
    entries = []
    pending = None  # the .byte header awaiting its .word
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("//"):
                continue
            if line.startswith(".byte"):
                vals = [v.strip() for v in line[len(".byte"):].split(",")]
                # header: id, x, y, w, h, 0, 0, 0
                assert len(vals) == 8, (path, line)
                pending = [int(v, 0) for v in vals]
            elif line.startswith(".word"):
                vals = [v.strip() for v in line[len(".word"):].split(",")]
                if pending is not None and len(vals) == 1:
                    sym = vals[0]
                    entries.append(tuple(pending) + (sym,))
                    pending = None
                else:
                    # terminator: .word 0xff, 0, 0
                    assert pending is None
                    ints = [int(v, 0) for v in vals]
                    assert ints == [0xFF, 0, 0], (path, line)
                    entries.append((-1, 0, 0, 0, 0, 0, 0, 0, None))
            else:
                raise SystemExit("unexpected inc line in %s: %r" % (path, line))
    return entries


def c_id(v):
    return str(v if v < 128 else v - 256)


def emit_table(name, entries, out):
    # static: the ldscript pulls this object's whole .data section by explicit
    # placement, so static tables are retained (no --gc-sections). Keeping them
    # static avoids symbol collisions with the misattributed dat_*Changes_ref
    # carves, which apply these (wrong) US names to unrelated JP data at
    # 0x08A5Bxxx-0x08A5Exxx. Nothing in the JP build references these tables by
    # name (gChapterDataAssetTable points at them by address).
    out.append("static const struct MapChange %s[] = {" % name)
    for e in entries:
        idv, x, y, w, h, p0, p1, p2, sym = e
        if idv == -1 and sym is None:
            out.append("    { -1, 0, 0, 0, 0, NULL },")
        else:
            ptr = "NULL" if sym is None else sym
            out.append(
                "    { %s, %d, %d, %d, %d, %s }," % (c_id(idv), x, y, w, h, ptr)
            )
    out.append("};")
    out.append("")


def main():
    us_dir, outc = sys.argv[1], sys.argv[2]
    s_path = os.path.join(us_dir, "data_map_change.s")
    out = []
    out.append('#include "global.h"')
    out.append("")
    out.append("/* Map-change / tile-change tables, one per map. Ported from")
    out.append(" * fireemblem8u src/data/map/data_map_change.s into typed C. The whole")
    out.append(" * region is one TU so the in-table pointers resolve to the contiguous")
    out.append(" * JP addresses at link time (placed at JP 0x08A9B024). Region-different")
    out.append(" * from fe8u only in pointer relocations + a single tile id; see")
    out.append(" * scripts/gen_data_map_change.py JP_FIXUPS. */")
    out.append("")

    # forward declarations of tile arrays are unnecessary in C89 if defined
    # before use; the .s defines every *_change_N before its table, so source
    # order already satisfies use-after-definition.

    cur_short_name = None
    cur_short_vals = []

    def flush_short():
        nonlocal cur_short_name, cur_short_vals
        if cur_short_name is not None:
            # apply JP fixup
            if cur_short_name == "Ch14EirikaMapChanges_change_1":
                # US: 0x09F4,0x0A6C,0x0AE4,...; the differing element is value 0x0CD0->0x0C40
                cur_short_vals = [0x0C40 if v == 0x0CD0 else v for v in cur_short_vals]
            vals = ", ".join("0x%04X" % v for v in cur_short_vals)
            out.append("static const u16 %s[] = { %s };" % (cur_short_name, vals))
            cur_short_name = None
            cur_short_vals = []

    pending_global = None
    with open(s_path) as f:
        lines = f.readlines()

    i = 0
    while i < len(lines):
        raw = lines[i].rstrip("\n")
        line = raw.strip()
        i += 1
        if line.startswith(".section") or line.startswith(".align") or not line:
            continue
        if line.startswith(".global"):
            pending_global = line.split()[1]
            continue
        if line.endswith(":") or re.match(r"^[A-Za-z0-9_]+:\s*(@.*)?$", line):
            # label line e.g. "Name: @0x..."
            name = line.split(":")[0].strip()
            flush_short()
            pending_global = name
            continue
        if line.startswith(".short"):
            if cur_short_name is None:
                cur_short_name = pending_global
            vals = [int(v.strip(), 0) for v in line[len(".short"):].split(",")]
            cur_short_vals.extend(vals)
            continue
        if line.startswith(".include"):
            flush_short()
            m = re.search(r'"([^"]+)"', line)
            incfile = os.path.join(us_dir, "change", os.path.basename(m.group(1)))
            entries = parse_inc(incfile)
            emit_table(pending_global, entries, out)
            continue
        raise SystemExit("unhandled line: %r" % raw)
    flush_short()

    with open(outc, "w") as f:
        f.write("\n".join(out) + "\n")
    print("wrote", outc, "(%d lines)" % len(out))


if __name__ == "__main__":
    main()
