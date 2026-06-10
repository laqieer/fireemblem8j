#!/usr/bin/env python3
"""Re-root sound `.incbin "baserom.gba"` directives to committed `data/sound/*.bin`.

The remaining sound classes (voicegroups, m4a tables, gMPlayTable, song bodies,
frontier voice gaps) are region-different / table-pinned data that cannot be
byte-copied from US source at the same offset, so they are carried as
byte-perfect incbin. To make the build self-contained (no `baserom.gba`), this
re-roots each such incbin to a COMMITTED `data/sound/<symbol>.bin` blob — exactly
the established `data/banim/*.bin` pattern (committed `.bin` = source of truth for
region-different data; see D33 takeaway and the dat_banim_* files).

Every targeted `.incbin "baserom.gba", off, len` is immediately preceded by its
own `<label>:` (verified 1:1), so the extracted blob is named after that label.
The bytes are byte-identical to the ROM region, so `make compare` is unchanged
(the oracle). `.bin` files are COMMITTED (not gitignored) because they are the
self-contained source — unlike the aif2pcm `.bin` which are regenerated from
`.aif`.

Usage: scripts/sound/reroot_sound_incbin.py [file ...]   # default: all sound .s
"""
import glob
import os
import re
import sys

os.chdir(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

BASEROM = "baserom.gba"
OUTDIR = "data/sound"
INCBIN_RE = re.compile(
    r'^(\s*)\.incbin\s+"baserom\.gba"\s*,\s*(0x[0-9a-fA-F]+)\s*,\s*(0x[0-9a-fA-F]+)\s*$'
)
LABEL_RE = re.compile(r'^([A-Za-z_]\w*):\s*$')


def sound_files():
    pats = [
        "asm/snd_song*.s",
        "asm/snd_banim_efxsound_data_*.s",
        "asm/dat_voicegroup*_ref.s",
        "asm/dat_m4a_tables.s",
        "asm/dat_gMPlayTable_ref.s",
        "asm/dat_gMPlayJumpTableTemplate_ref.s",
        "asm/frontier_df3_voicegroup.s",
        "asm/frontier_df4_voice.s",
    ]
    out = []
    for p in pats:
        out += glob.glob(p)
    return sorted(set(out))


def main():
    files = sys.argv[1:] or sound_files()
    rom = open(BASEROM, "rb").read()
    os.makedirs(OUTDIR, exist_ok=True)
    total_dirs = 0
    total_bytes = 0
    used_names = {}
    for path in files:
        lines = open(path).read().splitlines(keepends=True)
        out_lines = []
        changed = False
        for line in lines:
            m = INCBIN_RE.match(line.rstrip("\n"))
            if not m:
                out_lines.append(line)
                continue
            indent, off_s, len_s = m.group(1), m.group(2), m.group(3)
            off, length = int(off_s, 16), int(len_s, 16)
            # label is the immediately preceding label line
            lbl = None
            for j in range(len(out_lines) - 1, -1, -1):
                t = out_lines[j].strip()
                if t == "" or t.startswith("@") or t.startswith(".global") or t.startswith(".align"):
                    continue
                lm = LABEL_RE.match(t)
                if lm:
                    lbl = lm.group(1)
                break
            if lbl is None:
                lbl = "sound_%06X" % off
            name = lbl
            if name in used_names and used_names[name] != off:
                name = "%s_%06X" % (lbl, off)
            used_names[name] = off
            blob = rom[off:off + length]
            assert len(blob) == length, "%s: short read at %s" % (path, off_s)
            binpath = os.path.join(OUTDIR, name + ".bin")
            with open(binpath, "wb") as f:
                f.write(blob)
            out_lines.append('%s.incbin "%s"\n' % (indent, binpath))
            changed = True
            total_dirs += 1
            total_bytes += length
        if changed:
            with open(path, "w") as f:
                f.writelines(out_lines)
            print("rerooted %s" % path)
    print(
        "re-rooted %d incbin directives (%d bytes) into %s/*.bin"
        % (total_dirs, total_bytes, OUTDIR)
    )


if __name__ == "__main__":
    main()
