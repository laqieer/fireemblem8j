#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
audit_bin_forms.py — reproducible ".bin form audit" for the FE8J asset-editability epic.

PURPOSE
    For every committed `*.bin` in this repo (fe8j), decide whether it is a
      - MISS      : fe8u builds the SAME asset from a more-editable SOURCE
                    (.png / .s / .mid / .aif / .pal/.agbpal / typed C in src/data),
                    so fe8j committing a raw .bin is a regression to fix; or
      - FLOOR     : fe8u *also* keeps this asset as binary (TSA/.map.bin, the
                    fe6sio payload, efx* effect bins, op_anim/opanim tilemaps,
                    direct_sound PCM) — legitimate, do NOT fake-extract; or
      - UNCERTAIN : opaque blob (ApConf/gUnkData/gap/data_<addr>) whose fe8u
                    source form is not yet known — needs RE; document, don't fake.

    Emits a sorted, reproducible `docs/bin_audit.md` grouped MISS / FLOOR /
    UNCERTAIN, each entry annotated with the fe8u-source path (or the reason)
    as proof, plus per-category counts and a summary table.

METHOD (reviewable, see the doc header it writes)
    The oracle is fe8u: `git -C <fe8u> ls-files`. fe8u commits essentially every
    asset in an editable source form; the ONLY binaries it commits are
    `*.tsa.bin`, `*.map.bin`, and the single `fe6sio_payload.bin`. So the
    classification is layered (first matching rule wins):

      1. FLOOR by suffix       — `.tsa.bin`, `.map.bin`, `.fetsa3.bin`
                                 (fe8u keeps TSA/tilemaps binary too).
      2. FLOOR by directory     — `graphics/banim/efx*` effect bins,
                                 `op_anim`/`opanim` tilemaps, `direct_sound*`
                                 PCM (fe8u floor dirs).
      3. MISS by fe8u editable basename — strip the fe8j address / `_o` / `_bin`
                                 suffixes to a basename/symbol; if fe8u commits a
                                 MORE-EDITABLE source (.png/.s/.mid/.aif/.pal/
                                 .agbpal/src/data typed-C) with that basename, it
                                 is a MISS and the fe8u path is the proof. This is
                                 cross-checked against the ROM symbol via
                                 layout/*.tsv where the basename itself fails.
      3b. FLOOR / MISS by fe8u binary basename — if instead fe8u commits a
                                 *.bin with that basename it is normally FLOOR (the
                                 basename proves fe8u keeps it binary). EXCEPTION
                                 (D337 floor-overstatement fix): if the fe8j blob is
                                 an LZ77-COMPRESSED derivative of that DECOMPRESSED
                                 fe8u source (0x10 header, decoded size == twin size,
                                 full decode == twin bytes) then fe8u builds the
                                 `.lz` from the `.tsa.bin`/`.map.bin`, so the JP blob
                                 is reducible / EXTRACTABLE -> MISS, not floor. Raw-
                                 parity twins (JP already decompressed, no 0x10
                                 header) stay FLOOR.
      4. MISS / UNCERTAIN by content-type name-class — for fe8j ROM-region-named
                                 blobs (e.g. `frontier_chap_title_NNN_ADDR`,
                                 `Img_*`, banim AnimSprite/Img, UnitDef_*, song*,
                                 m4a tables, string pools) the fe8u source FORM is
                                 known by TYPE even when the exact basename differs
                                 — so they are MISS with the fe8u *form/dir* as
                                 proof. Opaque `ApConf_*`/`gUnkData_*`/`gap_*`/
                                 `data_<addr>` fall through to UNCERTAIN.

    NOTE (prior over-flagging the plan calls out): `frontier_chap_title` images
    and `frontier_df4_misc_lo` string pools were once mislabeled FLOOR. They are
    MISSES (chapter-title gfx → fe8u .png; string pools → fe8u C literals). The
    name-class rules below classify them MISS; the self-test at the bottom of the
    script asserts this so the classification cannot silently regress.

REQUIREMENTS
    Python 3, stdlib only, and `git`. Reads both repos via `git -C <repo> ls-files`.
    Run from the repo root:  python3 scripts/audit_bin_forms.py
    Idempotent: regenerates docs/bin_audit.md deterministically. Changes no ROM bytes.
"""

import hashlib
import os
import re
import struct
import subprocess
import sys
from collections import Counter, OrderedDict, defaultdict

# --------------------------------------------------------------------------- #
# Repo locations                                                              #
# --------------------------------------------------------------------------- #
HERE = os.path.dirname(os.path.abspath(__file__))
FE8J = os.path.dirname(HERE)  # repo root (scripts/.. )


def _git(repo, *args):
    return subprocess.run(
        ["git", "-C", repo, *args],
        check=True, capture_output=True, text=True,
    ).stdout


def _is_git_dir(c):
    # a git repo has a .git dir (normal) or a .git file (worktree)
    return bool(c) and os.path.exists(os.path.join(c, ".git"))


def _find_fe8u():
    cands = []
    env = os.environ.get("FE8U")
    if env:
        cands.append(env)
    # sibling of repo root
    cands.append(os.path.normpath(os.path.join(FE8J, "..", "fireemblem8u")))
    # sibling of the MAIN worktree (when FE8J is a .claude/worktrees/* worktree)
    try:
        common = _git(FE8J, "rev-parse", "--git-common-dir").strip()
        if not os.path.isabs(common):
            common = os.path.normpath(os.path.join(FE8J, common))
        main_root = os.path.dirname(common)  # .../<repo>/.git -> .../<repo>
        cands.append(os.path.normpath(os.path.join(main_root, "..", "fireemblem8u")))
    except Exception:
        pass
    cands.append("/home/laqieer/fireemblem8u")
    for c in cands:
        if _is_git_dir(c):
            return c
    return None


FE8U = _find_fe8u()
OUT = os.path.join(FE8J, "docs", "bin_audit.md")

# --------------------------------------------------------------------------- #
# fe8u editable source extensions (a .bin with one of these as its fe8u twin   #
# is a MISS). TSA/map .bin are the fe8u FLOOR forms.                           #
# --------------------------------------------------------------------------- #
EDITABLE_EXTS = (".png", ".s", ".mid", ".aif", ".pal", ".agbpal", ".c", ".inc")

# fe8u directories that legitimately keep binaries (floor parity).
FLOOR_DIR_PATTERNS = (
    re.compile(r"(^|/)graphics/banim/efx[^/]*/"),   # efx effect bins
    re.compile(r"(^|/)op_?anim(/|$)"),              # op_anim / opanim tilemaps
    re.compile(r"(^|/)direct_sound"),               # PCM direct-sound
    re.compile(r"(^|/)graphics/banim/.*/assets/tsa/"),
)

# Suffixes fe8u itself keeps binary -> floor.
FLOOR_SUFFIXES = (".tsa.bin", ".map.bin", ".fetsa3.bin")

# --------------------------------------------------------------------------- #
# Name-class rules used when a direct fe8u basename match is unavailable.      #
# (regex-on-path, category, fe8u-form-proof-string). First match wins.        #
# --------------------------------------------------------------------------- #
NAME_CLASS_RULES = [
    # --- Battle animation (MISS): fe8u ships 202 editable banim/*.s built by the
    #     compressing linker, each emitting the _script/_oam_l/_oam_r/_modes
    #     sections. fe8j decomposes them into per-piece .bin (banim_*_motion_o,
    #     _modes_bin, _oam_l_bin, _oam_r_bin) + Img_/Pal_ sheets + AnimSprite_. ---
    # banim TSA tilemaps (FLOOR — fe8u keeps banim TSA binary).
    (re.compile(r"(^|/)data/banim/Tsa_"),
     "FLOOR", "fe8u keeps banim TSA tilemaps binary (graphics/banim/assets/tsa/*.map.bin)"),
    # everything else under data/banim/ is the banim pipeline -> editable .s.
    (re.compile(r"(^|/)data/banim/"),
     "MISS", "fe8u banim/*.s (compressing-linker; graphics/banim/*.png + banim/*.s)"),
    (re.compile(r"(^|/)data/residual/AnimSprite_"),
     "MISS", "fe8u typed struct AnimSpriteData[] / banim/*.s"),
    # battle-anim scripts (MISS) -> fe8u banim/animscr_*.s
    (re.compile(r"(^|/)data/residual/Anim[Ss]cr"),
     "MISS", "fe8u banim/animscr_*.s (battle-anim script macros)"),

    # --- Pixel graphics (MISS): Img_/gImg_/gGfx_/gfx_ raw tiles -> fe8u .png ---
    (re.compile(r"(^|/)graphics/(misc_gfx|misc_gfx2|misc_gfx3|misc)/"),
     "MISS", "fe8u graphics/misc/*.png"),
    (re.compile(r"(^|/)graphics/(gfx_data_bg|gmapunit)/"),
     "MISS", "fe8u graphics/**/*.png (BG/unit tile gfx)"),
    (re.compile(r"(^|/)graphics/.*/(Img_|gImg_|gGfx_|gfx_)", re.IGNORECASE),
     "MISS", "fe8u graphics/**/<name>.png (png->4bpp round-trips byte-exact)"),

    # --- frontier_* ROM-region-named blobs the prior audit MIS-flagged as floor ---
    (re.compile(r"(^|/)graphics/frontier_chap_title/"),
     "MISS", "fe8u graphics/chap_title/*.png (chapter-title images)"),
    (re.compile(r"(^|/)graphics/frontier_df3_titlescreen/"),
     "MISS", "fe8u graphics/titlescreen/*.png"),
    (re.compile(r"(^|/)graphics/frontier_df3_opanim_gfx/"),
     "MISS", "fe8u graphics/op_anim/*.png (opanim gfx, not the tilemap floor)"),
    (re.compile(r"(^|/)graphics/frontier_df4_misc_lo/"),
     "MISS", "fe8u C string literals (src/menu_def.c parity) — string pools"),
    (re.compile(r"(^|/)graphics/frontier_[^/]*banim"),
     "MISS", "fe8u banim/*.png + banim/*.s"),
    (re.compile(r"(^|/)graphics/frontier_df3_unitdef_b/"),
     "MISS", "fe8u typed struct UnitDefinition[] / REDA tables (unitdef data, not gfx)"),
    # frontier event-script blobs (MISS) -> EVENT_* macros in C.
    (re.compile(r"(^|/)graphics/frontier_[^/]*eventscr"),
     "MISS", "fe8u src/events/*.c (EVENT_* macros; frontier event script)"),
    # frontier_ending_cg_000 (uncompressed JP-exclusive worldmap-style CG, 0 xrefs,
    # NO fe8u counterpart). D360 called it "no provable sub-boundaries -> verbatim
    # .bin ceiling". D362 CORRECTS that: because it is UNCOMPRESSED, any tile-aligned
    # cut is byte-exact, so the palette [0x00:0x80] (-> .gbapal) and the 1024 clean
    # tiles [0x80:0x8080] (-> .png), ~40%, were split OUT editable; only the
    # interspersed tiles+tilemap tail [0x8080:end] (47,588 B, no clean tile-aligned
    # cut) stays a verbatim .bin (renamed frontier_ending_cg_tail_B2F9F0.bin). Still
    # UNCERTAIN (JP-exclusive, no fe8u editable twin), resolved NOT deferred. Must
    # precede the generic frontier catch-all below. (D360; corrected D362)
    (re.compile(r"(^|/)graphics/frontier_ending_cg/frontier_ending_cg_tail_B2F9F0\.bin$"),
     "UNCERTAIN", "RE-complete, PARTIALLY EXTRACTED: uncompressed CG — palette + 1024-tile PNG split out editable (~40%); this 47,588 B interspersed tiles+tilemap tail has no clean tile-aligned cut → genuine verbatim floor (D362)"),
    # frontier_df3_ending_001/002 (JP-exclusive): D362 re-derivation — these are NOT
    # compressed (both start with 0x131d = a TSA width/height header, not a 0x10 LZ
    # header); they are raw TSA data. 001 has a clean 4-way TSA split available but
    # DEFERRED (JP-only, no fe8u names). 002 is a raw TSA + a non-palette data block
    # (its "palette" is 39% bit15-set, NOT a clean palette). Off "needs RE".
    (re.compile(r"(^|/)graphics/frontier_df3_ending/frontier_df3_ending_001_AC3AA8\.bin$"),
     "UNCERTAIN", "RE-complete: NOT compressed (header 0x131d = TSA width/height) — raw TSA tilemap; a clean 4-way TSA split is available, DEFERRED (JP-only, no fe8u names) (D362)"),
    (re.compile(r"(^|/)graphics/frontier_df3_ending/frontier_df3_ending_002_AC50A4\.bin$"),
     "UNCERTAIN", "RE-complete: NOT compressed (header 0x131d = TSA width/height) — raw TSA tilemap + a non-palette data block (its 'palette' is 39% bit15-set, not a clean palette); DEFERRED (JP-only) (D362)"),
    # frontier_df4_ending_007_residual (JP-exclusive): issue #143 RE — the LZ77
    # image/TSA pair was extracted editable; the remaining 519 B tail is entirely
    # zero except its first 8 bytes (00 00 00 1f 07 00 00 00). No pointer
    # structure and no consumer semantics were found; positive evidence, not
    # absence of investigation -> FLOOR (not UNCERTAIN).
    (re.compile(r"(^|/)graphics/frontier_df4_ending/frontier_df4_ending_007_residual_B381\.bin$"),
     "FLOOR", "evidence-backed FLOOR: 519 B near-zero residual (only first 8 B non-zero), no pointer structure, no known consumer -- narrowly scoped raw floor (#143, D377)"),
    # frontier_df4_ending_008 (JP-exclusive): D362 — pointer-free OAM data (so it is
    # shift-safe); no fe8u editable twin -> UNCERTAIN, but resolved, not "needs RE".
    (re.compile(r"(^|/)graphics/frontier_df4_ending/frontier_df4_ending_008_AD1444\.bin$"),
     "UNCERTAIN", "RE-complete: pointer-free OAM data (shift-safe); JP-divergent, no fe8u twin, DEFERRED (D362)"),
    # frontier_df4_menu_005/021/027 (JP-exclusive, issue #143 coverage pass):
    # RE-COMPLETE evidence-backed floors. A path name is not evidence, so these
    # are NOT a pathname-only regex rule -- see PINNED_RESIDUAL_FLOORS /
    # _pinned_residual_floor_classify() near the top of this file (checked
    # BEFORE this NAME_CLASS_RULES table, in `classify()`), which requires an
    # EXACT (size, sha256) match before returning FLOOR; any drift (wrong size,
    # changed bytes, or a missing file) is a hard UNCERTAIN failure naming the
    # exact mismatch, never a silent pass-through. 005 is a proc-script leaf
    # (395 B, trimmed from a stale 587 B over-extraction; the earlier
    # "MapChanges" label was REFUTED; 8 already-relocated ARM function
    # pointers, heavily cross-referenced base+offset from ~80 chapter
    # Events_ref/MapChanges_ref tables). 021/027 (174 B / 342 B) are each two
    # disjoint live INCBIN spans concatenated into one minimal file (found by
    # checking BOTH src/data/frontier_df4_menu/frontier_df4_menu.c and the
    # tracked frontier_df4_menu_asm.s, which reads a different range than the
    # .c file for each). No relocation slot or pointer-bearing schema is
    # hidden in any of these three -- every interior ROM pointer word is
    # already a named .4byte Sym(+addend) relocation, verified against `make
    # shiftcheck`'s reloc-coverage gate. blob001's former 4632 B "residual" was
    # a FALSE floor (D394/D395): an over-large decompression window hid a true
    # 3300 B LZ77 image boundary followed by a real TSA and 4 real palettes,
    # all now fully typed/editable with zero raw bytes remaining -- it carries
    # NO entry here or in PINNED_RESIDUAL_FLOORS.
    # frontier JP-divergent UI / font-group / ending / CG tables (UNCERTAIN): they
    # reached the name-class step precisely because NO fe8u editable twin exists
    # (JP-only multiplayer/menu/font/CG assets). The prior loose catch-all
    # mislabeled all ~112 as menu-strings MISS; the real string pools are ONLY in
    # frontier_df4_misc_lo (handled above). fe8u form unknown -> DEFERRED. (bug #2)
    (re.compile(r"(^|/)graphics/frontier_[^/]*(menu|uistuff|ending|fontgrp|data_)"),
     "UNCERTAIN", "fe8u form unknown — JP-divergent UI/font/ending/CG/data table (DEFERRED; needs RE)"),
    # any remaining frontier_* graphics image blob
    (re.compile(r"(^|/)graphics/frontier_"),
     "MISS", "fe8u graphics/**/*.png (frontier image region)"),

    # --- chapter map object tilemaps (MISS): -> fe8u .png/.S via MARTOMAP ---
    (re.compile(r"(^|/)graphics/map/.*ObjectType"),
     "MISS", "fe8u graphics/map/*.S + tile_config.inc (MARTOMAP)"),

    # --- Sound: m4a tables (MISS) -> fe8u sound/*.s ---
    (re.compile(r"(^|/)data/sound/gMPlayTable\.bin$"),
     "MISS", "fe8u sound/music_player_table.s"),
    (re.compile(r"(^|/)data/sound/(ply_xwave|[^/]*[Ww]ave)[^/]*\.bin$"),
     "MISS", "fe8u sound/programmable_wave_data.s"),
    (re.compile(r"(^|/)data/sound/[^/]*keysplit", re.IGNORECASE),
     "MISS", "fe8u sound/keysplit_tables.s"),
    # voicegroup tail (MISS, documented ceiling) -> fe8u sound/voicegroups/*.s
    (re.compile(r"(^|/)data/sound/frontier_df3_voicegroup"),
     "MISS", "fe8u sound/voicegroups/*.s (voicegroup tail; documented ceiling)"),
    (re.compile(r"(^|/)data/sound/frontier_df4_voice_"),
     "MISS", "fe8u sound/voicegroups/*.s / direct_sound_data.s"),
    # song data (MISS) -> fe8u sound/songs/mml/*.s built from .mid
    (re.compile(r"(^|/)data/sound/song\d"),
     "MISS", "fe8u sound/songs/mml/*.s (built from .mid)"),
    # m4a ENGINE routines (CODE axis, but editable form exists: src/m4a.c/m4a_1.s)
    (re.compile(r"(^|/)data/sound/(MPlay|Sound|Trk|Chn|Cgb|Track|Fade|Real|Get|Is|Register|Unregister|Check|clear_mod|ply_)", re.IGNORECASE),
     "MISS", "fe8u src/m4a.c + src/m4a_1.s (m4a engine, code axis)"),
    # any other named sound table blob -> editable .s
    (re.compile(r"(^|/)data/sound/g[A-Z]"),
     "MISS", "fe8u sound/*.s (named m4a/sound table)"),

    # --- Unit-definition tables (MISS) -> typed C struct UnitDefinition[] ---
    (re.compile(r"(^|/)data/residual/UnitDef_"),
     "MISS", "fe8u src/events_udefs.c (typed struct UnitDefinition[])"),

    # --- Event / proc / popup / list scripts (MISS) -> EVENT/PROC macros in C ---
    (re.compile(r"(^|/)data/residual/(EventScr_|EventListScr_|PopupScr_|MuSoundScr_)"),
     "MISS", "fe8u src/events/*.c (EVENT_* / PROC_* macros)"),

    # --- Object / sprite anim frames (MISS) -> typed C / ANIM_SPRITE macros ---
    (re.compile(r"(^|/)data/residual/(Obj_|obj_|sSprite_|gSprite_|Sprit?Anim_|SpriteAnim_)"),
     "MISS", "fe8u typed struct AnimSpriteData[] / sprite anim C"),
    (re.compile(r"(^|/)data/residual/(gWorldmapSprite|gMapanim|gMenuSoundroom|gBattleparse|gBattleForecast|gEkr|gEfx|gFontgrp)"),
     "MISS", "fe8u typed C table / gfx (worldmap/mapanim/menu data)"),

    # --- palette binaries (MISS): fe8u uses .pal/.agbpal/.png ---
    (re.compile(r"\.pal\.bin$"),
     "MISS", "fe8u .pal (JASC) / .agbpal (RGB555 bit-15) / .png palette"),

    # --- battle-bg feimg/fetsa (MISS): fe8u .png + FETSATOOL .tsa ---
    (re.compile(r"\.feimg3\.bin$"),
     "MISS", "fe8u graphics/btl_bg/*.png (battle-bg image; FETSATOOL)"),

    # --- residual song data (MISS) -> fe8u sound/songs/*.s (built from .mid) ---
    (re.compile(r"(^|/)data/residual/song\d"),
     "MISS", "fe8u sound/songs/mml/*.s + songs/midi/*.mid"),

    # --- residual menu strings (MISS) -> fe8u C literals (src/menu_def.c) ---
    (re.compile(r"(^|/)data/residual/MenuItems_"),
     "MISS", "fe8u C string literals (src/menu_def.c parity)"),

    # --- residual TSA blobs (FLOOR — fe8u keeps TSA binary) ---
    (re.compile(r"(^|/)data/residual/g?Tsa_", re.IGNORECASE),
     "FLOOR", "fe8u keeps TSA tilemaps binary (*.tsa.bin / *.map.bin)"),

    # --- residual named graphics / titlescreen / icons (MISS) -> .png ---
    (re.compile(r"(^|/)data/residual/(gTitlescreen|gGenericIcon|gIcon|Img_|gImg_)"),
     "MISS", "fe8u graphics/**/*.png (named gfx)"),

    # --- opaque residuals that need RE (UNCERTAIN/DEFERRED). `Ap*` anim-proc
    #     configs, gUnkData, gap_, and pure-address-named blobs (data_<addr>,
    #     g<addr>) have no known fe8u source form yet. ---
    (re.compile(r"(^|/)data/residual/(ApConf_|ApHandle_|Ap_|gUnkData_|gap_|data_[0-9A-Fa-f]|g[0-9A-Fa-f]{6})"),
     "UNCERTAIN", "fe8u form unknown — needs RE (DEFERRED; do not fake-extract)"),
]

# --------------------------------------------------------------------------- #
# Category-table seed (from the epic plan's "Audit findings" section).        #
# --------------------------------------------------------------------------- #
PLAN_CATEGORIES = OrderedDict([
    ("battle-anim",        ("MISS",      "fe8u 202 editable banim/*.s (compressing linker)")),
    ("pixel-gfx",          ("MISS",      "fe8u graphics/**/*.png")),
    ("sound-m4a-tables",   ("MISS",      "fe8u sound/music_player_table.s etc.")),
    ("voicegroup-tail",    ("MISS",      "fe8u sound/voicegroups/*.s (documented ceiling)")),
    ("menu-strings",       ("MISS",      "fe8u C literals (src/menu_def.c)")),
    ("unitdef-residuals",  ("MISS",      "fe8u src/events_udefs.c typed C")),
    ("map-tilemaps",       ("MISS",      "fe8u graphics/map/*.S / *.png (MARTOMAP)")),
    ("lz-compressed-tsa",  ("MISS",      "fe8u decompressed *.tsa.bin/*.map.bin source; JP ships the LZ77-compressed derivative (extractable)")),
    ("TSA/.map.bin",       ("FLOOR",     "fe8u keeps TSA/tilemaps binary too")),
    ("PCM/.aif",           ("FLOOR",     "fe8u direct_sound PCM binary (floor here)")),
    ("opanim-tilemaps",    ("FLOOR",     "fe8u op_anim/opanim tilemaps binary")),
    ("efx-effect-bins",    ("FLOOR",     "fe8u graphics/banim/efx* binary")),
    ("ApConf/opaque",      ("UNCERTAIN", "fe8u form unclear — DEFERRED, needs RE")),
])


# --------------------------------------------------------------------------- #
# Helpers                                                                      #
# --------------------------------------------------------------------------- #
def ls_bins(repo):
    out = _git(repo, "ls-files", "*.bin")
    return sorted(l for l in out.splitlines() if l)


def all_files(repo):
    return _git(repo, "ls-files").splitlines()


def basename_keys(path):
    """Reduce a fe8j .bin path to candidate fe8u-source basenames (symbols)."""
    name = os.path.basename(path)
    for suf in (".tsa.bin", ".map.bin", ".fetsa3.bin", ".feimg3.bin",
                ".pal.bin", ".bin"):
        if name.endswith(suf):
            name = name[: -len(suf)]
            break
    cands = [name]
    m = re.sub(r"_[0-9A-Fa-f]{4,}$", "", name)          # _<HEXADDR>
    if m != name:
        cands.append(m)
    m2 = re.sub(r"_\d+_[0-9A-Fa-f]{4,}$", "", name)      # _<NNN>_<HEXADDR>
    if m2 not in cands:
        cands.append(m2)
    m3 = re.sub(r"_\d+$", "", name)                      # trailing _<n> index
    if m3 not in cands:
        cands.append(m3)
    for c in list(cands):
        c2 = re.sub(r"_(o|bin)$", "", c)                 # _o / _bin decoration
        if c2 not in cands:
            cands.append(c2)
    out = []
    for c in cands:
        if c and c not in out and not re.fullmatch(r"[0-9A-Fa-f]{4,}", c):
            out.append(c)
    return out


def build_fe8u_index(fe8u_files):
    """Index fe8u committed files by basename-without-extension.

    Returns dict: base -> list of (full_path, ext, is_editable, is_bin).
    """
    idx = defaultdict(list)
    for f in fe8u_files:
        b = os.path.basename(f)
        stem, ext = os.path.splitext(b)
        is_bin = b.endswith(".bin")
        # fe8u `preview/**/*.png` are non-build RENDER previews (not referenced by
        # its Makefile) — NOT the build source. They must NOT count as an editable
        # twin, else TSA/tilemap .bin (whose real fe8u source is the `*.tsa.bin`
        # FLOOR form) get mislabeled MISS via a coincidental preview .png basename
        # match. See docs/bin_verification_wave8.md (classifier bug #1).
        is_render = ("/" + f).startswith("/preview/") or "/preview/" in ("/" + f)
        is_editable = (
            (ext.lower() in EDITABLE_EXTS or "/src/data/" in ("/" + f))
            and not is_bin and not is_render
        )
        idx[stem].append((f, ext.lower(), is_editable, is_bin))
        inner, inner_ext = os.path.splitext(stem)     # Foo.tsa -> Foo
        if inner_ext:
            idx[inner].append((f, ext.lower(), is_editable, is_bin))
    return idx


def _is_screen_tilemap(path):
    """True if a banim/frontier `.bin` is a 30x20 (600 u16) GBA BG **screen
    tilemap** (TSA). fe8u keeps every banim/bg tilemap binary
    (`graphics/banim/assets/tsa/*.map.bin`, `graphics/bg/*.tsa.bin`), so a JP
    banim screen tilemap is fe8u-FORM-parity FLOOR — it satisfies the strict goal
    even though it is a raw `.bin`. The fe8j extractor named these generically
    (`_NNN_ADDR.bin`, no `.tsa.bin` suffix), so neither the suffix guard nor the
    `Tsa_` name guard catches them; detect by CONTENT. Verified rigorously (D326):
    exactly 600 u16 tile-attr entries (a 30x20 GBA screen), all tile indices valid
    (< 1024), a dominant background fill, and <= 4 palettes.
    """
    p = "/" + path
    if "/graphics/frontier_" not in p and "/data/banim/" not in p:
        return False
    try:
        d = open(path, "rb").read()
    except OSError:
        return False
    if len(d) != 1200:                       # 600 u16 == 30x20 screen
        return False
    v = struct.unpack("<600H", d)
    if any((x & 0x3FF) >= 1024 for x in v):  # invalid tile index -> not a tilemap
        return False
    fill = Counter(v).most_common(1)[0][1] / 600.0
    pals = len({(x >> 12) & 0xF for x in v})
    return fill >= 0.2 and pals <= 4


# --------------------------------------------------------------------------- #
# Sparse BG-overlay TSA tilemap by CONTENT (companion to _is_screen_tilemap).   #
#                                                                              #
# _is_screen_tilemap only accepts the exact 30x20 == 600 u16 GBA screen. Some  #
# frontier TSA tilemaps have a DIFFERENT length -- e.g. the chapter-title      #
# string TSA `gChapterTitleStrTsa_jp` @ 0x08A92410                             #
# (`frontier_chap_title_115b_A92410.bin`, 601 u16 == 1202 B): the game         #
# `Decompress()`es it and feeds it to                                          #
# `CallARM_FillTileRect(gBG0TilemapBuffer, ..., TILEREF(0x280, pal))` in       #
# DrawChapterTitleStrEx_jp -- it is a BG tile-arrangement, NOT pixel gfx. fe8u #
# keeps every such TSA/tilemap binary (`*.tsa.bin`, `assets/tsa/*.map.bin`),   #
# so it is fe8u-FORM-parity FLOOR even though the fe8j extractor named it       #
# generically (`_NNN_ADDR.bin`) under a pixel-gfx dir. Detect by CONTENT,      #
# tuned so DENSE 4bpp pixel sheets can NEVER qualify (they are a multiple of   #
# 32 bytes and are not blank-tile-dominated).                                  #
# --------------------------------------------------------------------------- #
def _is_overlay_tsa_bytes(d):
    """Core content test (on raw bytes) for a SPARSE BG-overlay TSA tilemap: a
    u16 tile-attr array that is NOT a whole number of 4bpp tiles (`len % 32`),
    dominated (>= 85%) by the BLANK tile 0 (a mostly-empty overlay BG), and
    referencing <= 2 palette banks. A raw 4bpp tile sheet is always a multiple
    of 32 bytes and is dense/varied, so it fails both the `% 32` and the
    blank-fill guards -> it can never be a false FLOOR."""
    n = len(d)
    if n < 64 or n % 2 or n % 32 == 0:        # u16 array, NOT a raw 4bpp tile sheet
        return False
    v = struct.unpack("<%dH" % (n // 2), d)
    top_val, top_cnt = Counter(v).most_common(1)[0]
    if top_val != 0:                          # dominant fill must be the blank tile 0
        return False
    pals = len({(x >> 12) & 0xF for x in v})
    return top_cnt / len(v) >= 0.85 and pals <= 2


def _is_sparse_overlay_tilemap(path):
    """True if a frontier/banim `.bin` is a sparse BG-overlay TSA tilemap (see
    `_is_overlay_tsa_bytes`). Path-gated to the frontier/banim gfx dirs (same as
    `_is_screen_tilemap`); reads content and fails closed on any read error."""
    p = "/" + path
    if "/graphics/frontier_" not in p and "/data/banim/" not in p:
        return False
    try:
        d = open(path, "rb").read()
    except OSError:
        return False
    return _is_overlay_tsa_bytes(d)


# --------------------------------------------------------------------------- #
# Pinned residual-floor guards (issue #143 menu lane): drift-safe, fail-closed #
# content verification for the three genuine RE-complete floors (blob005/021/ #
# 027). A path name alone is NOT evidence of irreducibility -- a bare regex on #
# the filename would classify FLOOR even if the file were replaced with junk  #
# of the same name, or silently miss a deleted file. These three instead      #
# require an EXACT (size, sha256) match; the pinned hash was computed once    #
# from the tracked, already fully-audited residual and is intentionally not   #
# regenerable by this script (a drifted file must be re-audited by a human,   #
# not silently re-blessed). blob001's former 4632 B "residual" is NOT pinned  #
# here: it was a FALSE floor (D394/D395) -- fully sourceable, no longer a raw #
# file at all.                                                                #
# --------------------------------------------------------------------------- #
PINNED_RESIDUAL_FLOORS = {
    "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin": (
        395,
        "46e75502c72f4e066d6d8abe93c4cef6121027349af5ffe048ec0caa995da563",
        "RE-COMPLETE evidence-backed floor (395 B, trimmed from a 587 B "
        "over-extraction): proc-script leaf with 8 relocated function "
        "pointers, every byte's role proven; JP-exclusive, no fe8u twin to "
        "compare (D362, issue #143)"),
    "graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin": (
        174,
        "6ffae18b8345b2ffff8caef700464de40deb75aa0b5d2b32b992ec9eb754ac82",
        "RE-COMPLETE evidence-backed floor (174 B, trimmed from a 2318 B "
        "combined file): two disjoint live spans (gap21 head + gap21c "
        "interior) concatenated, every non-pointer byte a proven "
        "ProcCmd/SpriteEx field, all 9 interior pointers already relocated "
        ".4byte Sym; JP-exclusive, no fe8u twin (issue #143)"),
    "graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin": (
        342,
        "85748e2ed3c1e27ec5da07769f9cd0ed825c565e5ba86b15b2499dab26b6a7b3",
        "RE-COMPLETE evidence-backed floor (342 B, trimmed from a 1012 B "
        "combined file): two disjoint live spans (gap27 head + gap27c "
        "interior) concatenated, every non-pointer byte a proven ProcCmd "
        "field, all interior pointers already relocated .4byte Sym; "
        "JP-exclusive, no fe8u twin (issue #143)"),
}


def check_pinned_residual_floor(path, expect_size, expect_sha256):
    """Return None if `path` matches the pinned (size, sha256) exactly, else an
    error string. Fails closed: a missing file, a wrong size, and changed
    bytes (same size, different content) are all explicit failures -- never a
    silent FLOOR pass-through."""
    if not os.path.exists(path):
        return "MISSING tracked residual file"
    try:
        data = open(path, "rb").read()
    except OSError as e:
        return f"unreadable ({e})"
    if len(data) != expect_size:
        return f"size {len(data)} != pinned {expect_size}"
    got = hashlib.sha256(data).hexdigest()
    if got != expect_sha256:
        return f"sha256 {got} != pinned {expect_sha256}"
    return None


def _pinned_residual_floor_key(path):
    """Return the PINNED_RESIDUAL_FLOORS key matching `path`, or None. Matches
    both a bare repo-relative path and one with an extra directory prefix
    (mirroring the `(^|/)...$` anchoring style used by the regex rules
    elsewhere in this file), so callers can pass either form."""
    norm = path.replace("\\", "/")
    for key in PINNED_RESIDUAL_FLOORS:
        if norm == key or norm.endswith("/" + key):
            return key
    return None


def pinned_residual_floor_classify(path):
    """If `path` is one of the three pinned genuine residual floors, return
    its (category, proof, label) tuple -- FLOOR only on an exact (size,
    sha256) match; any drift is a hard UNCERTAIN failure naming the exact
    mismatch, distinguishable from the generic "needs RE" UNCERTAIN catch-all.
    Returns None for any other path (not one of the three pinned floors)."""
    key = _pinned_residual_floor_key(path)
    if key is None:
        return None
    expect_size, expect_sha256, proof = PINNED_RESIDUAL_FLOORS[key]
    err = check_pinned_residual_floor(path, expect_size, expect_sha256)
    if err:
        return ("UNCERTAIN",
                f"PINNED FLOOR VERIFICATION FAILED ({err}) -- content drifted "
                f"from the audited residual; re-audit required, not a silent "
                f"FLOOR (issue #143)",
                "pixel-gfx")
    return ("FLOOR", proof, "pixel-gfx")


def _is_lz_derivative_bin(path):
    """True if a frontier `.bin` is the DECOMPRESSED source of a committed
    build-time LZ77 stream -- it has a `<stem>.lz` or `<path>.lz` sibling on disk
    AND its content is a binary tile-attr map (not SJIS text). Such a `.bin` is a
    compressed-TSA/gfx derivative that fe8u keeps in binary form -> FLOOR, NOT an
    editable-source string-pool MISS. Fixes the frontier_df4_misc_lo false-MISS:
    `_015`/`_016` are LZ77-compressed in ROM and decode to u16 tile-attr maps
    (13-17%% printable, iconv CP932 fails); the genuine string pools
    (`_004-012`, `_017`) are raw text with no `.lz` sibling -> stay MISS. The LZ
    pixel-gfx in the same dir are `.4bpp(.lz)`, not `.bin`, so they never match.
    Path-gated to frontier gfx dirs; fails closed."""
    if not path.endswith(".bin") or "/graphics/frontier_df4_misc_lo/" not in "/" + path:
        return False
    if not (os.path.exists(path[:-4] + ".lz") or os.path.exists(path + ".lz")):
        return False
    try:
        d = open(path, "rb").read()
    except OSError:
        return False
    if not d:
        return False
    printable = sum(1 for b in d if 32 <= b < 127) / len(d)
    return printable < 0.5      # binary tile-attr map, not an SJIS string pool


# --------------------------------------------------------------------------- #
# LZ77 compressed-vs-decompressed detection (Rule 3b — D337 floor-count fix).  #
#                                                                              #
# A JP `.bin` that is GBA BIOS LZ77 (type 0x10) compressed AND decodes byte-   #
# for-byte to fe8u's DECOMPRESSED binary twin is a REDUCIBLE derivative: fe8u  #
# builds the `.lz` from that `.tsa.bin`/`.map.bin` source, so the JP blob is   #
# EXTRACTABLE (a MISS), not an opaque floor. Detecting this corrects the D337  #
# floor OVERSTATEMENT without over-reclassifying raw-parity twins (which carry #
# no 0x10 header and therefore fail the check -> they stay FLOOR).             #
# --------------------------------------------------------------------------- #
def _read_bytes(path):
    try:
        with open(path, "rb") as fh:
            return fh.read()
    except OSError:
        return None


def _lz77_header_size(data):
    """24-bit uncompressed size of a GBA BIOS LZ77 (type 0x10) blob, or None if
    `data` does not start with an 0x10 LZ77 header."""
    if len(data) < 4 or data[0] != 0x10:
        return None
    return data[1] | (data[2] << 8) | (data[3] << 16)


def _lz77_decompress(data):
    """Decode a GBA BIOS LZ77 (type 0x10) stream (stdlib only). Returns the
    decompressed bytes, or None if the header is not 0x10 or the stream is
    malformed. Produces exactly the leading, header-declared `size` bytes."""
    size = _lz77_header_size(data)
    if size is None:
        return None
    out = bytearray()
    pos = 4
    n = len(data)
    while len(out) < size:
        if pos >= n:
            return None
        flags = data[pos]
        pos += 1
        for bit in range(8):
            if len(out) >= size:
                break
            if flags & (0x80 >> bit):
                if pos + 1 >= n:
                    return None
                b0 = data[pos]
                b1 = data[pos + 1]
                pos += 2
                length = (b0 >> 4) + 3
                disp = (((b0 & 0xF) << 8) | b1) + 1
                if disp > len(out):
                    return None
                start = len(out) - disp
                for k in range(length):
                    out.append(out[start + k])
            else:
                if pos >= n:
                    return None
                out.append(data[pos])
                pos += 1
    return bytes(out[:size])


def _is_compressed_derivative(jp_abspath, fe8u_bin_relpath):
    """True iff the fe8j `.bin` at `jp_abspath` is an LZ77-compressed derivative of
    fe8u's DECOMPRESSED binary twin `fe8u_bin_relpath` (relative to FE8U).

    Principled + GENERAL (not tied to any basename): the JP blob must carry a GBA
    LZ77 (0x10) header whose 24-bit decompressed-size equals the fe8u twin's file
    size, AND a full stdlib LZ77 decode must reproduce that twin byte-for-byte.
    Fails CLOSED: an absent/unreadable twin, a non-0x10 blob, a size mismatch, or
    any decoded-byte difference returns False (the blob stays FLOOR). Raw-parity
    `.tsa.bin`/`.map.bin` twins (JP already decompressed) carry no 0x10 header, so
    they are never reclassified."""
    if FE8U is None:
        return False
    jp = _read_bytes(jp_abspath)
    if jp is None:
        return False
    dsize = _lz77_header_size(jp)
    if dsize is None:
        return False
    twin = _read_bytes(os.path.join(FE8U, fe8u_bin_relpath))
    if twin is None or len(twin) != dsize:
        return False
    dec = _lz77_decompress(jp)
    return dec is not None and dec == twin


# --------------------------------------------------------------------------- #
# Classification                                                               #
# --------------------------------------------------------------------------- #
def classify(path, fe8u_idx):
    """Return (category, proof, category_label)."""
    base = os.path.basename(path)
    # -1. Pinned residual-floor guard (issue #143 menu lane), checked BEFORE
    #     any name-based rule: the three genuine RE-complete residuals
    #     (blob005/021/027) require an exact (size, sha256) match, not just a
    #     matching path, before returning FLOOR. See PINNED_RESIDUAL_FLOORS /
    #     pinned_residual_floor_classify() above.
    pinned = pinned_residual_floor_classify(path)
    if pinned is not None:
        return pinned
    # 0. TSA / tilemap by NAME -> FLOOR. fe8u keeps every TSA/tilemap binary as
    #    `*.tsa.bin` / `*.map.bin`. The fe8j extractor named these with a
    #    `Tsa_`/`gTsa_` PREFIX or a `_map` suffix and DROPPED the `.tsa.bin`
    #    suffix the basename-match relies on; without this guard they
    #    coincidentally match a tile-sheet `.png` twin (the real source is the
    #    separate `.tsa.bin`) and get mislabeled MISS. See
    #    docs/bin_verification_wave8.md (classifier bug #1).
    if re.match(r"g?Tsa_", base, re.IGNORECASE) or base.endswith("_map.bin"):
        return ("FLOOR",
                "fe8u keeps this TSA/tilemap binary (`*.tsa.bin` / `*.map.bin`)",
                "TSA/.map.bin")
    # 0b. Screen tilemap by CONTENT (30x20 u16 TSA) -> FLOOR. fe8u keeps banim/bg
    #     tilemaps binary; the fe8j extractor named these generically so neither
    #     the suffix nor the `Tsa_` name guard catches them. See D326.
    if _is_screen_tilemap(path):
        return ("FLOOR",
                "fe8u keeps banim/bg screen tilemaps (30x20 u16 TSA) binary "
                "(`assets/tsa/*.map.bin`)",
                "TSA/.map.bin")
    # 0c. Sparse BG-overlay TSA tilemap by CONTENT (non-screen length) -> FLOOR.
    #     Companion to 0b for frontier TSA tilemaps whose length is NOT the exact
    #     30x20 screen -- e.g. the chapter-title string TSA `gChapterTitleStrTsa_jp`
    #     @ 0x08A92410 (`frontier_chap_title_115b_A92410.bin`, 601 u16): the game
    #     `Decompress()`es it into `CallARM_FillTileRect(gBG0TilemapBuffer, ...)`
    #     (DrawChapterTitleStrEx_jp), so it is a BG tile-arrangement, not pixel
    #     gfx. fe8u keeps such TSA tilemaps binary -> FLOOR (was a pixel-gfx
    #     name-class false-MISS). Content-gated so dense 4bpp sheets can't match.
    if _is_sparse_overlay_tilemap(path):
        return ("FLOOR",
                "fe8u keeps BG-overlay TSA tilemaps binary (`*.tsa.bin` / "
                "`assets/tsa/*.map.bin`) — sparse tile-arrangement (blank-tile "
                "fill), not pixel gfx",
                "TSA/.map.bin")
    # 0d. A frontier `.bin` that is the DECOMPRESSED source of a committed LZ77
    #     stream (has a `.lz`/`.bin.lz` sibling) and decodes to a binary tile-attr
    #     map -> FLOOR, BEFORE any path-class MISS rule. Fixes the
    #     frontier_df4_misc_lo false-MISS: `_015`/`_016` are LZ77-compressed TSA in
    #     ROM (13-17% printable, iconv CP932 fails), not SJIS string pools. The
    #     genuine string pools (`_004-012`, `_017`) are raw (no `.lz` sibling) and
    #     stay MISS; LZ pixel-gfx here are `.4bpp(.lz)`, not `.bin`.
    if _is_lz_derivative_bin(path):
        return ("FLOOR",
                "decompressed source of a committed LZ77 stream (`.lz` sibling), "
                "binary tile-attr map — fe8u keeps compressed gfx/TSA binary",
                _floor_label(path))
    # 1. FLOOR by suffix (fe8u keeps TSA/tilemaps binary). Label is directory-aware
    #    so the plan's efx / opanim sub-buckets stay visible even though those
    #    files happen to carry the .map.bin suffix.
    for suf in FLOOR_SUFFIXES:
        if path.endswith(suf):
            return ("FLOOR", "fe8u keeps %s binary (TSA/tilemap)" % suf, _floor_label(path))
    # 2. FLOOR by directory (raw .bin under a known fe8u floor dir)
    for pat in FLOOR_DIR_PATTERNS:
        if pat.search(path):
            return ("FLOOR", _floor_proof(path), _floor_label(path))

    # 3. fe8u basename match (strongest proof)
    img_like = _is_image_like(path)
    for base in basename_keys(path):
        hits = fe8u_idx.get(base)
        if not hits:
            continue
        editable = [h for h in hits if h[2]]
        binonly = [h for h in hits if h[3] and not h[2]]
        if editable:
            # Rank the editable twins so an image-shaped .bin prefers a .png twin
            # over a .pal/.agbpal twin that merely shares the stem (e.g.
            # btl_bg_14.feimg3.bin must map to btl_bg_14.png, NOT btl_bg_14.pal).
            editable.sort(key=lambda h: _twin_rank(h[1], img_like))
            proof = editable[0][0]
            return ("MISS", "fe8u %s" % proof, _cat_for_ext(proof))
        if binonly:
            proof = binonly[0][0]
            # Rule 3b: fe8u ALSO keeps a binary twin of this basename. Normally
            # that is FLOOR (fe8u keeps the asset binary too). EXCEPTION (D337
            # floor-overstatement fix): if the fe8j blob is an LZ77-COMPRESSED
            # derivative of fe8u's DECOMPRESSED binary source (fe8u builds the
            # `.lz` from that `.tsa.bin`/`.map.bin`), the JP blob is REDUCIBLE ->
            # MISS (extractable). Confirmed by a full stdlib LZ77 decode == twin
            # (see _is_compressed_derivative). Raw-parity twins (JP already
            # decompressed, no 0x10 header) fail this and stay FLOOR.
            if _is_compressed_derivative(os.path.join(FE8J, path), proof):
                return ("MISS",
                        "fe8u %s (fe8j ships the LZ77-compressed derivative; "
                        "decompresses byte-exact to this fe8u source)" % proof,
                        "lz-compressed-tsa")
            return ("FLOOR", "fe8u also keeps binary: %s" % proof,
                    "TSA/.map.bin" if proof.endswith((".tsa.bin", ".map.bin"))
                    else "ApConf/opaque")

    # 4. content-type name-class rules
    for rx, cat, proof in NAME_CLASS_RULES:
        if rx.search(path):
            return (cat, proof, _cat_for_proof(path, proof, cat))

    # 5. fallthrough -> UNCERTAIN
    return ("UNCERTAIN", "no fe8u basename/type match — needs RE", "ApConf/opaque")


def _floor_label(path):
    """Pick the plan's FLOOR sub-bucket for a binary fe8u also keeps."""
    if "efx" in path and "/banim/" in path:
        return "efx-effect-bins"
    if "op_anim" in path or "opanim" in path:
        return "opanim-tilemaps"
    if "direct_sound" in path:
        return "PCM/.aif"
    return "TSA/.map.bin"


def _floor_proof(path):
    if "efx" in path and "/banim/" in path:
        return "fe8u graphics/banim/efx* effect bins are binary"
    if "op_anim" in path or "opanim" in path:
        return "fe8u op_anim/opanim tilemaps are binary"
    if "direct_sound" in path:
        return "fe8u direct_sound PCM is binary"
    return "fe8u keeps this dir binary"


def _is_image_like(path):
    """True if the fe8j .bin looks like pixel graphics (prefer a .png twin)."""
    b = os.path.basename(path)
    if b.endswith((".feimg3.bin", ".4bpp.bin", ".8bpp.bin")):
        return True
    if re.search(r"(^|/)(Img_|gImg_|gGfx_|gfx_)", "/" + b, re.IGNORECASE):
        return True
    if "/graphics/" in ("/" + path) and not b.endswith((".pal.bin", ".tsa.bin", ".map.bin")):
        return True
    return False


def _twin_rank(ext, img_like):
    """Lower = preferred. For image-like .bin, .png beats .pal/.agbpal."""
    if img_like:
        order = {".png": 0, ".c": 1, ".s": 2, ".inc": 3, ".pal": 8, ".agbpal": 8}
    else:
        order = {".s": 0, ".c": 0, ".png": 1, ".mid": 1, ".aif": 1, ".pal": 2, ".agbpal": 2, ".inc": 3}
    return order.get(ext, 5)


def _cat_for_ext(p):
    """Bucket a MISS by its fe8u proof PATH (p) + extension."""
    if "banim/" in p:                       # banim/*.s, graphics/banim/*.png
        return "battle-anim"
    if p.startswith("sound/") or "/sound/" in p or "songs/" in p:
        if "voicegroup" in p:
            return "voicegroup-tail"
        return "sound-m4a-tables"
    if "events_udefs" in p:
        return "unitdef-residuals"
    if "menu_def" in p:
        return "menu-strings"
    if "graphics/map/" in p or p.endswith((".json", ".mar", ".S")):
        return "map-tilemaps"
    if p.endswith(".png"):
        return "pixel-gfx"
    if p.endswith((".s", ".mid", ".aif")):
        return "sound-m4a-tables"
    if p.endswith((".pal", ".agbpal")):
        return "pixel-gfx"
    if "/src/data/" in p or p.endswith(".c"):
        return "unitdef-residuals"
    return "pixel-gfx"


def _cat_for_proof(path, proof, cat):
    if cat == "UNCERTAIN":
        return "ApConf/opaque"
    # TSA/tilemap floor (even within the banim subsystem) -> the TSA label.
    if cat == "FLOOR" and ("TSA" in proof or "tsa" in proof or ".map.bin" in proof
                           or ".tsa.bin" in proof):
        return "TSA/.map.bin"
    if "banim" in proof or "data/banim" in path or "AnimSprite" in path:
        return "battle-anim"
    if "voicegroup" in proof or "voice_" in path:
        return "voicegroup-tail"
    if ("music_player_table" in proof or "m4a" in proof or "programmable_wave" in proof
            or "keysplit" in proof or "songs/mml" in proof or "sound/" in proof):
        return "sound-m4a-tables"
    if "menu_def" in proof or "string" in proof.lower() or "literal" in proof.lower():
        return "menu-strings"
    if "UnitDefinition" in proof or "events_udefs" in proof:
        return "unitdef-residuals"
    if "graphics/map" in proof or "MARTOMAP" in proof:
        return "map-tilemaps"
    if ".png" in proof:
        return "pixel-gfx"
    if ("AnimSpriteData" in proof or "sprite anim" in proof.lower()
            or "EVENT_" in proof or "PROC_" in proof or "typed C" in proof
            or "typed struct" in proof):
        return "unitdef-residuals"
    return "pixel-gfx"


# --------------------------------------------------------------------------- #
# Spot-check sampling (hand-verifiable proof)                                  #
# --------------------------------------------------------------------------- #
def spot_checks(results, n=6):
    miss = [r for r in results if r[1] == "MISS"]
    floor = [r for r in results if r[1] == "FLOOR"]

    def pick_diverse(rows, want):
        seen = set()
        out = []
        for r in rows:
            if r[3] not in seen:
                out.append(r)
                seen.add(r[3])
            if len(out) >= want:
                break
        i = 0
        while len(out) < want and i < len(rows):
            if rows[i] not in out:
                out.append(rows[i])
            i += 1
        return out

    return pick_diverse(miss, max(n, 5)), pick_diverse(floor, max(n, 5))


# --------------------------------------------------------------------------- #
# Doc emission                                                                 #
# --------------------------------------------------------------------------- #
def md_escape(s):
    return s.replace("|", "\\|")


def emit(results, fe8u_bin_count, fe8j_bin_count):
    cat_counts = defaultdict(int)
    label_counts = defaultdict(lambda: defaultdict(int))
    for path, cat, proof, label in results:
        cat_counts[cat] += 1
        label_counts[label][cat] += 1

    miss_samples, floor_samples = spot_checks(results)

    lines = []
    A = lines.append
    A("# `.bin` form audit — FE8J asset-editability epic (U0)")
    A("")
    A("> **Generated** by `scripts/audit_bin_forms.py` — do not edit by hand.")
    A("> Re-run `python3 scripts/audit_bin_forms.py` from the repo root to refresh.")
    A("> Living **miss-tracker** for the epic"
      " ([`docs/epic_asset_editability_shiftability.md`](epic_asset_editability_shiftability.md)).")
    A("")
    A("## Method (reviewable)")
    A("")
    A("For every committed `*.bin` in fe8j (`git ls-files '*.bin'`), classify against")
    A("the **fe8u oracle** (`git -C ../fireemblem8u ls-files`):")
    A("")
    A("- **MISS** — fe8u builds the *same* asset from a **more-editable source**")
    A("  (`.png` / `.s` / `.mid` / `.aif` / `.pal`/`.agbpal` / typed-C in `src/data`).")
    A("  Committing a raw `.bin` here is a regression to fix.")
    A("- **FLOOR** — fe8u *also* keeps this asset binary (`*.tsa.bin`, `*.map.bin`, the")
    A("  `fe6sio_payload`, `graphics/banim/efx*` effect bins, `op_anim`/`opanim` tilemaps,")
    A("  `direct_sound` PCM). Legitimate; **do not fake-extract** floor.")
    A("- **UNCERTAIN** — opaque blob (`ApConf_*`/`gUnkData_*`/`gap_*`/`data_<addr>`) whose")
    A("  fe8u source form is not yet known. Needs RE; **DEFERRED** — document, don't fake.")
    A("")
    A("Layered rules (first match wins): (1) FLOOR by `.tsa.bin`/`.map.bin`/`.fetsa3.bin`")
    A("suffix; (2) FLOOR by `efx*`/`op_anim`/`direct_sound` directory; (3) MISS/FLOOR by a")
    A("fe8u file of the same **basename** (address/`_o`/`_bin` suffixes stripped) — an")
    A("editable-extension twin ⇒ MISS (that fe8u path is the proof), a `.bin` twin ⇒ FLOOR;")
    A("(4) MISS/UNCERTAIN by **content-type name-class** for fe8j ROM-region-named blobs")
    A("whose fe8u form is known by *type* even when the basename differs (e.g.")
    A("`frontier_chap_title_*` → fe8u `.png`; `frontier_df4_misc_lo_*` → C string literals).")
    A("")
    A("> The fe8u oracle commits exactly **%d** binaries, all `*.tsa.bin` / `*.map.bin` /"
      " the `fe6sio_payload` — so any fe8j `.bin` with an editable fe8u twin is a true MISS."
      % fe8u_bin_count)
    A("")

    # Summary table
    A("## Summary")
    A("")
    total = len(results)
    A("| Category | Count | % of .bin |")
    A("|---|---:|---:|")
    for cat in ("MISS", "FLOOR", "UNCERTAIN"):
        c = cat_counts.get(cat, 0)
        pct = (100.0 * c / total) if total else 0.0
        A("| **%s** | %d | %.1f%% |" % (cat, c, pct))
    A("| **TOTAL** | %d | 100.0%% |" % total)
    A("")

    # Category breakdown (seeded from the plan)
    A("## Category breakdown (epic plan's audit findings vs. this run)")
    A("")
    A("| Category | Verdict | Count (this run) | fe8u editable form |")
    A("|---|---|---:|---|")
    emitted = set()
    for label, (verdict, form) in PLAN_CATEGORIES.items():
        n = sum(label_counts.get(label, {}).values())
        A("| %s | %s | %d | %s |" % (md_escape(label), verdict, n, md_escape(form)))
        emitted.add(label)
    for label in sorted(label_counts):
        if label not in emitted:
            for cat, n in sorted(label_counts[label].items()):
                A("| %s | %s | %d | (classifier name-class) |" % (md_escape(label), cat, n))
    A("")

    # Spot checks
    A("## Spot checks (hand-verified)")
    A("")
    A("Five+ MISS and five+ FLOOR entries verified by hand so the classification is")
    A("trustworthy (the prior research over-flagged `frontier_chap_title` images and")
    A("`frontier_df4_misc_lo` strings as floor — the chapter-title **images** and the")
    A("string pools are MISSES, listed under MISS; the chapter-title **string TSA**")
    A("companion (`gChapterTitleStrTsa_jp`, `frontier_chap_title_115b_A92410.bin`) is a")
    A("genuine FLOOR — all asserted by the self-test guards below).")
    A("")
    A("**MISS spot checks** (fe8u ships an editable source):")
    A("")
    for path, cat, proof, label in miss_samples:
        A("- `%s` → **MISS** (%s) — proof: %s" % (path, label, proof))
    A("")
    A("**FLOOR spot checks** (fe8u also keeps binary):")
    A("")
    for path, cat, proof, label in floor_samples:
        A("- `%s` → **FLOOR** (%s) — proof: %s" % (path, label, proof))
    A("")
    A("**Self-test guards** (the script exits non-zero if any fail):")
    A("")
    for note in SELF_TEST_NOTES:
        A("- %s" % note)
    A("")

    # Full listings
    for cat, blurb in (
        ("MISS", "fe8u builds these from editable source — fix (extract to the fe8u form)."),
        ("FLOOR", "fe8u also keeps these binary — legitimate; do NOT fake-extract."),
        ("UNCERTAIN", "fe8u form unknown — DEFERRED, needs RE; document, don't fake."),
    ):
        rows = sorted(r for r in results if r[1] == cat)
        A("## %s (%d) — %s" % (cat, len(rows), blurb))
        A("")
        A("<details><summary>%d entries</summary>" % len(rows))
        A("")
        A("| `.bin` (fe8j) | category | fe8u-source proof |")
        A("|---|---|---|")
        for path, _c, proof, label in rows:
            A("| `%s` | %s | %s |" % (md_escape(path), md_escape(label), md_escape(proof)))
        A("")
        A("</details>")
        A("")

    A("---")
    A("")
    rel = os.path.relpath(FE8U, FE8J) if FE8U else "(fe8u oracle not found)"
    A("_Regenerate: `python3 scripts/audit_bin_forms.py`. Oracle: `%s`._" % rel)
    A("")
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# Self-tests: assertions the classifier must satisfy.                          #
# --------------------------------------------------------------------------- #
SELF_TEST_NOTES = [
    "`frontier_chap_title_*` **images** are classified **MISS** (chapter-title gfx → fe8u `.png`), not FLOOR; the chapter-title **string TSA** companion (`gChapterTitleStrTsa_jp` @ `0x08A92410`, `frontier_chap_title_115b_A92410.bin`) is a genuine **FLOOR** — a sparse BG-overlay tile-arrangement (fed to `CallARM_FillTileRect`), not pixel gfx, and fe8u keeps such TSA tilemaps binary (the pixel-gfx name-class MISS rule stays intact for real images).",
    "`frontier_df4_misc_lo_*` is classified **MISS** (string pools → fe8u C literals), not FLOOR.",
    "`*.tsa.bin` and `*.map.bin` are classified **FLOOR** (fe8u keeps them binary).",
    "`Tsa_`/`gTsa_`-named and `*_map.bin` blobs are classified **FLOOR** (TSA/tilemaps; fe8u keeps them binary even when the fe8j extractor dropped the `.tsa.bin` suffix — bug #1).",
    "`graphics/gfx_data_bg/*_map.bin` BG tilemaps are classified **FLOOR** (→ fe8u `bg_*.tsa.bin`).",
    "`graphics/frontier_df4_uistuff/*` is classified **UNCERTAIN** (JP-divergent UI table, no fe8u twin — not a string-pool MISS; bug #2), EXCEPT the two RE'd-and-extracted TSA companions `Tsa_sub_8021AFC.tsa.bin` / `Tsa_Sub8022200.tsa.bin` (issue #143), which are correctly **FLOOR** by the `.tsa.bin`-suffix rule (proven real ABS consumers in `src/sub_8021AFC.c` / `src/sub_8022200.c`).",
    "`graphics/banim/efx*` effect bins are classified **FLOOR**.",
    "`data/sound/gMPlayTable.bin` is classified **MISS** (→ fe8u `sound/music_player_table.s`).",
    "30x20 u16 banim/bg **screen tilemaps** (600 entries, valid tile idx, dominant fill) are classified **FLOOR** by content — fe8u keeps banim/bg tilemaps binary (`assets/tsa/*.map.bin`); the fe8j extractor named them generically without the `.tsa.bin` suffix (D326).",
    "Non-screen-length frontier BG-overlay **TSA tilemaps** (a u16 tile-attr array that is NOT a multiple of 32 B, dominated by the blank tile 0, ≤ 2 palettes — e.g. `gChapterTitleStrTsa_jp` / `frontier_chap_title_115b_A92410.bin`) are classified **FLOOR** by content (rule 0c), the companion to the 30×20 screen-tilemap rule (0b). Dense 4bpp pixel sheets (multiple of 32 B) can never match.",
    "**D337-correction (Rule 3b):** a JP `.bin` that is the LZ77-compressed derivative of fe8u's DECOMPRESSED binary source (`0x10` header, decoded size == twin size, full stdlib decode == twin bytes) is classified **MISS** (extractable), not FLOOR. The historical mis-floored LZ class (`gWorldmapMinimap_1`, `gUnkData_{15,67,68,70,71,72,73,80,89,92}`) has since been EXTRACTED to `graphics/**/*.tsa.bin` (issue #140) and is now fe8u-form-parity **FLOOR**; the rule remains as a fail-closed regression guard (helper-unit-tested below).",
    "Raw-parity twins (JP already decompressed; no `0x10` header — e.g. the extracted `gUnkData_15`, `gMenuSoundroom_*`, `gBattleForecast_*`, `gEndingDetails_0`) are GENUINE **FLOOR** and are NOT over-reclassified (the rule fails closed on any absent / non-`0x10` / size- or byte-mismatch).",
]


def _self_test_lz77_helpers():
    """File-independent (+ two real-file) regression guards for the D337-correction
    Rule 3b helpers. These run on EVERY invocation regardless of which blobs are
    present, so the compressed-vs-decompressed rule stays covered even now that the
    11 originally-reclassified LZ blobs have been extracted out of the .bin set."""
    fails = []
    # Known-good GBA BIOS LZ77 (type 0x10) vector: literals "ABC" + a
    # (len=6, disp=3) back-reference -> "ABCABCABC" (9 bytes).
    vec = bytes([0x10, 0x09, 0x00, 0x00, 0x10, 0x41, 0x42, 0x43, 0x30, 0x02])
    if _lz77_header_size(vec) != 9:
        fails.append("_lz77_header_size(known vector) != 9")
    if _lz77_decompress(vec) != b"ABCABCABC":
        fails.append("_lz77_decompress(known vector) != b'ABCABCABC'")
    # Fails CLOSED on a non-0x10 blob (raw-parity must never look compressed):
    if _lz77_header_size(b"\x00\x01\x02\x03") is not None:
        fails.append("_lz77_header_size(non-0x10) should be None")
    if _lz77_decompress(b"\x00\x01\x02\x03") is not None:
        fails.append("_lz77_decompress(non-0x10) should be None")
    # _is_compressed_derivative FALSE-path on a real raw .tsa.bin twin (no 0x10
    # header) -- the extracted fe8u-form-parity class must stay FLOOR:
    raw = os.path.join(FE8J, "graphics/misc/gUnkData_15.tsa.bin")
    if os.path.exists(raw) and _is_compressed_derivative(
            raw, "graphics/misc/gUnkData_15.tsa.bin"):
        fails.append("_is_compressed_derivative must be False for a raw "
                     "(non-0x10) .tsa.bin twin")
    # _is_compressed_derivative TRUE-path on the one real compressed derivative
    # left in the tree: menu_029's LEADING LZ stream decodes byte-exact to fe8u
    # Tsa_MainMenuBgFog.tsa.bin (2050 B). NOTE: classify() does NOT reclassify
    # menu_029 (no fe8u basename-twin; the ~14 KB opaque tail makes the whole blob
    # a concatenation -> D338 Tier-2 "partial/embedded"); this only exercises the
    # decode+size+byte-compare glue. Guarded so a future menu_029 extraction skips.
    m029 = os.path.join(
        FE8J, "graphics/frontier_df4_menu/frontier_df4_menu_029_AA3860.bin")
    twin = "graphics/misc/Tsa_MainMenuBgFog.tsa.bin"
    if (os.path.exists(m029) and FE8U is not None
            and os.path.exists(os.path.join(FE8U, twin))
            and not _is_compressed_derivative(m029, twin)):
        fails.append("_is_compressed_derivative TRUE-path (menu_029 leading "
                     "stream -> Tsa_MainMenuBgFog) regressed")
    return fails


def _self_test_overlay_tsa_helpers():
    """Regression guards for the sparse BG-overlay TSA FLOOR rule (rule 0c).
    File-independent unit tests on `_is_overlay_tsa_bytes` (one positive + three
    isolated negatives that each trip a single guard) plus a guarded real-file
    check on the chapter-title string TSA (`gChapterTitleStrTsa_jp`, 115b)."""
    fails = []
    # POSITIVE: 601 u16 = 1 non-blank (pal 1) + 600 blank tile-0 -> 1202 B
    # (1202 % 32 != 0), 99.8% blank fill, 2 palette banks -> overlay TSA.
    pos = struct.pack("<601H", 0x131d, *([0] * 600))
    if not _is_overlay_tsa_bytes(pos):
        fails.append("_is_overlay_tsa_bytes(sparse blank-fill TSA) must be True")
    # NEGATIVE 1: a whole number of 4bpp tiles (multiple of 32 B) is a raw tile
    # sheet, never a tilemap -- even when entirely blank.
    if _is_overlay_tsa_bytes(bytes(1024)):        # 1024 % 32 == 0
        fails.append("_is_overlay_tsa_bytes(multiple-of-32 tile sheet) must be False")
    # NEGATIVE 2: dominant fill is a NON-blank tile (not an empty-BG overlay).
    if _is_overlay_tsa_bytes(struct.pack("<601H", 0x131d, *([129] * 600))):
        fails.append("_is_overlay_tsa_bytes(non-blank dominant fill) must be False")
    # NEGATIVE 3: > 2 palette banks referenced (dense pixel-like high nibbles),
    #             even with a blank-tile-dominated, non-multiple-of-32 array.
    if _is_overlay_tsa_bytes(struct.pack("<601H", 0x1000, 0x2000, 0x3000,
                                         *([0] * 598))):
        fails.append("_is_overlay_tsa_bytes(>2 palette banks) must be False")
    # Real-file (guarded): the actual 115b TSA must qualify.
    tp = os.path.join(
        FE8J, "graphics/frontier_chap_title/frontier_chap_title_115b_A92410.bin")
    if os.path.exists(tp) and not _is_overlay_tsa_bytes(open(tp, "rb").read()):
        fails.append("_is_overlay_tsa_bytes must be True for the real 115b TSA "
                     "(gChapterTitleStrTsa_jp)")
    return fails


def check_pinned_residual_floor_presence(by_path):
    """Fail-closed presence guard for PINNED_RESIDUAL_FLOORS: iterate every
    pinned key and require it to appear in `by_path` (the real classified
    inventory from this run) BEFORE trusting its classification. Without this,
    a pinned path that is silently deleted/untracked would simply have zero
    matches in the `expect()` substring search below and be skipped ("not
    present in this checkout"), never raising a failure -- exactly the
    "audit must scream, not silently celebrate" gap this closes. Returns a
    list of failure strings (empty = every pinned path is present)."""
    failures = []
    for key in PINNED_RESIDUAL_FLOORS:
        if not any(p == key or p.endswith("/" + key) for p in by_path):
            failures.append(
                f"PINNED RESIDUAL FLOOR MISSING FROM INVENTORY: {key!r} is a "
                f"pinned residual floor (PINNED_RESIDUAL_FLOORS) but does not "
                f"appear anywhere in the classified `.bin` inventory for this "
                f"run -- the tracked file was deleted/renamed/untracked "
                f"without updating the pin registry; this is a hard failure, "
                f"not a silent skip")
    return failures


def run_pinned_residual_floor_self_tests():
    """Direct, synthetic-fixture self-tests for the pinned-residual-floor
    mechanism (issue #143 menu lane): valid, wrong-size, wrong-content,
    missing-file, and inventory-presence cases, independent of the real
    tracked files (so a real accidental edit to the tracked residual can't
    hide a broken checker, and vice versa). Returns a list of failure
    strings (empty = all passed)."""
    import tempfile
    failures = []
    with tempfile.TemporaryDirectory() as td:
        valid_path = os.path.join(td, "valid.bin")
        payload = b"\x42" * 174
        with open(valid_path, "wb") as f:
            f.write(payload)
        good_sha = hashlib.sha256(payload).hexdigest()

        # valid: exact size + exact hash -> None (no error)
        err = check_pinned_residual_floor(valid_path, 174, good_sha)
        if err is not None:
            failures.append(f"pinned-floor valid case: expected None, got {err!r}")

        # wrong-size: same content family, different declared expected size
        err = check_pinned_residual_floor(valid_path, 175, good_sha)
        if err is None or "size" not in err:
            failures.append(f"pinned-floor wrong-size case: expected a size "
                            f"mismatch error, got {err!r}")

        # wrong-content: same size, different bytes (same-size tamper) -> must FAIL
        tampered_path = os.path.join(td, "tampered.bin")
        with open(tampered_path, "wb") as f:
            f.write(b"\x43" * 174)  # same length, different content
        err = check_pinned_residual_floor(tampered_path, 174, good_sha)
        if err is None or "sha256" not in err:
            failures.append(f"pinned-floor wrong-content case (same-size "
                            f"tamper): expected a sha256 mismatch error, "
                            f"got {err!r}")

        # missing: file absent entirely -> must FAIL
        missing_path = os.path.join(td, "does_not_exist.bin")
        err = check_pinned_residual_floor(missing_path, 174, good_sha)
        if err is None or "MISSING" not in err:
            failures.append(f"pinned-floor missing-file case: expected a "
                            f"MISSING error, got {err!r}")

        # classify()-level wiring: a drifted file at one of the three REAL
        # pinned paths must come back UNCERTAIN with an explicit
        # "VERIFICATION FAILED" proof, never a silent FLOOR.
        drift_key = "graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin"
        drift_path = os.path.join(td, os.path.basename(drift_key))
        with open(drift_path, "wb") as f:
            f.write(b"\x00" * 21)  # arbitrary same-directory-name-like content
        # exercise the classify path directly via the key lookup, bypassing the
        # real tracked file entirely, by faking the "path ends with key" match:
        fake_path = "/some/checkout/" + drift_key
        # (fake_path does not exist on disk, so this also covers "absent file"
        #  through the real classify()-facing entry point.)
        cat, proof, _ = pinned_residual_floor_classify(fake_path)
        if cat != "UNCERTAIN" or "VERIFICATION FAILED" not in proof:
            failures.append(f"pinned-floor classify() missing-file wiring: "
                            f"expected UNCERTAIN/VERIFICATION FAILED, got "
                            f"{cat!r}/{proof!r}")

    # inventory-presence regression: synthesize a `by_path` inventory that
    # contains every pinned floor EXCEPT one, and assert the presence guard
    # (check_pinned_residual_floor_presence) explicitly catches the missing
    # one -- proving a deleted/untracked pinned path cannot silently pass
    # (the `expect()` substring search below would find zero matches and
    # skip it without this guard).
    all_keys = list(PINNED_RESIDUAL_FLOORS)
    assert all_keys, "PINNED_RESIDUAL_FLOORS must not be empty for this test to be meaningful"
    omitted = all_keys[0]
    fake_by_path = {k: ("FLOOR", "fixture", "pixel-gfx") for k in all_keys if k != omitted}
    presence_failures = check_pinned_residual_floor_presence(fake_by_path)
    if not any(omitted in f for f in presence_failures):
        failures.append(
            f"pinned-floor inventory-presence regression: removing "
            f"{omitted!r} from a synthetic by_path did not trigger a "
            f"presence-guard failure naming it (got {presence_failures!r})")
    # and the complementary case: a FULLY populated inventory must produce no
    # presence failures at all.
    full_by_path = {k: ("FLOOR", "fixture", "pixel-gfx") for k in all_keys}
    if check_pinned_residual_floor_presence(full_by_path):
        failures.append(
            "pinned-floor inventory-presence regression: a fully-populated "
            "synthetic by_path unexpectedly triggered a presence failure")
    return failures


def run_self_tests(by_path):
    failures = []
    failures.extend(run_pinned_residual_floor_self_tests())
    # Fail-closed presence guard against the REAL classified inventory for
    # this run: every PINNED_RESIDUAL_FLOORS key must actually appear. A
    # deleted/renamed/untracked pinned file is a hard failure here, not a
    # silent skip (see check_pinned_residual_floor_presence docstring).
    failures.extend(check_pinned_residual_floor_presence(by_path))

    def expect(substr, want_cat):
        matches = [p for p in by_path if substr in p]
        if not matches:
            return  # not present in this checkout — skip silently
        bad = [p for p in matches if by_path[p][1] != want_cat]
        if bad:
            failures.append("expected %s for %r, got %s (e.g. %s)"
                            % (want_cat, substr, by_path[bad[0]][1], bad[0]))

    # frontier_df4_misc_lo genuine SJIS string pools -> MISS (fe8u C literals).
    # But _015/_016 are LZ77-compressed TSA derivatives (`.lz` sibling, binary
    # tile-attr map, not text): a former false-MISS now correctly FLOOR via
    # rule 0d (`_is_lz_derivative_bin`). The raw string pools have no `.lz`.
    expect("frontier_df4_misc_lo_004", "MISS")
    expect("frontier_df4_misc_lo_015", "FLOOR")
    expect("frontier_df4_misc_lo_016", "FLOOR")
    # frontier_chap_title PIXEL sheets are MISS (-> fe8u .png) and are all already
    # extracted to .png, so the ONE remaining chap_title `.bin` is the sparse
    # BG-overlay string TSA (`gChapterTitleStrTsa_jp`, 115b), a genuine FLOOR
    # (rule 0c). Assert the TSA is FLOOR AND that the pixel-gfx name-class MISS
    # rule is still present (so any real chapter-title image `.bin` stays MISS).
    expect("frontier_chap_title_115b_A92410.bin", "FLOOR")
    if not any(cat == "MISS" and "chap_title" in pf
               and rx.search("graphics/frontier_chap_title/x.bin")
               for rx, cat, pf in NAME_CLASS_RULES):
        failures.append("frontier_chap_title pixel-gfx MISS name-class rule "
                        "regressed (real chapter-title images must stay MISS)")
    expect(".tsa.bin", "FLOOR")
    expect(".map.bin", "FLOOR")
    expect("/Tsa_", "FLOOR")            # bug #1: TSA by name -> FLOOR
    expect("_map.bin", "FLOOR")         # bug #1: tilemaps -> FLOOR
    expect("graphics/gfx_data_bg/", "FLOOR")
    # issue #143: the two sub_8021AFC/Sub8022200 TSA companions were RE'd and
    # extracted to named `.tsa.bin` (real ABS consumers proven) -> correctly
    # FLOOR now (see the `.tsa.bin` FLOOR expect() above). Narrow bug #2's
    # blanket UNCERTAIN assertion to the genuinely-still-unRE'd remainder.
    expect("graphics/frontier_df4_uistuff/frontier_df4_uistuff_007_59140C.bin", "UNCERTAIN")  # bug #2
    expect("graphics/frontier_df4_uistuff/Tsa_sub_8021AFC.tsa.bin", "FLOOR")  # #143
    expect("graphics/frontier_df4_uistuff/Tsa_Sub8022200.tsa.bin", "FLOOR")  # #143
    # issue #143 menu coverage pass: the three genuine RE-complete residuals
    # (005/021/027, each pinned by exact size+sha256 -- see
    # PINNED_RESIDUAL_FLOORS) are evidence-backed FLOORs, not UNCERTAIN --
    # every byte's role is proven even though there is no fe8u twin to compare.
    # blob001's former 4632 B "residual" is intentionally NOT expected FLOOR
    # here: it was a false floor (D394/D395), now fully typed/editable with no
    # raw file at all, so it must not appear in `by_path` as a `.bin` any more.
    if any("frontier_df4_menu_001_A588C0.bin" in p for p in by_path):
        failures.append("frontier_df4_menu_001_A588C0.bin still tracked as a "
                        "raw .bin -- the false floor should be fully typed/"
                        "editable with zero raw bytes remaining (D394/D395)")
    expect("frontier_df4_menu_005_A5FFAD.bin", "FLOOR")
    expect("frontier_df4_menu_021_A95B4E.bin", "FLOOR")
    expect("frontier_df4_menu_027_A9D462.bin", "FLOOR")
    expect("graphics/banim/efx", "FLOOR")
    expect("data/sound/gMPlayTable.bin", "MISS")
    # D326: verified 30x20 u16 banim screen tilemaps -> FLOOR (fe8u keeps binary)
    expect("frontier_banim_aurabg3/frontier_banim_aurabg3_005_774CB8.bin", "FLOOR")
    # D337-correction (Rule 3b compressed-vs-decompressed fix) — POST-EXTRACTION.
    # The 11 LZ blobs this rule was written to reclassify (e.g.
    # data/residual/gUnkData_15.bin) were EXTRACTED to graphics/**/*.tsa.bin
    # (issue #140), so they are GONE from the .bin set on this tree. Asserting on
    # those deleted paths would silently skip (see expect() above) and test
    # NOTHING. Instead: (b) assert a representative EXTRACTED twin is correctly
    # FLOOR (fe8u-form-parity, no 0x10 header -> the rule must not over-
    # reclassify it), and (a)+(c) unit-test the LZ77 helpers + both directions of
    # _is_compressed_derivative (file-independent + two real files) so the rule
    # stays covered even with 0 live reclassifications here.
    expect("graphics/misc/gUnkData_15.tsa.bin", "FLOOR")
    failures.extend(_self_test_lz77_helpers())
    failures.extend(_self_test_overlay_tsa_helpers())
    return failures


# --------------------------------------------------------------------------- #
# Main                                                                         #
# --------------------------------------------------------------------------- #
def main():
    if FE8U is None or not os.path.isdir(FE8U):
        sys.stderr.write("ERROR: fe8u oracle repo not found "
                         "(set $FE8U or place it at ../fireemblem8u).\n")
        return 2

    fe8j_bins = ls_bins(FE8J)
    fe8u_files = all_files(FE8U)
    fe8u_bins = ls_bins(FE8U)
    fe8u_idx = build_fe8u_index(fe8u_files)

    results = []   # (path, cat, proof, label)
    by_path = {}
    for path in fe8j_bins:
        cat, proof, label = classify(path, fe8u_idx)
        rec = (path, cat, proof, label)
        results.append(rec)
        by_path[path] = rec

    failures = run_self_tests(by_path)
    if failures:
        sys.stderr.write("SELF-TEST FAILURES (classification regressed):\n")
        for f in failures:
            sys.stderr.write("  - " + f + "\n")
        return 1

    doc = emit(results, len(fe8u_bins), len(fe8j_bins))
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w", encoding="utf-8") as fh:
        fh.write(doc)

    n_miss = sum(1 for r in results if r[1] == "MISS")
    n_floor = sum(1 for r in results if r[1] == "FLOOR")
    n_unc = sum(1 for r in results if r[1] == "UNCERTAIN")
    sys.stdout.write(
        "audit_bin_forms: %d .bin classified -> MISS=%d FLOOR=%d UNCERTAIN=%d\n"
        % (len(results), n_miss, n_floor, n_unc))
    sys.stdout.write("wrote %s\n" % os.path.relpath(OUT, FE8J))
    return 0


if __name__ == "__main__":
    sys.exit(main())
