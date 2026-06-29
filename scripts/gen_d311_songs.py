#!/usr/bin/env python3
"""D311 music scale-up: un-tile ALL fragmented JP songs into editable fe8u .mid form.

SELF-CONTAINED (the invariant the prior attempt broke): every byte in the song
region must be produced from committed source. A song .o (built from the editable
.mid) provides the song's own span; the NON-song remnant of any residue object
that straddles a song boundary is re-carved into a COMMITTED source .bin (extracted
from baserom ONCE here, at carve time) — never left to gen_layout's baserom
auto-incbin (which fails CI's no-baserom build).

For every snd_song<NNN> dir under src/data/, this:
  1. Reads the song's true ROM span [min(track ptrs), header_end) and its voicegroup
     (tone ptr) from gSongTable @ 0x08214120 in baserom.gba (authoritative).
  2. Replaces every manifest row OVERLAPPING that span with ONE song .o row over the
     full span. For a residue row that only PARTIALLY overlaps (straddles), it splits:
       - fully consumed (remnant empty)   -> drop the row, prune its df4 array.
       - one remnant interval [rs, re)     -> re-carve: extract [rs,re) from baserom
         into a committed .bin, repoint the manifest row + INCBIN .c (df4) or replace
         the de-pointered residue .c with a clean INCBIN of the remnant (data_08*),
         and add a baseline alias data_08ADDR=0x08ADDR so external +off refs resolve.
  3. Deletes the redundant fragment/worldmap src objects fully consumed by a span.
  4. Binds each voicegroup symbol to its JP tone address; binds every old fragment
     symbol a SURVIVING object still references to its JP absolute address.
  5. Copies the fe8u .mid into sound/songs/midi/ and writes sound/songs.mk rules.

make clean && make compare (with baserom) AND a no-baserom `make` (self-containment)
are the gates. See docs/sound.md D311.
"""
import os, re, struct, glob, sys, shutil

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
FE8U = os.path.abspath(os.path.join(ROOT, "..", "..", "..", "..", "fireemblem8u"))
if not os.path.isdir(FE8U):
    FE8U = os.path.abspath(os.path.join(ROOT, "..", "fireemblem8u"))

data = open("baserom.gba", "rb").read()
BASE = 0x214120
DF4_C = "src/data/frontier_df4_font_cc/frontier_df4_font_cc.c"
DF4_GFX = "graphics/frontier_df4_font_cc"

def rd(a, n):
    o = a - 0x08000000
    return data[o:o+n]

def song_span(idx):
    h = struct.unpack("<I", data[BASE+idx*8:BASE+idx*8+4])[0]
    if h == 0:
        return None
    b = rd(h, 8); tc = b[0]
    tone = struct.unpack("<I", b[4:8])[0]
    if tc == 0:
        return None
    tracks = struct.unpack("<%dI" % tc, rd(h+8, tc*4))
    start = min(tracks) - 0x08000000
    end = (h + 8 + tc*4) - 0x08000000
    return (start, end, tone)

# --- which songs ---
song_nums = set(int(re.match(r"snd_song(\d+)", d).group(1))
                for d in os.listdir("src/data") if d.startswith("snd_song"))
_fe8u_mk_pre = open(os.path.join(FE8U, "songs.mk")).read()
_name2num = {m.group(1): int(m.group(2))
             for m in re.finditer(r"\$\(MID_SUBDIR\)/(song(\d+)_[^.]+)\.s:", _fe8u_mk_pre)}
for mid in glob.glob("sound/songs/midi/*.mid"):
    nm = os.path.basename(mid)[:-4]
    if nm in _name2num:
        song_nums.add(_name2num[nm])
song_nums = sorted(song_nums)

fe8u_mk = open(os.path.join(FE8U, "songs.mk")).read()
mkmap = {}
for m in re.finditer(r"\$\(MID_SUBDIR\)/(song(\d+)_[^.]+)\.s:.*?\n\t\$\(MID2AGB\) \$< \$@ (.*)", fe8u_mk):
    mkmap[int(m.group(2))] = (m.group(1), m.group(3).strip())

songs = []  # (num, name, flags, start, end, tone, gnum)
for n in song_nums:
    sp = song_span(n)
    if sp is None:
        print("WARN song%03d has no gSongTable data entry, skipping" % n); continue
    if n not in mkmap:
        print("WARN song%03d not in fe8u songs.mk, skipping" % n); continue
    name, flags = mkmap[n]
    g = re.search(r"-G(\d+)", flags).group(1)
    songs.append((n, name, flags, sp[0], sp[1], sp[2], g))

spans = sorted((s[3], s[4]) for s in songs)
def overlaps_any(s, e):
    return any(s < E and e > S for S, E in spans)

def remnants(s, e):
    """[s,e) minus the union of song spans -> list of leftover intervals."""
    pts = [(s, e)]
    for S, E in spans:
        new = []
        for a, b in pts:
            if E <= a or S >= b:
                new.append((a, b)); continue
            if a < S: new.append((a, min(S, b)))
            if E < b: new.append((max(E, a), b))
        pts = new
    return [(a, b) for a, b in pts if b > a]

# --- read full manifest (main + .d fragments) ---
def read_rows(path):
    out = []
    for line in open(path):
        if line.startswith("#") or not line.strip():
            out.append((None, line.rstrip("\n"))); continue
        p = line.rstrip("\n").split("\t")
        if len(p) < 3:
            out.append((None, line.rstrip("\n"))); continue
        try:
            s = int(p[0], 16); e = int(p[1], 16)
        except ValueError:
            out.append((None, line.rstrip("\n"))); continue
        out.append(((s, e, p[2], p[3] if len(p) > 3 else ""), line.rstrip("\n")))
    return out

del_src_objs = set()        # 'src/data/.../X' (no ext) of objs to delete (fully consumed)
prune_df4_arrays = set()    # df4 gapK sections fully consumed -> drop INCBIN line
df4_remnants = {}           # gapK -> (rs, re) remnant interval (re-carve .bin + repoint)
data08_remnants = {}        # objpath -> (rs, re, origstart, secname) for de-pointered residue
song_frag_dirs = set()      # snd_song* dirs fully consumed

manifest_files = ["layout/carved_rom.tsv"] + \
    ["layout/carved_rom.d/" + f for f in sorted(os.listdir("layout/carved_rom.d")) if f.endswith(".tsv")]

for mf in manifest_files:
    rows = read_rows(mf)
    changed = False
    newlines = []
    for rec, raw in rows:
        if rec is None:
            newlines.append(raw); continue
        s, e, sec, note = rec
        if not overlaps_any(s, e):
            newlines.append(raw); continue
        rem = remnants(s, e)
        if len(rem) > 1:
            sys.exit("UNEXPECTED multi-remnant straddle %06X-%06X %s" % (s, e, sec))
        m = re.search(r"(src/data/[\w/]+)\.o\(([^)]*)\)", sec)
        if not m:
            # song .o rows from a prior run, or anything else overlapping -> drop & regen
            changed = True
            continue
        objpath, secname = m.group(1), m.group(2)
        if "snd_song" in objpath:
            song_frag_dirs.add(objpath.rsplit("/", 1)[0])
            changed = True
            continue
        if "frontier_df4_font_cc" in objpath:
            gapname = secname.split(".")[-1]  # gapK
            if not rem:
                prune_df4_arrays.add(gapname)
            else:
                rs, re_ = rem[0]
                df4_remnants[gapname] = (rs, re_)
                newlines.append("%06X\t%06X\t%s\t%s" % (rs, re_, sec, note))
            changed = True
            continue
        # de-pointered residue data_08ADDR object
        if not rem:
            del_src_objs.add(objpath)  # fully consumed
        else:
            rs, re_ = rem[0]
            data08_remnants[objpath] = (rs, re_, s, secname)
            newlines.append("%06X\t%06X\t%s\t%s" % (rs, re_, sec, note))
        changed = True
    if changed:
        open(mf, "w").write("\n".join(newlines) + "\n")

# --- write the new song .o rows into a dedicated fragment ---
song_rows = []
for n, name, flags, s, e, tone, g in songs:
    song_rows.append("%06X\t%06X\tsound/songs/midi/%s.o(.rodata)\t%s editable mid2agb song (D311)"
                     % (s, e, name, name))
os.makedirs("layout/carved_rom.d", exist_ok=True)
open("layout/carved_rom.d/d311_songs.tsv", "w").write(
    "# D311 editable .mid songs (one .o per song over its full ROM span)\n"
    + "\n".join(sorted(song_rows)) + "\n")

def carve_bin(path, rs, re_):
    open(path, "wb").write(data[rs:re_])

# --- re-carve df4_font_cc gaps: drop fully-consumed arrays, repoint remnant arrays ---
if prune_df4_arrays or df4_remnants:
    os.makedirs(DF4_GFX, exist_ok=True)
    lines = open(DF4_C).read().splitlines(keepends=True)
    kept = []
    for ln in lines:
        m = re.search(r'\.data\.frontier_df4_font_cc\.(gap\d+)"', ln)
        if not m or "INCBIN" not in ln:
            kept.append(ln); continue
        gapname = m.group(1)
        if gapname in prune_df4_arrays:
            continue  # fully consumed by songs
        if gapname in df4_remnants:
            rs, re_ = df4_remnants[gapname]
            idx = int(gapname[3:])
            var = "frontier_df4_font_cc_%03d_%06X" % (idx, rs)
            binf = "%s/frontier_df4_font_cc_%03d_%06X.bin" % (DF4_GFX, idx, rs)
            carve_bin(binf, rs, re_)
            kept.append(
                'u8 %s[] __attribute__((section(".data.frontier_df4_font_cc.%s"))) = '
                'INCBIN_U8("%s");\n' % (var, gapname, binf))
            continue
        kept.append(ln)
    open(DF4_C, "w").write("".join(kept))
    print("df4: pruned %d arrays, re-carved %d remnant arrays"
          % (len(prune_df4_arrays), len(df4_remnants)))

# --- replace de-pointered residue objects (data_08ADDR) that straddle: clean INCBIN ---
data08_aliases = {}  # sym -> origstart (file offset; +0x08000000 = VMA base)
for objpath, (rs, re_, origstart, secname) in sorted(data08_remnants.items()):
    sym = os.path.basename(objpath)               # data_08ADDR
    cdir = os.path.dirname(objpath)
    bindir = cdir.replace("src/data", "graphics", 1)
    os.makedirs(bindir, exist_ok=True)
    binf = "%s/%s_%06X.bin" % (bindir, sym, rs)
    carve_bin(binf, rs, re_)
    var = "%s_%06X" % (sym, rs)
    with open(objpath + ".c", "w") as f:
        f.write("#include \"global.h\"\n\n")
        f.write("/* D311: %s straddled a song boundary; its head [%06X,%06X) is now\n"
                " * provided by the song .o. Only the non-song remnant [%06X,%06X) stays here,\n"
                " * as a committed INCBIN (self-contained). The original symbol %s is bound to\n"
                " * its JP absolute address via a baseline alias so external +off refs resolve. */\n"
                % (sym, origstart, rs, rs, re_, sym))
        f.write('u8 %s[] __attribute__((section("%s"))) = INCBIN_U8("%s");\n'
                % (var, secname, binf))
    spath = objpath + ".s"
    if os.path.exists(spath):
        os.remove(spath)
    data08_aliases[sym] = origstart

# --- delete fully-consumed source objects ---
removed_dirs = 0
for d in sorted(song_frag_dirs):
    if os.path.isdir(d):
        shutil.rmtree(d); removed_dirs += 1
removed_objs = 0
for objpath in sorted(del_src_objs):
    d = os.path.dirname(objpath)
    if re.match(r"src/data/data_[0-9A-Fa-f]+$", d):
        if os.path.isdir(d):
            shutil.rmtree(d); removed_dirs += 1; removed_objs += 1
    else:
        for ext in (".c", ".o", ".s"):
            p = objpath + ext
            if os.path.exists(p):
                os.remove(p)
        removed_objs += 1
print("removed %d dirs, %d residue objects" % (removed_dirs, removed_objs))

# --- symbols already defined elsewhere (must NOT be re-bound -> multiple-def) ---
already = set()
for bf in ["layout/baseline_syms.tsv"] + glob.glob("layout/baseline_syms.d/*.tsv"):
    if bf.endswith("d311-music.tsv"):
        continue
    for line in open(bf):
        if line.startswith("#") or not line.strip():
            continue
        already.add(line.split("\t")[0].strip())
for c in glob.glob("src/data/**/*.c", recursive=True):
    t = open(c, errors="replace").read()
    for m in re.finditer(r"\b([A-Za-z_]\w*)\s*\[\s*\]\s*=\s*INCBIN", t):
        already.add(m.group(1))
    for m in re.finditer(r"\.global\s+(\w+)", t):
        already.add(m.group(1))
for n, name, flags, s, e, tone, g in songs:
    already.add(name)

# --- voicegroup bindings ---
vg_lines = {}
for n, name, flags, s, e, tone, g in songs:
    sym = "voicegroup%s" % g
    if sym in already or sym in vg_lines:
        continue
    vg_lines[sym] = "%s\t%08X\tdata\tD311 voicegroup -G%s" % (sym, tone, g)

# --- data_08ADDR self-ref aliases (the rewritten INCBIN no longer defines them) ---
alias_lines = []
for sym, origstart in sorted(data08_aliases.items()):
    if sym in already:
        continue
    alias_lines.append("%s\t%08X\tdata\tD311 residue-base alias (straddled song)"
                       % (sym, origstart + 0x08000000))

with open("layout/baseline_syms.d/d311-music.tsv", "w") as f:
    f.write("# D311 editable .mid music: voicegroup tone-table bindings + residue\n")
    f.write("# base-address aliases for objects whose head a song .o now provides.\n")
    for k in sorted(vg_lines):
        f.write(vg_lines[k] + "\n")
    for ln in alias_lines:
        f.write(ln + "\n")
print("voicegroups bound:", len(vg_lines), "residue aliases:", len(alias_lines))

# --- sound/songs.mk ---
with open("sound/songs.mk", "w") as f:
    f.write("# Per-song mid2agb flags (ported from ../fireemblem8u/songs.mk). AUTO-GEN by\n")
    f.write("# scripts/gen_d311_songs.py. Each rule rebuilds the song .s from the committed\n")
    f.write("# .mid with the JP build flags; linked at the JP song address the m4a self-ptr\n")
    f.write("# + voicegroup relocations resolve to JP-absolute values. See docs/sound.md D311.\n\n")
    f.write("MID_SUBDIR := sound/songs/midi\n\n")
    for n, name, flags, s, e, tone, g in songs:
        f.write("$(MID_SUBDIR)/%s.s: %%.s: %%.mid\n\t$(MID2AGB) $< $@ %s\n\n" % (name, flags))

# --- copy fe8u .mid files in ---
copied = 0
os.makedirs("sound/songs/midi", exist_ok=True)
for n, name, flags, s, e, tone, g in songs:
    src = os.path.join(FE8U, "sound/songs/midi", name + ".mid")
    dst = os.path.join("sound/songs/midi", name + ".mid")
    if not os.path.exists(src):
        print("ERROR missing fe8u midi:", src); continue
    if not os.path.exists(dst):
        shutil.copy(src, dst)
    copied += 1
print("midi present:", copied, "of", len(songs))

print("DONE: %d songs wired" % len(songs))
