#!/usr/bin/env python3
"""Generic Phase-1 LZ-graphics extractor: ROM blob -> committed source asset.

Many FE8J graphics `.s` files are a flat list of `.global Sym` + `.incbin
"baserom.gba", off, size` where each blob is an LZ77-compressed graphic (tiles,
tilemap, or palette). FE8U commits the *editable* source (a `.png`/`.bin`/`.pal`)
and rebuilds the `.lz` with a per-asset tool (gbagfx, or FETSATOOL for the
dedup'd btl_bg tile arrangements). FETSATOOL is NOT part of the FE8J toolchain,
so for those subsystems we instead commit the **decompressed blob itself** as a
descriptively-named binary source and let the Makefile's generic `%.lz: %` rule
(gbagfx) recompress it byte-identically. This is honest extraction: the committed
`.feimg3.bin` / `.fetsa3.bin` / `.pal` rebuilds the exact ROM bytes with
`baserom.gba` removed from the build graph.

The only oracle is byte-exactness: every committed source, rebuilt through the
SAME pipeline the Makefile uses (gbagfx LZ at the pinned -mindist; palettes via
`.pal -> .gbapal -> .lz`), MUST equal the original JP ROM blob. Entries that fail
to decompress/round-trip are reported and LEFT as `.incbin "baserom.gba"`.

This is region-agnostic: it extracts from the JP ROM directly, so it works for
both region-SAME and region-DIFFERENT blobs (no dependence on the US asset).

A per-subsystem driver imports `run_subsystem()` and passes:
  - asm: the JP `.s` file (relative to repo root)
  - out_dir: graphics/<subsystem> committed-source dir
  - obj: the `asm/<file>.o` target for the .mk deps
  - suffix_map: dict mapping a symbol-name regex -> (source_ext, lz_chain) where
      source_ext is the committed-source extension (e.g. ".feimg3.bin", ".pal")
      and lz_chain is the Makefile target the incbin points at (e.g.
      ".feimg3.bin.lz", ".gbapal.lz"). For palettes the committed source is a
      JASC `.pal` (the `.gbapal` is a gitignored intermediate).
  - name_fn: optional symbol-name -> committed-source stem (default: the symbol).

It writes committed sources, rewrites the incbins, and emits/refreshes the
subsystem `.mk` (object deps + non-default -mindist pins). Returns a stats dict.
"""
import os
import re
import subprocess
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
GBAGFX = os.path.join(REPO, "tools", "gbagfx", "gbagfx")

INCBIN_RE = re.compile(
    r'^(\s*)\.incbin\s+"baserom\.gba"\s*,\s*(0x[0-9A-Fa-f]+)\s*,\s*(0x[0-9A-Fa-f]+)'
)
GLOBAL_RE = re.compile(r"^\s*\.global\s+(\S+)")


def _gbagfx(args):
    subprocess.run([GBAGFX, *args], check=True, capture_output=True)


def lz_decompress(blob):
    fd, src = tempfile.mkstemp(suffix=".lz")
    os.close(fd)
    fd, dst = tempfile.mkstemp(suffix=".bin")
    os.close(fd)
    try:
        open(src, "wb").write(blob)
        _gbagfx([src, dst])
        return open(dst, "rb").read()
    finally:
        os.unlink(src)
        os.unlink(dst)


def lz_compress(raw, mindist):
    fd, src = tempfile.mkstemp(suffix=".bin")
    os.close(fd)
    fd, dst = tempfile.mkstemp(suffix=".lz")
    os.close(fd)
    try:
        open(src, "wb").write(raw)
        _gbagfx([src, dst, "-mindist", str(mindist)])
        return open(dst, "rb").read()
    finally:
        os.unlink(src)
        os.unlink(dst)


def gbapal_to_pal(gbapal_bytes):
    """Decompressed palette bytes (gbapal) -> JASC .pal source bytes (committable)."""
    fd, g = tempfile.mkstemp(suffix=".gbapal")
    os.close(fd)
    fd, p = tempfile.mkstemp(suffix=".pal")
    os.close(fd)
    try:
        open(g, "wb").write(gbapal_bytes)
        _gbagfx([g, p])
        return open(p, "rb").read()
    finally:
        os.unlink(g)
        os.unlink(p)


def pal_to_gbapal(pal_bytes):
    fd, p = tempfile.mkstemp(suffix=".pal")
    os.close(fd)
    fd, g = tempfile.mkstemp(suffix=".gbapal")
    os.close(fd)
    try:
        open(p, "wb").write(pal_bytes)
        _gbagfx([p, g])
        return open(g, "rb").read()
    finally:
        os.unlink(p)
        os.unlink(g)


def parse_entries(text):
    entries = []
    pending = []
    for i, line in enumerate(text.splitlines()):
        m = GLOBAL_RE.match(line)
        if m:
            pending.append(m.group(1))
            continue
        m = INCBIN_RE.match(line)
        if m:
            entries.append((pending, m.group(1), int(m.group(2), 16), int(m.group(3), 16), i))
            pending = []
    return entries


def classify(names, suffix_map):
    """Return (source_ext, lz_target_ext) for the first symbol matching a regex."""
    for nm in names:
        for pat, (src_ext, lz_ext) in suffix_map:
            if re.search(pat, nm):
                return nm, src_ext, lz_ext
    return None, None, None


def run_subsystem(asm, out_dir, obj, suffix_map, name_fn=None, apply=False, mk_header=None):
    name_fn = name_fn or (lambda s: s)
    rom = open(os.path.join(REPO, "baserom.gba"), "rb").read()
    asm_path = os.path.join(REPO, asm)
    text = open(asm_path).read()
    lines = text.splitlines()
    entries = parse_entries(text)

    stats = dict(total=len(entries), ok=0, skip=0, fail=0)
    deps = []
    pins = {}
    commits = {}  # abspath -> bytes

    for names, indent, off, size, ln in entries:
        sym, src_ext, lz_ext = classify(names, suffix_map)
        if sym is None:
            stats["skip"] += 1
            continue
        blob = rom[off : off + size]
        stem = name_fn(sym)

        # raw (uncompressed) palette: lz_ext == ".gbapal" -> commit a JASC .pal and
        # verify .pal -> .gbapal == the verbatim ROM blob (no LZ involved).
        if lz_ext == ".gbapal":
            pal_bytes = gbapal_to_pal(blob)
            if pal_to_gbapal(pal_bytes) != blob:
                stats["fail"] += 1
                print(f"  RAWPAL_NO_MATCH {sym} @ {off:#x} -- left as incbin")
                continue
            inc_rel = f"{out_dir}/{stem}{lz_ext}"  # incbin the rebuilt .gbapal
            stats["ok"] += 1
            if apply:
                commits[os.path.join(REPO, f"{out_dir}/{stem}{src_ext}")] = pal_bytes
                lines[ln] = f'{indent}.incbin "{inc_rel}"'
                deps.append(inc_rel)
            continue

        if not blob or blob[0] != 0x10:  # not LZ77
            stats["fail"] += 1
            print(f"  NOT_LZ {names[0]} @ {off:#x} ({size:#x}) -- left as incbin")
            continue
        raw = lz_decompress(blob)
        is_pal = lz_ext.endswith(".gbapal.lz")

        if is_pal:
            pal_bytes = gbapal_to_pal(raw)
            # verify .pal -> .gbapal -> .lz round-trips to the ROM blob
            gbapal = pal_to_gbapal(pal_bytes)
            mindist = None
            for md in (2, 1, 3):
                if lz_compress(gbapal, md) == blob:
                    mindist = md
                    break
            if mindist is None:
                stats["fail"] += 1
                print(f"  PAL_NO_MATCH {sym} @ {off:#x} -- left as incbin")
                continue
            commit_rel = f"{out_dir}/{stem}{src_ext}"  # .pal
            commit_bytes = pal_bytes
        else:
            mindist = None
            for md in (2, 1, 3):
                if lz_compress(raw, md) == blob:
                    mindist = md
                    break
            if mindist is None:
                stats["fail"] += 1
                print(f"  LZ_NO_MATCH {sym} @ {off:#x} -- left as incbin")
                continue
            commit_rel = f"{out_dir}/{stem}{src_ext}"  # the decompressed binary
            commit_bytes = raw

        inc_rel = f"{out_dir}/{stem}{lz_ext}"
        stats["ok"] += 1
        if apply:
            commits[os.path.join(REPO, commit_rel)] = commit_bytes
            lines[ln] = f'{indent}.incbin "{inc_rel}"'
            deps.append(inc_rel)
            if mindist != 2:
                pins[inc_rel] = mindist

    if apply and stats["ok"]:
        with open(asm_path, "w") as f:
            f.write("\n".join(lines) + "\n")
        for dst, data in commits.items():
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            open(dst, "wb").write(data)
        _write_mk(out_dir, obj, deps, pins, mk_header)

    print(f"{asm}: total={stats['total']} ok={stats['ok']} "
          f"skip(non-gfx)={stats['skip']} fail(left-incbin)={stats['fail']}")
    return stats


def _write_mk(out_dir, obj, deps, pins, mk_header):
    mk = os.path.join(REPO, out_dir, os.path.basename(out_dir) + ".mk")
    block = []
    if mk_header:
        block += [f"# {l}" for l in mk_header.splitlines()] + [""]
    deps = sorted(set(deps))
    if deps:
        block.append(f"{obj}: \\")
        for i, d in enumerate(deps):
            block.append(f"  {d}{'' if i == len(deps) - 1 else ' \\'}")
        block.append("")
    if pins:
        block.append("# non-default -mindist pins (gbagfx default is 2):")
        for inc in sorted(pins):
            block.append(f"{inc}: LZ_FLAGS := -mindist {pins[inc]}")
        block.append("")
    with open(mk, "w") as f:
        f.write("\n".join(block) + "\n")
