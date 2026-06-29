#!/usr/bin/env python3
"""D311 music scale-up: un-tile ALL fragmented JP songs into editable fe8u .mid form.

For every snd_song<NNN> dir present under src/data/, this:
  1. Reads the song's true ROM span [min(track ptrs), header_end) and its voicegroup
     (tone ptr) from gSongTable @ 0x08214120 in baserom.gba (authoritative).
  2. Replaces every manifest row overlapping that span with ONE song .o row over the
     full span (sound/songs/midi/<name>.o). gen_layout auto-incbins any uncovered
     non-song remnant of a straddling object from baserom, byte-exact.
  3. Deletes the redundant fragment/residue/worldmap src objects fully consumed by a
     span and prunes the overlapping arrays out of the shared frontier_df4_font_cc.c.
  4. Binds each voicegroup symbol to its JP tone address, and binds every old fragment
     symbol that a SURVIVING object still references (via de-pointered .4byte) to its
     JP absolute address (from the reference ELF) so those refs still resolve.
  5. Copies the fe8u .mid into sound/songs/midi/ and writes sound/songs.mk rules.

Idempotent-ish: run on the prototype tree (song001/002 already done) and it rebuilds
the full song set. make clean && make compare is the only oracle.
"""
import os, re, struct, glob, sys, shutil

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
FE8U = os.path.abspath(os.path.join(ROOT, "..", "..", "..", "..", "fireemblem8u"))
if not os.path.isdir(FE8U):
    FE8U = "/home/laqieer/fireemblem8j/../fireemblem8u"
FE8U = os.path.abspath(FE8U)
ELF_SYMS = "/tmp/elf_syms.txt"

data = open("baserom.gba", "rb").read()
BASE = 0x214120
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

# --- which songs: JP snd_song<NNN> dirs to un-tile, PLUS any song .mid already
# committed (e.g. prototype song001/002 whose src dirs are gone) so songs.mk keeps
# a build rule for every .mid the Makefile wildcard will pick up. ---
song_nums = set(int(re.match(r"snd_song(\d+)", d).group(1))
                for d in os.listdir("src/data") if d.startswith("snd_song"))
# fe8u name -> number, to resolve already-present .mid files back to a song number.
_fe8u_mk_pre = open(os.path.join(FE8U, "songs.mk")).read()
_name2num = {m.group(1): int(m.group(2))
             for m in re.finditer(r"\$\(MID_SUBDIR\)/(song(\d+)_[^.]+)\.s:", _fe8u_mk_pre)}
for mid in glob.glob("sound/songs/midi/*.mid"):
    nm = os.path.basename(mid)[:-4]
    if nm in _name2num:
        song_nums.add(_name2num[nm])
song_nums = sorted(song_nums)

# fe8u songs.mk: number -> (midi_name, flags)
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

spans = [(s[3], s[4]) for s in songs]
def overlaps_any(s, e):
    return any(s < E and e > S for S, E in spans)
def inside_any(s, e):
    return any(S <= s and e <= E for S, E in spans)

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

# Collect deleted-object source files (fully-consumed objects to remove from tree).
del_src_objs = set()    # 'src/data/.../X' (no .o) -> delete its .c
prune_df4_arrays = []   # list of (gapsec) for arrays to drop from df4_font_cc.c
song_frag_dirs = set()

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
        # overlapping row -> drop it; mark its src object for deletion/prune.
        changed = True
        m = re.search(r"(src/data/[\w/]+)\.o\(([^)]*)\)", sec)
        if m:
            objpath, secname = m.group(1), m.group(2)
            if "snd_song" in objpath:
                song_frag_dirs.add(objpath.rsplit("/", 1)[0])
            elif "frontier_df4_font_cc" in objpath:
                prune_df4_arrays.append(secname)  # e.g. .data.frontier_df4_font_cc.gap6
            else:
                del_src_objs.add(objpath)
        m2 = re.search(r"sound/songs/midi/(\w+)\.o", sec)  # existing prototype song rows
        # (drop silently; regenerated below)
        # row dropped
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

# --- prune overlapping arrays from frontier_df4_font_cc.c ---
df4_c = "src/data/frontier_df4_font_cc/frontier_df4_font_cc.c"
if prune_df4_arrays:
    prune_set = set(s.split(".")[-1] for s in prune_df4_arrays)  # {'gap6','gap7',...}
    lines = open(df4_c).read().splitlines(keepends=True)
    kept = []
    dropped = 0
    for ln in lines:
        m = re.search(r'\.data\.frontier_df4_font_cc\.(gap\d+)', ln)
        if m and m.group(1) in prune_set and "INCBIN" in ln:
            dropped += 1; continue
        kept.append(ln)
    open(df4_c, "w").write("".join(kept))
    print("pruned %d df4_font_cc arrays" % dropped)

# --- delete fully-consumed source object dirs/files ---
removed_dirs = 0
for d in sorted(song_frag_dirs):
    if os.path.isdir(d):
        shutil.rmtree(d); removed_dirs += 1
for objpath in sorted(del_src_objs):
    # objpath like src/data/worldmap_gmapunit/dat_X  or src/data/data_ADDR/data_ADDR
    cfile = objpath + ".c"
    d = os.path.dirname(objpath)
    parent = os.path.dirname(d)
    # residue lives in its own dir src/data/data_ADDR/ -> remove whole dir
    if re.match(r"src/data/data_[0-9A-Fa-f]+$", d):
        if os.path.isdir(d):
            shutil.rmtree(d); removed_dirs += 1
    else:
        # worldmap_gmapunit/dat_X.c  (one .c per object) -> remove just that .c (+.o/.s if present)
        for ext in (".c", ".o", ".s"):
            p = objpath + ext
            if os.path.exists(p):
                os.remove(p)
print("removed %d dirs, %d worldmap/residue objects" % (removed_dirs, len(del_src_objs)))

# --- build baseline aliases for old fragment symbols still referenced by survivors ---
# ELF symbol table -> sym: addr
sym_addr = {}
if os.path.exists(ELF_SYMS):
    for line in open(ELF_SYMS):
        p = line.split()
        if len(p) == 2 and re.match(r"[0-9a-fA-F]{8}$", p[0]) and not p[1].startswith("*"):
            sym_addr[p[1]] = p[0]

# Symbols DEFINED in deleted objects = those whose ELF addr falls inside a song span,
# OR whose name is a snd_song fragment / residue / worldmap object we removed.
def addr_inside_span(a):
    off = a - 0x08000000  # ELF addrs are VMAs; spans are ROM-file offsets
    return overlaps_any(off, off+1)

# Determine which deleted-object symbols are referenced by SURVIVING source.
# Surviving source = all src/**/*.c|*.s that still exist after deletions, minus the
# df4_font_cc arrays we pruned (those refs are gone). Grep is the cheap oracle.
import subprocess
# candidate deleted symbols: ELF syms whose addr is inside any span
deleted_syms = {s: a for s, a in sym_addr.items()
                if re.match(r"[0-9a-f]{8}$", a) and addr_inside_span(int(a, 16))}
print("deleted-object symbols (addr inside a span):", len(deleted_syms))

# Which are referenced by any surviving .c/.s? Use one grep -rho of all song-ish tokens.
# Fast path: grep recursively for the union once, collect matched tokens.
ref_tokens = set()
# Gather all candidate names into a temp pattern file for grep -F -w.
names = list(deleted_syms.keys())
patf = "/tmp/d311_names.txt"
open(patf, "w").write("\n".join(names) + "\n")
# Search surviving tree (src/, asm/, layout/baseline_syms*). Exclude nothing fancy;
# the deleted dirs are already gone from disk.
res = subprocess.run(["grep", "-rhoFwf", patf, "src", "asm", "layout"],
                     capture_output=True, text=True)
for tok in res.stdout.split():
    if tok in deleted_syms:
        ref_tokens.add(tok)
print("deleted symbols still referenced by survivors:", len(ref_tokens))

# --- symbols ALREADY defined elsewhere (must NOT be re-bound -> multiple-def) ---
already = set()
# (a) pre-existing baseline_syms (monolith + every .d fragment except ours)
for bf in ["layout/baseline_syms.tsv"] + glob.glob("layout/baseline_syms.d/*.tsv"):
    if bf.endswith("d311-music.tsv"):
        continue
    for line in open(bf):
        if line.startswith("#") or not line.strip():
            continue
        already.add(line.split("\t")[0].strip())
# (b) globals defined by surviving src/data objects (e.g. voicegroupNNN_ref defines
#     voicegroupNNN; a residue .c may .global a symbol). Grep their definitions.
for c in glob.glob("src/data/**/*.c", recursive=True):
    t = open(c, errors="replace").read()
    for m in re.finditer(r"\b([A-Za-z_]\w*)\s*\[\s*\]\s*=\s*INCBIN", t):
        already.add(m.group(1))
    for m in re.finditer(r"\.global\s+(\w+)", t):
        already.add(m.group(1))
# (c) the song .o globals = the SongHeader symbol "song<NNN>_<name>" each .o exports.
for n, name, flags, s, e, tone, g in songs:
    already.add(name)

# --- write baseline_syms.d/d311-music.tsv: voicegroups + referenced-fragment aliases ---
vg_lines = {}
for n, name, flags, s, e, tone, g in songs:
    sym = "voicegroup%s" % g
    if sym in already:
        continue  # already bound by a _ref object or existing baseline
    vg_lines[sym] = "%s\t%08X\tdata\tD311 voicegroup -G%s" % (sym, tone, g)
alias_lines = []
for tok in sorted(ref_tokens):
    if tok in already or tok in vg_lines:
        continue
    a = deleted_syms[tok]
    alias_lines.append("%s\t%s\tdata\tD311 song-fragment self-ref alias" % (tok, a.upper()))

with open("layout/baseline_syms.d/d311-music.tsv", "w") as f:
    f.write("# D311 editable .mid music: voicegroup tone-table bindings + old\n")
    f.write("# fragment symbols still referenced by surviving de-pointered objects.\n")
    for k in sorted(vg_lines):
        f.write(vg_lines[k] + "\n")
    for ln in alias_lines:
        f.write(ln + "\n")
print("voicegroups bound:", len(vg_lines), "fragment aliases:", len(alias_lines))

# --- sound/songs.mk: one rule per song ---
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
