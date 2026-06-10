#!/usr/bin/env python3
"""Re-root EVERY remaining NON-SOUND `.incbin "baserom.gba"` onto committed source.

This is the Phase-1 self-containment final sweep. After graphics sheets, banim
OAM/motion data, and the direct-sound samples were extracted, the residual
baserom dependence is ~1.06 MB of region-different game-data tables, residue
blobs, and opaque graphics across ~1,920 `asm/*.s` files. fireemblem8u's model
for opaque / region-specific data is to commit a descriptively-NAMED binary and
`.incbin` THAT (never the ROM) -- exactly what `data/banim/*.bin` already does.

For each `.incbin "baserom.gba", <off>, <size>` directive in a non-sound
`asm/*.s` file this script:

  1. Reads the blob from baserom.gba.
  2. Writes it to a COMMITTED `data/residual/<symbol>.bin` (named by the symbol
     that owns the directive; address-derived for the rare label-less directive).
  3. Rewrites the directive to `.incbin "data/residual/<name>.bin"`, keeping the
     named `.global` symbol intact.

This is byte-identical BY CONSTRUCTION (the committed `.bin` is exactly the JP
bytes), removes the `baserom.gba` build-graph edge for these directives, and a
SINGLE `make compare` at the end verifies all of them (the bytes are unchanged).

SOUND files are EXCLUDED (a separate sound agent owns them): anything matching
the sound name patterns (snd_/song/voice/voicegroup/sound/m4a/bgm/...) or the
named sound tables. baserom.gba is needed ONCE here to extract the committed
bytes; it is NOT a build input afterward.

Run from the repo root with baserom.gba present.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

BASEROM = os.path.join(ROOT, "baserom.gba")
ASM_DIR = os.path.join(ROOT, "asm")
OUT_DIR = os.path.join(ROOT, "data", "residual")

# --- SOUND exclusion (a sound agent owns these; do NOT touch) ------------------
# Match on the file *name*. Covers song/voice asset data, the m4a sound ENGINE
# code + per-function .s, the BGM/sound wrappers, and the named sound tables.
# Tokens are anchored at a word boundary (start, or after `_`) AND followed by a
# separator/digit/end so we do NOT false-match `se` in "Seth" or `sound` in
# "soundwrapper"-prefixed *graphics* (e.g. df3_fontgrp_se is FONT data, kept).
# The genuine sound-engine code files are listed explicitly by prefix.
SOUND_NAME_RE = re.compile(
    # song / voice / direct-sound DATA + tables (any position, clearly sound)
    r"voicegroup|voice|(^|_)song(_|[0-9]|\.|$)|(^|_)snd(_|[0-9]|\.|$)"
    r"|direct_sound|gSoundRoomTable|MusicProc|m4a_tables|efxsound|sappy"
    # m4a sound-engine code: m4a_1.s, per-function m4a*/MPlay*/Sound*.s, and the
    # stranded_m4a / stranded_soundwrapper code blobs (all sound-agent-owned).
    r"|(^|_)m4a|(^|_)MPlay|^Sound[A-Z]|stranded_sound",
    re.IGNORECASE,
)

# GENERATED .s files (regenerated at build time from manifests/text source) must
# never be rewritten -- they are gitignored and reproduced by the build.
GENERATED_S = {"baserom.s", "jp_syms.s", "msg_data.s"}

# A bare `NAME:` label line (the symbol that owns the following incbin).
LABEL_RE = re.compile(r"^([A-Za-z_.][A-Za-z0-9_.$]*):\s*$")
# `.incbin "baserom.gba", <off>, <size>` (offsets/sizes hex or decimal).
INCBIN_RE = re.compile(
    r'^(\s*)\.incbin\s+"baserom\.gba"\s*,\s*'
    r'(0x[0-9A-Fa-f]+|\d+)\s*,\s*'
    r'(0x[0-9A-Fa-f]+|\d+)\s*$'
)


def parse_int(tok):
    return int(tok, 16) if tok.lower().startswith("0x") else int(tok)


def is_sound(fname):
    return bool(SOUND_NAME_RE.search(fname))


def safe_name(name):
    # Symbol names in this repo are already filesafe ([A-Za-z0-9_.$]); '$' and
    # '.' are legal in filenames but normalize '$' -> '_' to be safe on all FS.
    return name.replace("$", "_")


def main():
    if not os.path.isfile(BASEROM):
        sys.exit("baserom.gba not found (needed once to extract the committed bytes)")
    rom = open(BASEROM, "rb").read()
    rom_len = len(rom)
    os.makedirs(OUT_DIR, exist_ok=True)

    targets = sorted(
        fn for fn in os.listdir(ASM_DIR)
        if fn.endswith(".s") and not is_sound(fn) and fn not in GENERATED_S
    )

    grand_files = 0
    grand_bytes = 0
    touched_files = 0
    used_names = {}  # bin basename -> source .s (collision guard)

    for fn in targets:
        path = os.path.join(ASM_DIR, fn)
        text = open(path, "r", encoding="utf-8").read()
        if '"baserom.gba"' not in text:
            continue
        lines = text.splitlines(keepends=True)
        out = []
        cur_label = None
        n_files = 0
        n_bytes = 0
        for line in lines:
            stripped = line.rstrip("\n")
            m_lab = LABEL_RE.match(stripped)
            if m_lab:
                cur_label = m_lab.group(1)
                out.append(line)
                continue
            m_inc = INCBIN_RE.match(stripped)
            if not m_inc:
                out.append(line)
                continue
            indent, off_tok, size_tok = m_inc.groups()
            off = parse_int(off_tok)
            size = parse_int(size_tok)
            # Name the .bin by the owning symbol; fall back to file+address for
            # the rare label-less directive (e.g. pilot_*.s).
            if cur_label is not None:
                base = safe_name(cur_label)
            else:
                stem = os.path.splitext(fn)[0]
                base = f"{safe_name(stem)}_{off:06X}"
            if base in used_names and used_names[base] != fn:
                sys.exit(
                    f"name collision: {base}.bin wanted by both "
                    f"{used_names[base]} and {fn}"
                )
            used_names[base] = fn
            if off + size > rom_len:
                sys.exit(f"{fn}: {base} range 0x{off:X}+0x{size:X} runs past ROM end")
            blob = rom[off:off + size]
            bin_rel = f"data/residual/{base}.bin"
            with open(os.path.join(ROOT, bin_rel), "wb") as fh:
                fh.write(blob)
            out.append(f'{indent}.incbin "{bin_rel}"\n')
            n_files += 1
            n_bytes += size
            cur_label = None  # consumed by this incbin
        if n_files:
            with open(path, "w", encoding="utf-8") as fh:
                fh.write("".join(out))
            touched_files += 1
            grand_files += n_files
            grand_bytes += n_bytes

    print(f"re-rooted {grand_files} `.incbin baserom.gba` -> data/residual/*.bin")
    print(f"  across {touched_files} non-sound asm/*.s files")
    print(f"  {grand_bytes} bytes ({grand_bytes / 1024:.1f} KB) removed from baserom dependence")
    print(f"  sound files skipped (owned by sound agent): "
          f"{sum(1 for fn in os.listdir(ASM_DIR) if fn.endswith('.s') and is_sound(fn))}")


if __name__ == "__main__":
    main()
