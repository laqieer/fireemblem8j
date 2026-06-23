#### Fire Emblem: Seima no Kouseki (FE8 JP) decompilation ####
#
# Bootstrap build: reproduces the original JP ROM byte-for-byte from a raw-ROM
# incbin baseline (asm/baserom.s), then progressively replaces incbin ranges
# with decompiled C (src/) and descriptively-named asm/data. Mirrors the
# toolchain of the sibling US decomp (../fireemblem8u).
#
# baserom.gba is NOT a build input: the build is self-contained (0 `.incbin
# "baserom.gba"`), so `make compare` builds from committed source and verifies
# `sha1sum -c checksum.sha1` (7da0456035366aa18414faa79d8fe7649f03c1ed). A local
# baserom.gba is needed ONLY for optional dev-only re-extraction, never to build.

#### Parallelism ####
# The build is per-object (`%.o: %.c/.s`) and embarrassingly parallel: a clean
# `make -j$(nproc)` is byte-identical to a serial build (verified) and ~6-8x faster
# (16-core: 54s vs ~6min). Default to a parallel build for EVERY invocation (local,
# sub-agent worktrees, CI) unless the caller already passed -j. The layout-generation
# step (asm/baserom.s + ldscript via gen_layout) is a proper prerequisite of the
# compile targets, so parallel ordering stays correct.
ifeq ($(filter -j%,$(MAKEFLAGS)),)
  NPROC := $(shell nproc 2>/dev/null || echo 4)
  MAKEFLAGS += -j$(NPROC)
endif

#### Tools ####

ifeq ($(OS),Windows_NT)
  EXE := .exe
else
  EXE :=
endif

UNAME := $(shell uname)

TOOLCHAIN ?= $(DEVKITARM)
PREFIX    ?= arm-none-eabi-
export PATH := $(TOOLCHAIN)/bin:$(PATH)

# Prefer arm-none-eabi-cpp if present, else the host cpp (agbcc headers come via
# -nostdinc -I tools/agbcc/include, so the host preprocessor is fine).
CPP     ?= $(shell command -v $(PREFIX)cpp$(EXE) 2>/dev/null || echo cpp)
AS      := $(PREFIX)as$(EXE)
LD      := $(PREFIX)ld$(EXE)
OBJCOPY := $(PREFIX)objcopy$(EXE)
STRIP   := $(PREFIX)strip$(EXE)

# agbcc (GCC 2.95 for ARM7TDMI). Installed locally into tools/agbcc (gitignored),
# same as the US decomp. Only needed once C decompilation begins.
CC1     := tools/agbcc/bin/agbcc$(EXE)
CC1_OLD := tools/agbcc/bin/old_agbcc$(EXE)
# CC1_JP: agbcc with the thumb PROMOTE_MODE patched to PRESERVE sub-word type
# signedness (s8/s16 -> sign-extend) instead of force-zero-extending everything.
# The stock agbcc force-zero-extends all sub-word values; the JP-FE8 build kept
# type signedness, so functions that hold an s8/s16 value sign-extended across the
# body only byte-match under this variant (the s8/s16-hold "ceiling" class, D275).
# Applied PER-TU (like CC1_OLD for m4a) since it is NOT globally byte-neutral.
# Build it with scripts/build_jp_agbcc.sh (clones pret/agbcc + applies the patch).
CC1_JP  := tools/agbcc/bin/jp_agbcc$(EXE)

# m4a sound-engine TUs were built with the old GBA SDK agbcc; their codegen
# shape (prologue, dead reg-inits) differs from the regular agbcc, so they
# only byte-match under old_agbcc (same as fe8u's `src/m4a.o: CC1 := CC1_OLD`).
src/ClearModM.o src/m4aSongNumStart.o src/m4aSongNumStop.o \
src/m4aSongNumContinue.o src/m4aSongNumStartOrChange.o \
src/m4aSongNumStartOrContinue.o src/m4aSoundInit.o src/MPlayExtender.o src/CgbSound.o src/m4aSoundMode.o src/MPlayContinue.o src/MPlayFadeOut.o src/m4aMPlayFadeOutTemporarily.o src/m4aMPlayFadeIn.o src/m4aMPlayImmInit.o src/m4aSoundVSyncOff.o src/m4aSoundVSyncOn.o src/MPlayStart.o src/FadeOutBody.o src/TrkVolPitSet.o src/CgbOscOff.o src/CgbModVol.o src/m4aMPlayTempoControl.o src/m4aMPlayModDepthSet.o src/m4aMPlayLFOSpeedSet.o src/ply_xwave.o: CC1 := $(CC1_OLD)

# JP-agbcc (signedness-preserving) per-TU overrides — s8/s16-hold-form functions
# that only byte-match when sub-word values keep their type signedness (D275).
src/TsaModifyFirstPalReverse.o: CC1 := $(CC1_JP)

# Asset toolchain (Phase 0): vendored into the gitignored tools/<tool>/ via
# scripts/tools/<tool>/setup.sh (gbagfx FIRST, then bin2c, preproc). These turn
# committed PNG/.pal source into the raw GBA bytes the ROM contains, so graphics
# regions build from source instead of `.incbin "baserom.gba"`. See
# docs/tools/{gbagfx,bin2c,preproc}.md.
GBAGFX     := tools/gbagfx/gbagfx$(EXE)
BIN2C      := tools/bin2c/bin2c$(EXE)
PREPROC    := tools/preproc/preproc$(EXE)
# Sound toolchain (Phase 1 Music): aif2pcm (AIFF -> raw GBA PCM sample) and
# mid2agb (.mid -> m4a song bytecode). Vendored via scripts/tools/<tool>/setup.sh.
AIF2PCM    := tools/aif2pcm/aif2pcm$(EXE)
MID2AGB    := tools/mid2agb/mid2agb$(EXE)
# gbagfx converts both tiles and palettes; PAL2GBAPAL aliases it for the .pal rule.
PAL2GBAPAL := $(GBAGFX)

PYTHON  ?= python3

ifeq ($(UNAME),Darwin)
  SHASUM := shasum
else
  SHASUM := sha1sum
endif

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g
# agb_sram fast-SRAM routines byte-match only at -O1 (same as fe8u's `src/agb_sram.o`).
src/ReadSramFast_Core.o src/WriteSramFast.o: CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O1 -fhex-asm -ffix-debug-line -g
CPPFLAGS := -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork -I include -I .

#### Files ####

ROM      := fireemblem8.gba
ELF      := $(ROM:.gba=.elf)
MAP      := $(ROM:.gba=.map)
LDSCRIPT := ldscript.txt

CFILES      := $(wildcard src/*.c) $(wildcard src/data/*.c) $(wildcard src/data/map/*.c)
# DATA_INCBIN_CFILES: any src/data/<subdir>/*.c (depth >= 2, excluding map/ which
# has no INCBIN macros and is already in CFILES) compiled with preproc first so
# INCBIN_U8/INCBIN_U16/INCBIN_U32 expand before cpp sees them.  Mirror of the US
# DATA_SRC_C_OBJECTS rule.  Adding a new data-C subsystem under src/data/<new>/
# gets the preproc pipeline automatically -- no per-subsystem Makefile edit needed.
DATA_INCBIN_CFILES  := $(shell find src/data -mindepth 2 -name '*.c' -not -path '*/map/*' 2>/dev/null)
DATA_INCBIN_OBJECTS := $(DATA_INCBIN_CFILES:.c=.o)
# asm/baserom.s + asm/jp_syms.s are GENERATED from the layout/ manifests by
# scripts/gen_layout.py (gitignored, regenerated at build time). Manage them
# explicitly rather than via the wildcard, which would miss them on a fresh
# checkout (they don't exist until the first build regenerates them).
GENERATED_S := asm/baserom.s asm/jp_syms.s
# src/msg_data.c is GENERATED-AND-COMMITTED from the JP text source
# (texts/jp_texts.txt + textdefs + huffman tiebreaks) by scripts/texttools/msg_jp.py
# build-c. It re-Huffman-encodes the message block byte-identically as COMPILED C
# (3339 CompressedText_MSG arrays + gMsgHuffmanTable + gMsgTable), the same shape
# as the US src/msg_data.c -- so the bytes count as genuinely extracted data, not
# an opaque asm blob. Committed (like the US) so the src/*.c wildcard sees it on a
# fresh checkout with NO baserom dependency; editing texts/ regenerates it. See
# docs/text.md.
ASM_S_FILES := $(filter-out $(GENERATED_S),$(wildcard asm/*.s))
C_OBJECTS   := $(CFILES:.c=.o)
# DATA_INCBIN_ASM_EXCLUDE: asm/*.s whose symbols are now provided by DATA_INCBIN_OBJECTS.
# The .s files remain committed (so git is clean) but must not enter the link.
# Add one entry per data-C object added under src/data/<subdir>/.
DATA_INCBIN_ASM_EXCLUDE := asm/dat_worldmap_gmap_p0.s \
                           asm/dat_data_portrait.s \
                           asm/dat_data_item_icon.s \
                           asm/dat_const_data_unit_icon_wait.s \
                           asm/dat_mapanim_battleinfo.s \
                           asm/dat_mapanim_nightmare.s \
                           asm/dat_mapanim_monster_gorgon.s \
                           asm/dat_mapanim_eventcall.s \
                           asm/dat_ending_cg_p0.s \
                           asm/dat_data_btl_bg_p0.s \
                           asm/dat_data_btl_bg_p1.s \
                           asm/dat_data_btl_bg_p2.s \
                           asm/dat_data_btl_bg_p3.s \
                           asm/dat_data_btl_bg_p13.s \
                           asm/dat_data_btl_bg_p14.s \
                           asm/dat_data_btl_bg_p15.s \
                           asm/dat_data_btl_bg_p16.s \
                           asm/frontier_chap_title.s \
                           asm/dat_gGfx_OpSubtitle_00_ref.s \
                           asm/dat_gGfx_OpSubtitle_01_ref.s \
                           asm/dat_gGfx_OpSubtitle_02_ref.s \
                           asm/dat_gGfx_OpSubtitle_03_ref.s \
                           asm/dat_gGfx_OpSubtitle_04_ref.s \
                           asm/dat_gGfx_OpSubtitle_05_ref.s \
                           asm/dat_gGfx_OpSubtitle_06_ref.s \
                           asm/dat_gTsa_OpSubtitle_00_ref.s \
                           asm/dat_gTsa_OpSubtitle_01_ref.s \
                           asm/dat_gTsa_OpSubtitle_03_ref.s \
                           asm/dat_gTsa_OpSubtitle_04_ref.s \
                           asm/dat_gTsa_OpSubtitle_05_ref.s \
                           asm/dat_const_data_DB034_gf.s \
                           asm/dat_data_map_anim_frames.s \
                           asm/dat_data_banim_p196.s \
                           asm/dat_data_banim_p175.s \
                           asm/dat_data_banim_p213.s \
                           asm/dat_data_ekrdk.s \
                           asm/dat_data_banim_p117.s \
                           asm/dat_data_btl_bg.s \
                           asm/dat_data_banim_p105.s \
                           asm/dat_data_banim_p104.s \
                           asm/dat_data_banim_p183.s \
                           asm/dat_data_banim_p185.s \
                           asm/dat_data_banim_p118.s \
                           asm/dat_data_banim_p200.s \
                           asm/dat_data_banim_p36.s \
                           asm/dat_const_data_chapter_maps_p7.s \
                           asm/dat_data_banim_p199.s \
                           asm/dat_data_opanim_gfx_p11.s \
                           asm/dat_data_banim_p108.s \
                           asm/dat_data_opanim_gfx_p1.s \
                           asm/dat_const_data_chapter_maps_p2.s \
                           asm/dat_ui_palettes.s \
                           asm/dat_data_banim_p95.s \
                           asm/dat_data_banim_p75.s \
                           asm/dat_const_data_chapter_maps_p6.s \
                           asm/dat_data_banim_p231.s \
                           asm/dat_data_banim_p102.s \
                           asm/dat_data_banim_p96.s \
                           asm/dat_data_banim_p87.s \
                           asm/dat_data_banim_p68.s \
                           asm/dat_data_opanim_gfx_p9.s \
                           asm/dat_data_opanim_gfx_p18.s \
                           asm/dat_data_banim_p35.s \
                           asm/dat_data_banim_p191.s \
                           asm/dat_data_banim_p69.s \
                           asm/dat_data_banim_p182.s \
                           asm/dat_data_banim_p201.s \
                           asm/dat_data_banim_p114.s \
                           asm/dat_data_banim_p230.s \
                           asm/dat_phase_change.s \
                           asm/dat_const_data_E162A_p2.s \
                           asm/dat_data_banim_p65.s \
                           asm/dat_data_opanim_gfx_p2.s \
                           asm/dat_data_banim_p239.s \
                           asm/dat_const_data_chapter_maps_p3.s \
                           asm/dat_data_banim_p86.s \
                           asm/dat_data_banim_p232.s \
                           asm/dat_data_banim_p79.s \
                           asm/dat_worldmap_gmapunit_p1519.s \
                           asm/dat_const_data_E162A_p1.s \
                           asm/dat_ending_staffreel_p0.s \
                           asm/dat_data_banim_p78.s \
                           asm/dat_ending_staffreel_p2.s \
                           asm/dat_const_data_chapter_maps_p8.s \
                           asm/dat_data_5AA96C_p2.s \
                           asm/dat_data_banim_p135.s \
                           asm/dat_data_banim_p238.s \
                           asm/dat_data_B12A60.s \
                           asm/dat_data_banim_p70.s \
                           asm/dat_data_banim_p106.s \
                           asm/dat_menu_save_main_bg_p0.s \
                           asm/dat_data_banim_p163.s \
                           asm/dat_data_banim_p228.s \
                           asm/dat_trap_gas.s \
                           asm/dat_data_opanim_gfx_p5.s \
                           asm/dat_data_opanim_gfx_p4.s \
                           asm/dat_data_banim_p42.s \
                           asm/dat_data_opanim_gfx_p3.s \
                           asm/dat_const_data_chapter_maps_p9.s \
                           asm/dat_const_data_chapter_maps_p1.s \
                           asm/dat_data_banim_p94.s \
                           asm/dat_data_opanim_gfx_p22.s \
                           asm/dat_worldmap_gmapunit_p1638.s \
                           asm/dat_data_banim_p115.s \
                           asm/dat_data_banim_p113.s \
                           asm/dat_data_banim_p85.s \
                           asm/dat_worldmap_gmap_p1.s \
                           asm/dat_data_banim_p97.s \
                           asm/dat_data_banim_p192.s \
                           asm/dat_worldmap_gmapunit_p1621.s \
                           asm/dat_data_opanim_gfx_p23.s \
                           asm/dat_data_banim_p208.s \
                           asm/dat_worldmap_gmapunit_p1579.s \
                           asm/dat_data_banim_p190.s \
                           asm/dat_data_banim_p41.s \
                           asm/dat_data_banim_p143.s \
                           asm/dat_const_data_chapter_maps_p4.s \
                           asm/dat_data_banim_p64.s \
                           asm/dat_data_opanim_gfx_p6.s \
                           asm/dat_ending_staffreel_p3.s \
                           asm/dat_ending_staffreel_p1.s \
                           asm/dat_data_banim_p229.s \
                           asm/dat_data_opanim_gfx_p27.s \
                           asm/dat_data_opanim_gfx_p26.s \
                           asm/dat_ending_staffreel_p4.s \
                           asm/dat_const_data_chapter_maps_p0.s \
                           asm/dat_const_data_unit_icon_move_p89.s \
                           asm/dat_const_data_unit_icon_move_p88.s \
                           asm/dat_const_data_unit_icon_move_p87.s \
                           asm/dat_worldmap_gmapunit_p1598.s \
                           asm/dat_const_data_unit_icon_move_p67.s \
                           asm/dat_const_data_unit_icon_move_p50.s \
                           asm/dat_const_data_unit_icon_move_p99.s \
                           asm/dat_const_data_unit_icon_move_p59.s \
                           asm/dat_const_data_unit_icon_move_p35.s \
                           asm/dat_const_data_unit_icon_move_p28.s \
                           asm/dat_trap_fire_pike_2.s \
                           asm/dat_const_data_unit_icon_move_p43.s \
                           asm/dat_const_data_unit_icon_move_p6.s \
                           asm/dat_const_data_unit_icon_move_p0.s \
                           asm/dat_const_data_unit_icon_move_p102.s \
                           asm/dat_const_data_unit_icon_move_p93.s \
                           asm/dat_const_data_unit_icon_move_p92.s \
                           asm/dat_const_data_unit_icon_move_p91.s \
                           asm/dat_const_data_unit_icon_move_p90.s \
                           asm/dat_const_data_unit_icon_move_p78.s \
                           asm/dat_const_data_unit_icon_move_p64.s \
                           asm/dat_const_data_unit_icon_move_p34.s \
                           asm/dat_const_data_unit_icon_move_p12.s \
                           asm/dat_const_data_unit_icon_move_p1.s \
                           asm/dat_trap_fire_pike.s \
                           asm/dat_ending_fin_p1.s \
                           asm/dat_const_data_unit_icon_move_p85.s \
                           asm/dat_const_data_unit_icon_move_p82.s \
                           asm/dat_const_data_unit_icon_move_p73.s \
                           asm/dat_const_data_unit_icon_move_p70.s \
                           asm/dat_const_data_unit_icon_move_p61.s \
                           asm/dat_const_data_unit_icon_move_p49.s \
                           asm/dat_const_data_unit_icon_move_p44.s \
                           asm/dat_const_data_unit_icon_move_p42.s \
                           asm/dat_const_data_unit_icon_move_p20.s \
                           asm/dat_const_data_unit_icon_move_p16.s \
                           asm/dat_ending_fin_p0.s \
                           asm/dat_const_data_unit_icon_move_p80.s \
                           asm/dat_const_data_unit_icon_move_p68.s \
                           asm/dat_const_data_unit_icon_move_p55.s \
                           asm/dat_const_data_unit_icon_move_p11.s \
                           asm/dat_Img_WmHightLightMap7_ref.s \
                           asm/dat_const_data_unit_icon_move_p101.s \
                           asm/dat_const_data_unit_icon_move_p81.s \
                           asm/dat_const_data_unit_icon_move_p76.s \
                           asm/dat_const_data_unit_icon_move_p62.s \
                           asm/dat_const_data_unit_icon_move_p48.s \
                           asm/dat_const_data_unit_icon_move_p40.s \
                           asm/dat_const_data_unit_icon_move_p22.s \
                           asm/dat_const_data_unit_icon_move_p19.s \
                           asm/dat_const_data_unit_icon_move_p15.s \
                           asm/dat_const_data_unit_icon_move_p10.s \
                           asm/dat_const_data_unit_icon_move_p4.s \
                           asm/dat_const_data_unit_icon_move_p97.s \
                           asm/dat_const_data_unit_icon_move_p74.s \
                           asm/dat_const_data_unit_icon_move_p66.s \
                           asm/dat_const_data_unit_icon_move_p53.s \
                           asm/dat_const_data_unit_icon_move_p52.s \
                           asm/dat_const_data_unit_icon_move_p51.s \
                           asm/dat_const_data_unit_icon_move_p5.s \
                           asm/dat_const_data_unit_icon_move_p96.s \
                           asm/dat_const_data_unit_icon_move_p79.s \
                           asm/dat_const_data_unit_icon_move_p77.s \
                           asm/dat_const_data_unit_icon_move_p75.s \
                           asm/dat_const_data_unit_icon_move_p60.s \
                           asm/dat_const_data_unit_icon_move_p57.s \
                           asm/dat_const_data_unit_icon_move_p54.s \
                           asm/dat_const_data_unit_icon_move_p38.s \
                           asm/dat_const_data_unit_icon_move_p33.s \
                           asm/dat_const_data_unit_icon_move_p31.s \
                           asm/dat_const_data_unit_icon_move_p23.s \
                           asm/dat_const_data_unit_icon_move_p21.s \
                           asm/dat_const_data_unit_icon_move_p98.s \
                           asm/dat_const_data_unit_icon_move_p95.s \
                           asm/dat_const_data_unit_icon_move_p65.s \
                           asm/dat_const_data_unit_icon_move_p41.s \
                           asm/dat_const_data_unit_icon_move_p39.s \
                           asm/dat_const_data_unit_icon_move_p9.s \
                           asm/dat_const_data_unit_icon_move_p100.s \
                           asm/dat_const_data_unit_icon_move_p94.s \
                           asm/dat_const_data_unit_icon_move_p69.s \
                           asm/dat_const_data_unit_icon_move_p56.s \
                           asm/dat_const_data_unit_icon_move_p32.s \
                           asm/dat_const_data_unit_icon_move_p30.s \
                           asm/dat_data_banim_p187.s \
                           asm/dat_worldmap_gmapunit_p757.s \
                           asm/dat_data_banim_p112.s \
                           asm/dat_anim_worldmap_highlight_p7.s \
                           asm/dat_anim_worldmap_highlight_p5.s \
                           asm/dat_data_banim_p240.s \
                           asm/dat_data_banim_p93.s \
                           asm/dat_worldmap_minimap_p2.s \
                           asm/dat_data_banim_p103.s \
                           asm/dat_data_banim_p76.s \
                           asm/dat_data_banim_p121.s \
                           asm/dat_const_data_E162A_p0.s \
                           asm/dat_data_banim_p222.s \
                           asm/dat_data_banim_p141.s \
                           asm/dat_data_banim_p223.s \
                           asm/dat_data_banim_p181.s \
                           asm/dat_data_banim_p152.s \
                           asm/dat_const_data_chapter_maps_p5.s \
                           asm/dat_worldmap_gmapunit_p938.s \
                           asm/dat_worldmap_gmapunit_p1605.s \
                           asm/dat_banim_ekrdragonfx_9.s \
                           asm/dat_data_banim_p243.s \
                           asm/dat_banim_ekrdragonfx_1.s \
                           asm/dat_data_banim_p153.s \
                           asm/dat_data_banim_p206.s \
                           asm/dat_data_banim_p40.s \
                           asm/dat_data_banim_p39.s \
                           asm/dat_data_banim_p38.s \
                           asm/dat_data_banim_p37.s \
                           asm/dat_data_banim_p123.s \
                           asm/dat_data_banim_p172.s \
                           asm/dat_data_banim_p174.s \
                           asm/dat_data_banim_p91.s \
                           asm/dat_data_banim_p125.s \
                           asm/dat_data_banim_p194.s \
                           asm/dat_data_banim_p89.s \
                           asm/dat_banim_ekrdragonfx_0.s \
                           asm/dat_data_banim_p171.s \
                           asm/dat_data_banim_p20.s \
                           asm/dat_data_banim_p92.s \
                           asm/dat_data_banim_p90.s \
                           asm/dat_worldmap_gmapunit_p761.s \
                           asm/dat_data_banim_p109.s \
                           asm/dat_data_banim_p77.s \
                           asm/dat_worldmap_gmapunit_p771.s \
                           asm/dat_data_banim_p116.s \
                           asm/dat_data_banim_p63.s \
                           asm/dat_banim_ekrskill_p0.s \
                           asm/dat_data_banim_p21.s \
                           asm/dat_anim_worldmap_sprite.s \
                           asm/dat_data_banim_p62.s \
                           asm/dat_data_banim_p29.s \
                           asm/dat_data_banim_p28.s \
                           asm/dat_data_banim_p130.s \
                           asm/dat_data_banim_p126.s \
                           asm/dat_data_banim_p30.s \
                           asm/dat_data_banim_p227.s \
                           asm/dat_data_banimmisc.s \
                           asm/dat_data_banim_p66.s \
                           asm/dat_data_banim_p1.s \
                           asm/dat_data_banim_p159.s \
                           asm/dat_data_banim_p80.s \
                           asm/dat_data_banim_p216.s \
                           asm/dat_data_banim_p132.s \
                           asm/dat_data_banim_p128.s \
                           asm/dat_data_banim_p107.s \
                           asm/dat_data_banim_p215.s \
                           asm/dat_data_banim_p71.s \
                           asm/dat_data_banim_p156.s \
                           asm/dat_data_banim_p155.s \
                           asm/dat_worldmap_gmapunit_p776.s \
                           asm/dat_data_banim_p158.s \
                           asm/dat_data_banim_p81.s \
                           asm/dat_worldmap_gmapunit_p1602.s \
                           asm/dat_data_banim_p144.s \
                           asm/dat_data_banim_p73.s \
                           asm/dat_banim_efxhitobj.s \
                           asm/dat_data_banim_p124.s \
                           asm/dat_data_banim_p43.s \
                           asm/dat_data_banim_p74.s \
                           asm/dat_data_banim_p72.s \
                           asm/dat_data_banim_p33.s \
                           asm/dat_banim_ekrdragonfx_4.s \
                           asm/dat_banim_ekrdragonfx_3.s \
                           asm/dat_worldmap_gmapunit_p767.s \
                           asm/dat_data_banim_p31.s \
                           asm/dat_const_data_1C0AFC.s \
                           asm/dat_worldmap_gmapunit_p777.s \
                           asm/dat_data_banim_p98.s \
                           asm/dat_data_banim_p67.s \
                           asm/dat_data_banim_p147.s \
                           asm/dat_data_banim_p160.s \
                           asm/dat_data_banim_p221.s \
                           asm/dat_worldmap_gmapunit_p768.s \
                           asm/dat_data_banim_p136.s \
                           asm/dat_data_banim_p131.s \
                           asm/dat_data_banim_p127.s \
                           asm/dat_data_banim_p13.s \
                           asm/dat_banim_ekrdragonfx_5.s \
                           asm/dat_worldmap_gmapunit_p1580.s \
                           asm/dat_data_banim_p100.s \
                           asm/dat_data_banim_p14.s \
                           asm/dat_data_banim_p193.s \
                           asm/dat_worldmap_gmapunit_p779.s \
                           asm/dat_data_banim_p101.s \
                           asm/dat_data_banim_p84.s \
                           asm/dat_data_banim_p12.s \
                           asm/dat_data_banim_p154.s \
                           asm/dat_worldmap_gmapunit_p1546.s \
                           asm/dat_data_banim_p24.s \
                           asm/dat_data_banim_p22.s \
                           asm/dat_worldmap_gmapunit_p772.s \
                           asm/dat_data_banim_p218.s \
                           asm/dat_data_banim_p170.s \
                           asm/dat_worldmap_gmapunit_p778.s \
                           asm/dat_worldmap_gmapunit_p1644.s \
                           asm/dat_data_banim_p25.s \
                           asm/dat_data_banim_p23.s \
                           asm/dat_worldmap_gmapunit_p1418.s \
                           asm/dat_data_banim_p27.s \
                           asm/dat_data_banim_p26.s \
                           asm/dat_data_titlescreen_p1.s \
                           asm/dat_data_banim_p225.s \
                           asm/dat_data_5AA96C_p3.s \
                           asm/dat_data_banim_p120.s \
                           asm/dat_worldmap_gmapunit_p774.s \
                           asm/dat_fontgrp_data.s \
                           asm/dat_data_banim_p119.s \
                           asm/dat_worldmap_gmapunit_p676.s \
                           asm/dat_banim_ekrdragonfx_2.s \
                           asm/dat_banim_ekrdragonfx_8.s \
                           asm/dat_banim_ekrdragonfx_7.s \
                           asm/dat_banim_ekrdragonfx_6.s \
                           asm/dat_data_A2EEF0_p0.s \
                           asm/dat_data_banim_p195.s \
                           asm/dat_banim_ekrtriangle_9.s \
                           asm/dat_data_titlescreen.s \
                           asm/dat_data_banim_p244.s \
                           asm/dat_worldmap_gmapunit_p1643.s \
                           asm/dat_banim_battleparse.s \
                           asm/dat_worldmap_gmapunit_p759.s \
                           asm/dat_data_banim_p226.s \
                           asm/dat_data_5AA96C.s \
                           asm/dat_data_titlescreen_p2.s \
                           asm/dat_data_banim_p58.s \
                           asm/dat_data_banim_p57.s \
                           asm/dat_worldmap_gmapunit_p1637.s \
                           asm/dat_data_banim_p245.s \
                           asm/dat_data_banim_p178.s \
                           asm/dat_battle_forecast.s \
                           asm/dat_worldmap_gmapunit_p756.s \
                           asm/dat_data_banim_p61.s \
                           asm/dat_data_banim_p157.s \
                           asm/dat_worldmap_gmapunit_p1542.s \
                           asm/dat_worldmap_gmapunit_p1412.s \
                           asm/dat_worldmap_gmapunit_p1002.s \
                           asm/dat_ending_details_p0.s \
                           asm/dat_mapanim_levelup.s \
                           asm/dat_worldmap_gmapunit_p792.s \
                           asm/dat_const_data_banimekrdk_p0.s \
                           asm/dat_worldmap_gmapunit_p850.s \
                           asm/dat_worldmap_gmapunit_p849.s \
                           asm/dat_data_banim_p234.s \
                           asm/dat_worldmap_gmapunit_p1628.s \
                           asm/dat_worldmap_gmapunit_p1624.s \
                           asm/dat_worldmap_gmapunit_p1599.s \
                           asm/dat_worldmap_gmapunit_p1471.s \
                           asm/dat_data_banim_p203.s \
                           asm/dat_data_banim_p122.s \
                           asm/dat_worldmap_gmapunit_p811.s \
                           asm/dat_data_banim_p205.s \
                           asm/dat_data_banim_p241.s \
                           asm/dat_data_banim_p148.s \
                           asm/dat_worldmap_minimap_p3.s \
                           asm/dat_worldmap_gmapunit_p1408.s \
                           asm/dat_data_AA6BFA.s \
                           asm/dat_worldmap_gmapunit_p812.s \
                           asm/dat_worldmap_gmapunit_p1333.s \
                           asm/dat_generic_icon.s \
                           asm/dat_data_banim_p137.s \
                           asm/dat_worldmap_gmapunit_p844.s \
                           asm/dat_worldmap_gmapunit_p843.s \
                           asm/dat_worldmap_gmapunit_p842.s \
                           asm/dat_worldmap_gmapunit_p841.s \
                           asm/dat_worldmap_gmapunit_p840.s \
                           asm/dat_worldmap_gmapunit_p1558.s \
                           asm/dat_worldmap_gmapunit_p852.s \
                           asm/dat_worldmap_gmapunit_p851.s \
                           asm/dat_banim_ekrtriangle_0.s \
                           asm/dat_data_banim_p52.s \
                           asm/dat_data_banim_p51.s \
                           asm/dat_data_banim_p50.s \
                           asm/dat_data_banim_p49.s \
                           asm/dat_worldmap_gmapunit_p1118.s \
                           asm/dat_data_banim_p111.s \
                           asm/dat_data_banim_p110.s \
                           asm/dat_worldmap_gmapunit_p895.s \
                           asm/dat_worldmap_gmapunit_p270.s \
                           asm/dat_worldmap_gmapunit_p1410.s \
                           asm/dat_worldmap_gmapunit_p1404.s \
                           asm/dat_data_banim_p133.s \
                           asm/dat_data_banim_p129.s \
                           asm/dat_worldmap_gmapunit_p1401.s \
                           asm/dat_worldmap_gmapunit_p781.s \
                           asm/dat_data_banim_p82.s \
                           asm/dat_worldmap_gmapunit_p375.s \
                           asm/dat_worldmap_gmapunit_p751.s \
                           asm/dat_worldmap_skirmish.s \
                           asm/dat_worldmap_gmapunit_p754.s \
                           asm/dat_data_banim_p166.s \
                           asm/dat_worldmap_gmapunit_p1032.s \
                           asm/dat_worldmap_gmapunit_p1030.s \
                           asm/dat_const_data_unit_icon_move_p58.s \
                           asm/dat_data_5B65C0_p0.s \
                           asm/dat_const_data_unit_icon_move_p63.s \
                           asm/dat_worldmap_gmapunit_p90.s \
                           asm/dat_worldmap_gmapunit_p1375.s \
                           asm/dat_worldmap_gmapunit_p334.s \
                           asm/dat_worldmap_gmapunit_p325.s \
                           asm/dat_worldmap_gmapunit_p1403.s \
                           asm/dat_worldmap_gmapunit_p1399.s \
                           asm/dat_data_5AA96C_p1.s \
                           asm/dat_worldmap_gmapunit_p386.s \
                           asm/dat_data_banim_p149.s \
                           asm/dat_worldmap_gmapunit_p1639.s \
                           asm/dat_worldmap_gmapunit_p785.s \
                           asm/dat_worldmap_gmapunit_p783.s \
                           asm/dat_worldmap_gmapunit_p775.s \
                           asm/dat_worldmap_gmapunit_p684.s \
                           asm/dat_worldmap_gmapunit_p638.s \
                           asm/dat_banim_ekrtriangle_1.s \
                           asm/dat_worldmap_gmapunit_p1351.s \
                           asm/dat_data_banim_p169.s \
                           asm/dat_data_banim_p168.s \
                           asm/dat_data_banim_p138.s \
                           asm/dat_worldmap_gmapunit_p959.s \
                           asm/dat_data_bg_p22.s \
                           asm/dat_banim_ekrtriangle_7.s \
                           asm/dat_worldmap_gmapunit_p1383.s \
                           asm/dat_worldmap_gmapunit_p1371.s \
                           asm/dat_worldmap_gmapunit_p228.s \
                           asm/dat_worldmap_gmapunit_p1365.s \
                           asm/dat_worldmap_gmapunit_p680.s \
                           asm/dat_worldmap_gmapunit_p264.s \
                           asm/dat_worldmap_gmapunit_p260.s \
                           asm/dat_sProcScr_DungeonRecord_UpdateNewRecordValues_ref.s \
                           asm/dat_worldmap_gmapunit_p7.s \
                           asm/dat_worldmap_gmapunit_p311.s \
                           asm/dat_worldmap_gmapunit_p210.s \
                           asm/dat_data_bg_p17.s \
                           asm/dat_worldmap_gmapunit_p423.s \
                           asm/dat_worldmap_gmapunit_p830.s \
                           asm/dat_worldmap_gmapunit_p96.s \
                           asm/dat_worldmap_gmapunit_p184.s \
                           asm/dat_worldmap_gmapunit_p173.s \
                           asm/dat_worldmap_gmapunit_p153.s \
                           asm/dat_worldmap_gmapunit_p134.s \
                           asm/dat_worldmap_gmapunit_p66.s \
                           asm/dat_worldmap_gmapunit_p29.s \
                           asm/dat_worldmap_gmapunit_p313.s \
                           asm/dat_worldmap_gmapunit_p828.s \
                           asm/dat_worldmap_gmapunit_p328.s \
                           asm/dat_banim_ekrdragonfx_10.s \
                           asm/dat_worldmap_node_data_gf.s \
                           asm/dat_worldmap_gmapunit_p1636.s \
                           asm/dat_EventScr_Ch1Tut_TradeSelectGalliamIdle2_ref.s \
                           asm/dat_EventScr_Ch1Tut_TradeSelectGalliamIdle1_ref.s \
                           asm/dat_worldmap_gmapunit_p1117.s \
                           asm/dat_worldmap_gmapunit_p1037.s \
                           asm/dat_worldmap_gmapunit_p702.s \
                           asm/dat_worldmap_gmapunit_p58.s \
                           asm/dat_EventScr_Prologue_RenaisThroneCutscene_ref.s \
                           asm/dat_worldmap_gmapunit_p946.s \
                           asm/dat_EventScr_Ch1_Turn_AllyReinforceArrive_ref.s \
                           asm/dat_EventScr_Ch1Tut_EirikaVisitHouseIdle2_ref.s \
                           asm/dat_EventScr_Ch1Tut_EirikaVisitHouseIdle1_ref.s \
                           asm/dat_worldmap_gmapunit_p431.s \
                           asm/dat_data_banim_p150.s \
                           asm/dat_anim_trap_gas.s \
                           asm/dat_worldmap_gmapunit_p758.s \
                           asm/dat_ProcScr_LASurrender_HandleUnitDeaths_ref.s \
                           asm/dat_EventScr_Ch1Tut_EirikaVisitHouseInit_ref.s \
                           asm/dat_worldmap_gmapunit_p661.s \
                           asm/dat_worldmap_gmapunit_p648.s \
                           asm/dat_worldmap_gmapunit_p647.s \
                           asm/dat_worldmap_gmapunit_p436.s \
                           asm/dat_data_bg_p10.s \
                           asm/dat_worldmap_gmapunit_p419.s \
                           asm/dat_worldmap_gmapunit_p1655.s \
                           asm/dat_worldmap_gmapunit_p1549.s \
                           asm/dat_worldmap_gmapunit_p655.s \
                           asm/dat_worldmap_gmapunit_p633.s \
                           asm/dat_worldmap_gmapunit_p629.s \
                           asm/dat_worldmap_gmapunit_p1058.s \
                           asm/dat_data_bg_p5.s \
                           asm/dat_worldmap_gmapunit_p936.s \
                           asm/dat_worldmap_gmapunit_p753.s \
                           asm/dat_worldmap_gmapunit_p664.s \
                           asm/dat_worldmap_gmapunit_p559.s \
                           asm/dat_data_banim_p167.s \
                           asm/dat_data_banim_p139.s \
                           asm/dat_ProcScr_MapAnimDefaultItemEffect_ref.s \
                           asm/dat_EventScr_Ch1Tut_GuideTerrainHeal_ref.s \
                           asm/dat_worldmap_gmapunit_p960.s \
                           asm/dat_data_bg_p11.s \
                           asm/dat_UnitDef_Event_Ch1EnemyReinforce_ref.s \
                           asm/dat_EventScr_MapSupportConversation_ref.s \
                           asm/dat_EventScr_Ch1Tut_SethMoveToEnemy_ref.s \
                           asm/dat_data_bg_p34.s \
                           asm/dat_gProcScr_GorgonEggHatchDisplay_ref.s \
                           asm/dat_gProcScr_ChapterIntroTitleOnly_ref.s \
                           asm/dat_ProcScr_SpellAssocMonsterStone_ref.s \
                           asm/dat_EventScr_Prologue_OneEnemyLeft_ref.s \
                           asm/dat_data_bg_p9.s \
                           asm/dat_worldmap_gmapunit_p1417.s \
                           asm/dat_EventScr_Prologue_EndingScene_ref.s \
                           asm/dat_EventScr_Ch14b_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch10a_BeginningScene_ref.s \
                           asm/dat_data_bg_p15.s \
                           asm/dat_worldmap_gmapunit_p1582.s \
                           asm/dat_worldmap_gmapunit_p1601.s \
                           asm/dat_data_bg_p19.s \
                           asm/dat_data_bg_p12.s \
                           asm/dat_EventScr_Ch1Tut_BeforeSethMoveToEnemy_ref.s \
                           asm/dat_worldmap_gmapunit_p1413.s \
                           asm/dat_gProcScr_PoisonDamageDisplay_ref.s \
                           asm/dat_data_bg_p2.s \
                           asm/dat_EventScr_Prologue_GiveRapier_ref.s \
                           asm/dat_EventScr_Ch9a_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch5x_BeginningScene_ref.s \
                           asm/dat_worldmap_gmapunit_p1634.s \
                           asm/dat_worldmap_minimap_p0.s \
                           asm/dat_worldmap_gmapunit_p1370.s \
                           asm/dat_gProcScr_TerrainHealDisplay_ref.s \
                           asm/dat_gProcScr_StatusDecayDisplay_ref.s \
                           asm/dat_data_bg_p14.s \
                           asm/dat_UnitDef_Event_PrologueEnemy_ref.s \
                           asm/dat_ProcScr_SpellAssocVulenrary_ref.s \
                           asm/dat_ProcScr_SpellAssocPureWater_ref.s \
                           asm/dat_ProcScr_SpellAssocNightMare_ref.s \
                           asm/dat_ProcScr_SpellAssocAntitoxin_ref.s \
                           asm/dat_ProcScr_LinkArenaPhaseIntro_ref.s \
                           asm/dat_EventScr_Prologue_TutorialA_ref.s \
                           asm/dat_EventScr_Prologue_Tutorial4_ref.s \
                           asm/dat_EventScr_Prologue_Tutorial0_ref.s \
                           asm/dat_EventScr_Ch8_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch7_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch6_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch5_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch4_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch3_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch2_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch1_BeginningScene_ref.s \
                           asm/dat_worldmap_gmapunit_p1411.s \
                           asm/dat_worldmap_gmapunit_p1395.s \
                           asm/dat_worldmap_gmapunit_p1390.s \
                           asm/dat_worldmap_gmapunit_p1409.s \
                           asm/dat_worldmap_gmapunit_p1402.s \
                           asm/dat_worldmap_gmapunit_p1379.s \
                           asm/dat_worldmap_gmapunit_p1326.s \
                           asm/dat_worldmap_gmapunit_p1323.s \
                           asm/dat_gProcScr_TrapDamageDisplay_ref.s \
                           asm/dat_EventScr_FloorClearInTower_ref.s \
                           asm/dat_EventScr_Ch21b_EndingScene_ref.s \
                           asm/dat_EventScr_Ch13b_EndingScene_ref.s \
                           asm/dat_EventScr_Ch13a_EndingScene_ref.s \
                           asm/dat_EventScr_Ch11a_EndingScene_ref.s \
                           asm/dat_EventScr_Ch10a_EndingScene_ref.s \
                           asm/dat_data_bg_p20.s \
                           asm/dat_worldmap_gmapunit_p1398.s \
                           asm/dat_worldmap_gmapunit_p1337.s \
                           asm/dat_data_banim_p162.s \
                           asm/dat_UnitDef_Event_PrologueGradoShamans_ref.s \
                           asm/dat_UnitDef_Event_PrologueGradoCavalry_ref.s \
                           asm/dat_ProcScr_SpellAssocSilence_ref.s \
                           asm/dat_ProcScr_SpellAssocRestore_ref.s \
                           asm/dat_ProcScr_SpellAssocRecover_ref.s \
                           asm/dat_ProcScr_SpellAssocBerserk_ref.s \
                           asm/dat_ProcScr_SpellAssocBarrier_ref.s \
                           asm/dat_MenuItemDef_WMGeneralMenu_ref.s \
                           asm/dat_EventScr_Ch9a_EndingScene_ref.s \
                           asm/dat_EventScr_Ch5x_EndingScene_ref.s \
                           asm/dat_data_bg_p30.s \
                           asm/dat_const_data_unit_icon_move_p2.s \
                           asm/dat_worldmap_gmapunit_p1056.s \
                           asm/dat_UnitDef_Event_PrologueValterGroup_ref.s \
                           asm/dat_EventScr_Prologue_TutMessageTurn2_ref.s \
                           asm/dat_EventScr_Prologue_TutEirikaAttack_ref.s \
                           asm/dat_gYesNoSelectionMenuItems_ref.s \
                           asm/dat_gCharacterEndingTitleLut_ref.s \
                           asm/dat_const_data_unit_icon_move_p3.s \
                           asm/dat_ProcScr_SpellAssocUnlock_ref.s \
                           asm/dat_ProcScr_SpellAssocRepair_ref.s \
                           asm/dat_ProcScr_SpellAssocPhysic_ref.s \
                           asm/dat_ProcScr_SpellAssocLatona_ref.s \
                           asm/dat_ProcScr_SpellAssocElixir_ref.s \
                           asm/dat_ProcScr_EggDmgMapEffect1_ref.s \
                           asm/dat_PopupScr_ItemWasPilfered_ref.s \
                           asm/dat_EventScr_SkirmishRetreat_ref.s \
                           asm/dat_EventScr_Ch7_EndingScene_ref.s \
                           asm/dat_EventScr_Ch6_EndingScene_ref.s \
                           asm/dat_EventScr_Ch3_EndingScene_ref.s \
                           asm/dat_EventScr_Ch2_EndingScene_ref.s \
                           asm/dat_worldmap_gmapunit_p1606.s \
                           asm/dat_worldmap_gmapunit_p1560.s \
                           asm/dat_EventScr_Prologue_BeginningScene_ref.s \
                           asm/dat_gProcScr_SSPageNameCtrl_ref.s \
                           asm/dat_gProcScr_PhaseIntroText_ref.s \
                           asm/dat_gProcScr_ArenaUiResults_ref.s \
                           asm/dat_gEfxSelfThunderBGFrames_ref.s \
                           asm/dat_gDebugContinueMenuItems_ref.s \
                           asm/dat_ProcScr_SpellAssocTorch_ref.s \
                           asm/dat_ProcScr_SpellAssocSleep_ref.s \
                           asm/dat_FinalChapterMap2Changes_ref.s \
                           asm/dat_EventScr_Tutorial_Exec1_ref.s \
                           asm/dat_gMPlayJumpTableTemplate_ref.s \
                           asm/dat_const_data_unit_icon_move_p29.s \
                           asm/dat_EventScr_GiveTreasureToLuckyDog_ref.s \
                           asm/dat_EventScr_Ch1Tut_ChooseSethTurn1_ref.s \
                           asm/dat_gProcScr_SSPageNumCtrl_ref.s \
                           asm/dat_gEventListCmdInfoTable_ref.s \
                           asm/dat_gDebugChuudanMenuItems_ref.s \
                           asm/dat_ProcScr_SpellAssocWarp_ref.s \
                           asm/dat_ProcScr_SpellAssocMend_ref.s \
                           asm/dat_ProcScr_SpellAssocHeal_ref.s \
                           asm/dat_MenuItems_SioMenudef_1_ref.s \
                           asm/dat_MenuItems_SioMenudef_0_ref.s \
                           asm/dat_MenuItemDef_WMNodeMenu_ref.s \
                           asm/dat_MenuItemDef_RouteSplit_ref.s \
                           asm/dat_MelkaenCoastMapChanges_ref.s \
                           asm/dat_LagdouRuins7MapChanges_ref.s \
                           asm/dat_LagdouRuins6MapChanges_ref.s \
                           asm/dat_LagdouRuins2MapChanges_ref.s \
                           asm/dat_EventScr_SuspendPrompt_ref.s \
                           asm/dat_EventScr_Ch2Tutorial28_ref.s \
                           asm/dat_EventScr_Ch2Tutorial27_ref.s \
                           asm/dat_EventScr_Ch2Tutorial24_ref.s \
                           asm/dat_EventScr_Ch2Tutorial23_ref.s \
                           asm/dat_EventScr_Ch2Tutorial18_ref.s \
                           asm/dat_EventScr_Ch2Tutorial15_ref.s \
                           asm/dat_EventScr_Ch2Tutorial14_ref.s \
                           asm/dat_EventScr_Ch2Tutorial12_ref.s \
                           asm/dat_const_data_unit_icon_move_p45.s \
                           asm/dat_const_data_unit_icon_move_p26.s \
                           asm/dat_const_data_unit_icon_move_p18.s \
                           asm/dat_UnitDef_Event_PrologueEscapees_ref.s \
                           asm/dat_EventListScr_Prologue_Tutorial_ref.s \
                           asm/dat_worldmap_gmapunit_p1600.s \
                           asm/dat_ProcScr_SioPostBattle_ref.s \
                           asm/dat_ProcScr_MapAnimBattle_ref.s \
                           asm/dat_EventScr_Ch3_Turn1Npc_ref.s \
                           asm/dat_EventScr_Ch2_Village1_ref.s \
                           asm/dat_EventScr_Ch2Tutorial9_ref.s \
                           asm/dat_EventScr_Ch2Tutorial5_ref.s \
                           asm/dat_EventScr_Ch2Tutorial4_ref.s \
                           asm/dat_EventScr_Ch2Tutorial2_ref.s \
                           asm/dat_Ch13EphraimMapChanges_ref.s \
                           asm/dat_Ch12EphraimMapChanges_ref.s \
                           asm/dat_Ch11EphraimMapChanges_ref.s \
                           asm/dat_Ch10EphraimMapChanges_ref.s \
                           asm/dat_const_data_unit_icon_move_p83.s \
                           asm/dat_sMusicProc4Script_ref.s \
                           asm/dat_EventScr_Ch21b_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch20b_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch18b_BeginningScene_ref.s \
                           asm/dat_EventScr_Ch16b_BeginningScene_ref.s \
                           asm/dat_unit_icon_move_table_ref.s \
                           asm/dat_gUnitActionMenuItems_ref.s \
                           asm/dat_gDebugClearMenuItems_ref.s \
                           asm/dat_gClassReelOrderedLut_ref.s \
                           asm/dat_const_data_unit_icon_move_p17.s \
                           asm/dat_UnitDef_TowerEnemy_8_ref.s \
                           asm/dat_UnitDef_RuinEnemy_31_ref.s \
                           asm/dat_UnitDef_RuinEnemy_22_ref.s \
                           asm/dat_UnitDef_Ch21BEnemy_0_ref.s \
                           asm/dat_UnitDef_Ch19BEnemy_0_ref.s \
                           asm/dat_UnitDef_Ch18BEnemy_0_ref.s \
                           asm/dat_UnitDef_Ch18AEnemy_0_ref.s \
                           asm/dat_UnitDef_Ch17BEnemy_8_ref.s \
                           asm/dat_UnitDef_Ch17BEnemy_7_ref.s \
                           asm/dat_UnitDef_Ch17BEnemy_6_ref.s \
                           asm/dat_UnitDef_Ch16BEnemy_4_ref.s \
                           asm/dat_UnitDef_Ch16BEnemy_2_ref.s \
                           asm/dat_UnitDef_Ch16BEnemy_0_ref.s \
                           asm/dat_UnitDef_Ch16AEnemy_4_ref.s \
                           asm/dat_UnitDef_Ch16AEnemy_3_ref.s \
                           asm/dat_UnitDef_Ch16AEnemy_2_ref.s \
                           asm/dat_UnitDef_Ch16AEnemy_0_ref.s \
                           asm/dat_UnitDef_Ch14BEnemy_9_ref.s \
                           asm/dat_UnitDef_Ch14BEnemy_8_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_9_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_8_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_7_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_5_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_4_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_3_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_0_ref.s \
                           asm/dat_ProcScr_WorldMapMain_ref.s \
                           asm/dat_Ch14EirikaMapChanges_ref.s \
                           asm/dat_Ch13EirikaMapChanges_ref.s \
                           asm/dat_Ch12EirikaMapChanges_ref.s \
                           asm/dat_particles_fx_p0.s \
                           asm/dat_data_bg_p21.s \
                           asm/dat_EventListScr_Ch10a_Character_ref.s \
                           asm/dat_gStealItemMenuItems_ref.s \
                           asm/dat_UnitDef_Ch9BEnemy_3_ref.s \
                           asm/dat_UnitDef_Ch9AEnemy_0_ref.s \
                           asm/dat_PopupScr_ItemStolen_ref.s \
                           asm/dat_Ap_WmHightLightMap6_ref.s \
                           asm/dat_Ap_WmHightLightMap3_ref.s \
                           asm/dat_data_bg_p23.s \
                           asm/dat_const_data_unit_icon_move_p37.s \
                           asm/dat_EventScr_Prologue_TutorialB_ref.s \
                           asm/dat_EventScr_Prologue_Tutorial1_ref.s \
                           asm/dat_EventScr_Ch1Tut_OnBeginning_ref.s \
                           asm/dat_EventListScr_Ch16b_Location_ref.s \
                           asm/dat_EventListScr_Ch15b_Location_ref.s \
                           asm/dat_EventListScr_Ch14b_Location_ref.s \
                           asm/dat_EventListScr_Ch10a_Location_ref.s \
                           asm/dat_gTacticianTextConf_ref.s \
                           asm/dat_UnitDef_Ch8Enemy_8_ref.s \
                           asm/dat_UnitDef_Ch8Enemy_0_ref.s \
                           asm/dat_UnitDef_Ch6Enemy_3_ref.s \
                           asm/dat_UnitDef_Ch6Enemy_2_ref.s \
                           asm/dat_UnitDef_Ch6Enemy_1_ref.s \
                           asm/dat_UnitDef_Ch4Enemy_5_ref.s \
                           asm/dat_UnitDef_Ch4Enemy_4_ref.s \
                           asm/dat_UnitDef_Ch4Enemy_3_ref.s \
                           asm/dat_ProcScr_PhaseIntro_ref.s \
                           asm/dat_ProcScr_MapAnimEnd_ref.s \
                           asm/dat_PopupScr_WpnBroken_ref.s \
                           asm/dat_PopupScr_StoleItem_ref.s \
                           asm/dat_worldmap_gmapunit_p1311.s \
                           asm/dat_const_data_unit_icon_move_p71.s \
                           asm/dat_const_data_unit_icon_move_p7.s \
                           asm/dat_EventScr_Ch14b_EndingScene_ref.s \
                           asm/dat_EventListScr_Ch9a_Location_ref.s \
                           asm/dat_EventListScr_Ch8_Character_ref.s \
                           asm/dat_EventListScr_Ch1_Character_ref.s \
                           asm/dat_gItemUseMenuItems_ref.s \
                           asm/dat_const_data_unit_icon_move_p36.s \
                           asm/dat_const_data_unit_icon_move_p14.s \
                           asm/dat_EventScr_Ch19A_11_ref.s \
                           asm/dat_EventScr_Ch18A_11_ref.s \
                           asm/dat_EventScr_Ch16A_12_ref.s \
                           asm/dat_EventScr_Ch16A_11_ref.s \
                           asm/dat_EventScr_Ch15B_22_ref.s \
                           asm/dat_EventScr_Ch15B_21_ref.s \
                           asm/dat_EventScr_Ch15B_20_ref.s \
                           asm/dat_EventScr_Ch15B_19_ref.s \
                           asm/dat_EventScr_Ch15B_18_ref.s \
                           asm/dat_EventScr_Ch15B_17_ref.s \
                           asm/dat_EventScr_Ch15B_16_ref.s \
                           asm/dat_EventScr_Ch15B_15_ref.s \
                           asm/dat_EventScr_Ch15B_14_ref.s \
                           asm/dat_EventScr_Ch15A_26_ref.s \
                           asm/dat_EventScr_Ch15A_25_ref.s \
                           asm/dat_EventScr_Ch15A_24_ref.s \
                           asm/dat_EventScr_Ch15A_23_ref.s \
                           asm/dat_EventScr_Ch15A_22_ref.s \
                           asm/dat_EventScr_Ch15A_21_ref.s \
                           asm/dat_EventScr_Ch15A_20_ref.s \
                           asm/dat_EventScr_Ch15A_19_ref.s \
                           asm/dat_EventScr_Ch15A_18_ref.s \
                           asm/dat_EventScr_Ch15A_17_ref.s \
                           asm/dat_EventScr_Ch14B_12_ref.s \
                           asm/dat_EventScr_Ch10A_13_ref.s \
                           asm/dat_titlescreen.s \
                           asm/dat_data_bg_p16.s \
                           asm/dat_EventListScr_Ch5_Location_ref.s \
                           asm/dat_EventListScr_Ch2_Tutorial_ref.s \
                           asm/dat_EventListScr_Ch2_Location_ref.s \
                           asm/dat_gSupportTalkList_ref.s \
                           asm/dat_data_bg_p6.s \
                           asm/dat_UnitDef_Ch4NPC_0_ref.s \
                           asm/dat_PopupScr_GotItem_ref.s \
                           asm/dat_EventScr_Ruin_76_ref.s \
                           asm/dat_EventScr_Ruin_74_ref.s \
                           asm/dat_EventScr_Ruin_72_ref.s \
                           asm/dat_EventScr_Ruin_70_ref.s \
                           asm/dat_EventScr_Ruin_68_ref.s \
                           asm/dat_EventScr_Ruin_66_ref.s \
                           asm/dat_EventScr_Ruin_64_ref.s \
                           asm/dat_EventScr_Ruin_62_ref.s \
                           asm/dat_EventScr_Ruin_60_ref.s \
                           asm/dat_EventScr_Ruin_58_ref.s \
                           asm/dat_EventScr_Ruin_56_ref.s \
                           asm/dat_EventScr_Ruin_54_ref.s \
                           asm/dat_EventScr_Ch21A_8_ref.s \
                           asm/dat_EventScr_Ch21A_0_ref.s \
                           asm/dat_EventScr_Ch16B_5_ref.s \
                           asm/dat_EventScr_Ch16B_3_ref.s \
                           asm/dat_EventScr_Ch16A_9_ref.s \
                           asm/dat_EventScr_Ch15A_0_ref.s \
                           asm/dat_EventScr_Ch14B_2_ref.s \
                           asm/dat_EventScr_Ch14A_8_ref.s \
                           asm/dat_EventScr_Ch14A_1_ref.s \
                           asm/dat_EventScr_Ch14A_0_ref.s \
                           asm/dat_EventScr_Ch13B_1_ref.s \
                           asm/dat_EventScr_Ch13B_0_ref.s \
                           asm/dat_EventScr_Ch13A_4_ref.s \
                           asm/dat_EventScr_Ch13A_3_ref.s \
                           asm/dat_EventScr_Ch12B_1_ref.s \
                           asm/dat_EventScr_Ch12A_5_ref.s \
                           asm/dat_EventScr_Ch12A_0_ref.s \
                           asm/dat_EventScr_Ch11B_6_ref.s \
                           asm/dat_EventScr_Ch11B_2_ref.s \
                           asm/dat_EventScr_Ch11B_1_ref.s \
                           asm/dat_EventScr_Ch11B_0_ref.s \
                           asm/dat_EventScr_Ch10B_2_ref.s \
                           asm/dat_EventScr_Ch10B_1_ref.s \
                           asm/dat_EventScr_Ch10B_0_ref.s \
                           asm/dat_EventScr_Ch10A_8_ref.s \
                           asm/dat_EventScr_Ch10A_0_ref.s \
                           asm/dat_Ch9EphMapChanges_ref.s \
                           asm/dat_worldmap_gmapunit_p369.s \
                           asm/dat_worldmap_gmapunit_p368.s \
                           asm/dat_const_data_unit_icon_move_p13.s \
                           asm/dat_worldmap_gmapunit_p517.s \
                           asm/dat_EventScr_Ch5_EndingScene_ref.s \
                           asm/dat_EventScr_Ch1_EndingScene_ref.s \
                           asm/dat_TileAnimations3_ref.s \
                           asm/dat_TileAnimations2_ref.s \
                           asm/dat_EventScr_Ch9B_9_ref.s \
                           asm/dat_EventScr_Ch9A_2_ref.s \
                           asm/dat_EventScr_Ch8_11_ref.s \
                           asm/dat_EventScr_Ch8_10_ref.s \
                           asm/dat_EventScr_Ch5_10_ref.s \
                           asm/dat_EventScr_Ch2_10_ref.s \
                           asm/dat_EventScr_9EEA58_ref.s \
                           asm/dat_anim_mapanim_statgain.s \
                           asm/dat_gSoundRoomTable_ref.s \
                           asm/dat_TowerOfValni7MapChanges_ref.s \
                           asm/dat_TowerOfValni6MapChanges_ref.s \
                           asm/dat_EventListScr_Ch20b_Turn_ref.s \
                           asm/dat_EventListScr_Ch19b_Turn_ref.s \
                           asm/dat_EventListScr_Ch18b_Turn_ref.s \
                           asm/dat_EventListScr_Ch18b_Misc_ref.s \
                           asm/dat_EventListScr_Ch17b_Turn_ref.s \
                           asm/dat_EventListScr_Ch15b_Misc_ref.s \
                           asm/dat_worldmap_gmapunit_p305.s \
                           asm/dat_worldmap_gmapunit_p197.s \
                           asm/dat_gProcScr_BKSEL_ref.s \
                           asm/dat_gClassReelData_ref.s \
                           asm/dat_anim_mapanim_torch.s \
                           asm/dat_EventScr_Ch8_0_ref.s \
                           asm/dat_EventScr_Ch6_1_ref.s \
                           asm/dat_EventScr_Ch6_0_ref.s \
                           asm/dat_EventScr_Ch5_5_ref.s \
                           asm/dat_EventScr_Ch5_0_ref.s \
                           asm/dat_EventScr_Ch4_2_ref.s \
                           asm/dat_EventScr_Ch4_1_ref.s \
                           asm/dat_EventScr_Ch4_0_ref.s \
                           asm/dat_Ch20MapChanges_ref.s \
                           asm/dat_Ch19MapChanges_ref.s \
                           asm/dat_Ch18MapChanges_ref.s \
                           asm/dat_Ch16MapChanges_ref.s \
                           asm/dat_Ch15MapChanges_ref.s \
                           asm/dat_worldmap_gmapunit_p92.s \
                           asm/dat_worldmap_gmapunit_p151.s \
                           asm/dat_worldmap_gmapunit_p118.s \
                           asm/dat_worldmap_gmapunit_p114.s \
                           asm/dat_worldmap_gmapunit_p111.s \
                           asm/dat_worldmap_gmapunit_p81.s \
                           asm/dat_worldmap_gmapunit_p24.s \
                           asm/dat_anim_player_rank_fog.s \
                           asm/dat_UnitDef_Event_Ch5xAlly_ref.s \
                           asm/dat_UnitDef_Event_Ch1Enemy_ref.s \
                           asm/dat_LagdouRuins8MapChanges_ref.s \
                           asm/dat_LagdouRuins5MapChanges_ref.s \
                           asm/dat_LagdouRuins3MapChanges_ref.s \
                           asm/dat_EventScr_Ch2Tutorial22_ref.s \
                           asm/dat_EventScr_Ch2Tutorial21_ref.s \
                           asm/dat_EventScr_Ch2Tutorial11_ref.s \
                           asm/dat_EventListScr_Ch9a_Turn_ref.s \
                           asm/dat_sProc_BMVSync_ref.s \
                           asm/dat_ProcScr_Popup_ref.s \
                           asm/dat_worldmap_gmapunit_p251.s \
                           asm/dat_worldmap_gmapunit_p230.s \
                           asm/dat_worldmap_gmapunit_p1652.s \
                           asm/dat_voicegroup092_ref.s \
                           asm/dat_voicegroup085_ref.s \
                           asm/dat_voicegroup084_ref.s \
                           asm/dat_voicegroup083_ref.s \
                           asm/dat_voicegroup082_ref.s \
                           asm/dat_voicegroup081_ref.s \
                           asm/dat_voicegroup080_ref.s \
                           asm/dat_voicegroup079_ref.s \
                           asm/dat_voicegroup075_ref.s \
                           asm/dat_voicegroup074_ref.s \
                           asm/dat_voicegroup070_ref.s \
                           asm/dat_voicegroup069_ref.s \
                           asm/dat_voicegroup068_ref.s \
                           asm/dat_voicegroup065_ref.s \
                           asm/dat_voicegroup064_ref.s \
                           asm/dat_voicegroup062_ref.s \
                           asm/dat_voicegroup059_ref.s \
                           asm/dat_voicegroup057_ref.s \
                           asm/dat_voicegroup056_ref.s \
                           asm/dat_voicegroup049_ref.s \
                           asm/dat_voicegroup047_ref.s \
                           asm/dat_voicegroup046_ref.s \
                           asm/dat_voicegroup038_ref.s \
                           asm/dat_voicegroup035_ref.s \
                           asm/dat_voicegroup034_ref.s \
                           asm/dat_voicegroup033_ref.s \
                           asm/dat_voicegroup032_ref.s \
                           asm/dat_voicegroup031_ref.s \
                           asm/dat_voicegroup019_ref.s \
                           asm/dat_voicegroup018_ref.s \
                           asm/dat_worldmap_gmapunit_p763.s \
                           asm/dat_worldmap_gmapunit_p762.s \
                           asm/dat_worldmap_gmapunit_p460.s \
                           asm/dat_worldmap_gmapunit_p422.s \
                           asm/dat_UnitDef_Event_Ch8Ally_ref.s \
                           asm/dat_UnitDef_Event_Ch7Ally_ref.s \
                           asm/dat_UnitDef_Event_Ch5Ally_ref.s \
                           asm/dat_UnitDef_Event_Ch3Ally_ref.s \
                           asm/dat_UnitDef_Event_Ch2Ally_ref.s \
                           asm/dat_EventScr_Ch2Tutorial8_ref.s \
                           asm/dat_Ch14EphraimMapChanges_ref.s \
                           asm/dat_gGameOptions_ref.s \
                           asm/dat___malloc_av__ref.s \
                           asm/dat_worldmap_gmapunit_p1007.s \
                           asm/dat_worldmap_gmapunit_p1006.s \
                           asm/dat_worldmap_gmapunit_p1005.s \
                           asm/dat_worldmap_gmapunit_p784.s \
                           asm/dat_worldmap_gmapunit_p780.s \
                           asm/dat_worldmap_gmapunit_p486.s \
                           asm/dat_worldmap_gmapunit_p60.s \
                           asm/dat_UnitDef_Ch21BEnemy_1_ref.s \
                           asm/dat_UnitDef_Ch19BEnemy_8_ref.s \
                           asm/dat_UnitDef_Ch16AMixed_1_ref.s \
                           asm/dat_UnitDef_Ch16AAlly_15_ref.s \
                           asm/dat_UnitDef_Ch16AAlly_13_ref.s \
                           asm/dat_UnitDef_Ch15BEnemy_5_ref.s \
                           asm/dat_UnitDef_Ch15BEnemy_4_ref.s \
                           asm/dat_UnitDef_Ch15AEnemy_6_ref.s \
                           asm/dat_UnitDef_Ch14AEnemy_6_ref.s \
                           asm/dat_UnitDef_Ch14AEnemy_4_ref.s \
                           asm/dat_UnitDef_Ch14AEnemy_2_ref.s \
                           asm/dat_UnitDef_Ch13AEnemy_9_ref.s \
                           asm/dat_UnitDef_Ch13AEnemy_3_ref.s \
                           asm/dat_UnitDef_Ch12BEnemy_4_ref.s \
                           asm/dat_UnitDef_Ch12BEnemy_2_ref.s \
                           asm/dat_UnitDef_Ch12BEnemy_1_ref.s \
                           asm/dat_UnitDef_Ch12AEnemy_5_ref.s \
                           asm/dat_UnitDef_Ch12AEnemy_3_ref.s \
                           asm/dat_UnitDef_Ch12AEnemy_2_ref.s \
                           asm/dat_UnitDef_Ch11BEnemy_4_ref.s \
                           asm/dat_UnitDef_Ch11AEnemy_5_ref.s \
                           asm/dat_UnitDef_Ch11AEnemy_4_ref.s \
                           asm/dat_UnitDef_Ch11AEnemy_3_ref.s \
                           asm/dat_UnitDef_Ch11AEnemy_2_ref.s \
                           asm/dat_UnitDef_Ch10BMixed_0_ref.s \
                           asm/dat_UnitDef_Ch10BEnemy_7_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_6_ref.s \
                           asm/dat_UnitDef_Ch10AEnemy_1_ref.s \
                           asm/dat_Ch20EphraimEventData_ref.s \
                           asm/dat_Ch19EphraimEventData_ref.s \
                           asm/dat_Ch16EphraimEventData_ref.s \
                           asm/dat_Ch11EirikaMapChanges_ref.s \
                           asm/dat_worldmap_gmapunit_p513.s \
                           asm/dat_worldmap_gmapunit_p488.s \
                           asm/dat_worldmap_gmapunit_p478.s \
                           asm/dat_worldmap_gmapunit_p418.s \
                           asm/dat_impure_data_ref.s \
                           asm/dat_gWMPathData_ref.s \
                           asm/dat_ObjectType9_ref.s \
                           asm/dat_data_bg_p40.s \
                           asm/dat_worldmap_gmapunit_p791.s \
                           asm/dat_gMPlayTable_ref.s \
                           asm/dat_data_bg_p41.s \
                           asm/dat_UnitDef_Ch9AMixed_1_ref.s \
                           asm/dat_UnitDef_Ch9AMixed_0_ref.s \
                           asm/dat_UnitDef_Ch9AEnemy_8_ref.s \
                           asm/dat_UnitDef_Ch9AEnemy_1_ref.s \
                           asm/dat_UnitDef_Ch5xEnemy_3_ref.s \
                           asm/dat_UnitDef_Ch21AAlly_1_ref.s \
                           asm/dat_UnitDef_Ch19AAlly_5_ref.s \
                           asm/dat_UnitDef_Ch18BAlly_2_ref.s \
                           asm/dat_UnitDef_Ch17BAlly_3_ref.s \
                           asm/dat_UnitDef_Ch17BAlly_2_ref.s \
                           asm/dat_UnitDef_Ch17BAlly_1_ref.s \
                           asm/dat_UnitDef_Ch17AAlly_2_ref.s \
                           asm/dat_UnitDef_Ch16AAlly_8_ref.s \
                           asm/dat_UnitDef_Ch16AAlly_5_ref.s \
                           asm/dat_UnitDef_Ch16AAlly_4_ref.s \
                           asm/dat_UnitDef_Ch16AAlly_3_ref.s \
                           asm/dat_UnitDef_Ch16AAlly_1_ref.s \
                           asm/dat_UnitDef_Ch16AAlly_0_ref.s \
                           asm/dat_UnitDef_Ch15BAlly_0_ref.s \
                           asm/dat_UnitDef_Ch15AAlly_1_ref.s \
                           asm/dat_UnitDef_Ch14BAlly_7_ref.s \
                           asm/dat_UnitDef_Ch10AAlly_1_ref.s \
                           asm/dat_FinalEphraimEvents1_ref.s \
                           asm/dat_worldmap_gmapunit_p654.s \
                           asm/dat_worldmap_gmapunit_p483.s \
                           asm/dat_worldmap_gmapunit_p1548.s \
                           asm/dat_worldmap_gmapunit_p1347.s \
                           asm/dat_worldmap_gmapunit_p1341.s \
                           asm/dat_worldmap_gmapunit_p1336.s \
                           asm/dat_worldmap_gmapunit_p363.s \
                           asm/dat_UnitDef_Ch9AAlly_0_ref.s \
                           asm/dat_UnitDef_Ch8Enemy_4_ref.s \
                           asm/dat_UnitDef_Ch8Enemy_3_ref.s \
                           asm/dat_UnitDef_Ch8Enemy_2_ref.s \
                           asm/dat_UnitDef_Ch8Enemy_1_ref.s \
                           asm/dat_UnitDef_Ch6Enemy_0_ref.s \
                           asm/dat_UnitDef_Ch5xAlly_3_ref.s \
                           asm/dat_UnitDef_Ch5xAlly_2_ref.s \
                           asm/dat_UnitDef_Ch5xAlly_0_ref.s \
                           asm/dat_UnitDef_Ch5Enemy_1_ref.s \
                           asm/dat_UnitDef_Ch5Enemy_0_ref.s \
                           asm/dat_UnitDef_Ch4Enemy_2_ref.s \
                           asm/dat_UnitDef_Ch4Enemy_1_ref.s \
                           asm/dat_UnitDef_Ch3Enemy_2_ref.s \
                           asm/dat_UnitDef_Ch3Enemy_0_ref.s \
                           asm/dat_UnitDef_Ch2Enemy_0_ref.s \
                           asm/dat_UnitDef_Ch21BMixed_ref.s \
                           asm/dat_UnitDef_Ch21AMixed_ref.s \
                           asm/dat_UnitDef_Ch19ANPC_3_ref.s \
                           asm/dat_UnitDef_Ch18AMixed_ref.s \
                           asm/dat_UnitDef_Ch11AMixed_ref.s \
                           asm/dat_worldmap_gmapunit_p1539.s \
                           asm/dat_worldmap_gmapunit_p1332.s \
                           asm/dat_worldmap_gmapunit_p344.s \
                           asm/dat_worldmap_gmapunit_p1319.s \
                           asm/dat_UnitDef_Ch8Ally_1_ref.s \
                           asm/dat_UnitDef_Ch8Ally_0_ref.s \
                           asm/dat_UnitDef_Ch4Ally_0_ref.s \
                           asm/dat_worldmap_gmapunit_p794.s \
                           asm/dat_worldmap_gmapunit_p793.s \
                           asm/dat_anim_pike_trap.s \
                           asm/dat_anim_fire_trap.s \
                           asm/dat_worldmap_gmapunit_p1419.s \
                           asm/dat_worldmap_gmapunit_p1415.s \
                           asm/dat_worldmap_gmapunit_p1414.s \
                           asm/dat_worldmap_gmapunit_p1376.s \
                           asm/dat_worldmap_gmapunit_p1352.s \
                           asm/dat_worldmap_gmapunit_p1334.s \
                           asm/dat_worldmap_gmapunit_p790.s \
                           asm/dat_worldmap_gmapunit_p342.s \
                           asm/dat_data_bg_p38.s \
                           asm/dat_data_bg_p35.s \
                           asm/dat_data_bg_p33.s \
                           asm/dat_data_bg_p29.s \
                           asm/dat_data_bg_p28.s \
                           asm/dat_UnitDef_Ch4NPC_1_ref.s \
                           asm/dat_UnitDef_Ch13ANPC_ref.s \
                           asm/dat_PopupScr_GotGold_ref.s \
                           asm/dat_EventScr_Ch21A_9_ref.s \
                           asm/dat_EventScr_Ch20B_2_ref.s \
                           asm/dat_EventScr_Ch20B_1_ref.s \
                           asm/dat_EventScr_Ch16A_1_ref.s \
                           asm/dat_Ch10EirikaEvents_ref.s \
                           asm/dat_worldmap_gmapunit_p1387.s \
                           asm/dat_worldmap_gmapunit_p1385.s \
                           asm/dat_worldmap_gmapunit_p1384.s \
                           asm/dat_worldmap_gmapunit_p1377.s \
                           asm/dat_worldmap_gmapunit_p1374.s \
                           asm/dat_worldmap_gmapunit_p1363.s \
                           asm/dat_worldmap_gmapunit_p1360.s \
                           asm/dat_worldmap_gmapunit_p1359.s \
                           asm/dat_worldmap_gmapunit_p1358.s \
                           asm/dat_worldmap_gmapunit_p1325.s \
                           asm/dat_worldmap_gmapunit_p1004.s \
                           asm/dat_data_bg_p4.s \
                           asm/dat_worldmap_gmapunit_p557.s \
                           asm/dat_worldmap_gmapunit_p343.s \
                           asm/dat_data_bg_p36.s \
                           asm/dat_worldmap_gmapunit_p1397.s \
                           asm/dat_worldmap_gmapunit_p1396.s \
                           asm/dat_worldmap_gmapunit_p1394.s \
                           asm/dat_worldmap_gmapunit_p1393.s \
                           asm/dat_worldmap_gmapunit_p1392.s \
                           asm/dat_worldmap_gmapunit_p1391.s \
                           asm/dat_worldmap_gmapunit_p1388.s \
                           asm/dat_worldmap_gmapunit_p1361.s \
                           asm/dat_worldmap_gmapunit_p1335.s \
                           asm/dat_worldmap_gmapunit_p1320.s \
                           asm/dat_data_bg_p3.s \
                           asm/dat_worldmap_gmapunit_p356.s \
                           asm/dat_TileAnimations1_ref.s \
                           asm/dat_EventScr_Ch9A_4_ref.s \
                           asm/dat_EventScr_Ch5_11_ref.s \
                           asm/dat_EventScr_Ch4_10_ref.s \
                           asm/dat_Ch9EirikaEvents_ref.s \
                           asm/dat_worldmap_gmapunit_p1407.s \
                           asm/dat_worldmap_gmapunit_p1400.s \
                           asm/dat_worldmap_gmapunit_p1389.s \
                           asm/dat_worldmap_gmapunit_p1386.s \
                           asm/dat_worldmap_gmapunit_p365.s \
                           asm/dat_worldmap_gmapunit_p351.s \
                           asm/dat_worldmap_gmapunit_p341.s \
                           asm/dat_data_bg_p27.s \
                           asm/dat_data_bg_p18.s \
                           asm/dat_worldmap_gmapunit_p1576.s \
                           asm/dat_worldmap_gmapunit_p1559.s \
                           asm/dat_worldmap_gmapunit_p1331.s \
                           asm/dat_PrologueEvents_ref.s \
                           asm/dat_EventScr_Ch6_2_ref.s \
                           asm/dat_EventScr_Ch3_5_ref.s \
                           asm/dat_EventScr_Ch3_0_ref.s \
                           asm/dat_EventScr_Ch2_8_ref.s \
                           asm/dat_data_bg_p1.s \
                           asm/dat_worldmap_gmapunit_p3.s \
                           asm/dat_data_bg_p8.s \
                           asm/dat_worldmap_gmapunit_p760.s \
                           asm/dat_voicegroup039_ref.s \
                           asm/dat_voicegroup037_ref.s \
                           asm/dat_gFontgrp_379_ref.s \
                           asm/dat_gFontgrp_378_ref.s \
                           asm/dat_gFontgrp_377_ref.s \
                           asm/dat_gFontgrp_376_ref.s \
                           asm/dat_gFontgrp_375_ref.s \
                           asm/dat_gFontgrp_374_ref.s \
                           asm/dat_gFontgrp_373_ref.s \
                           asm/dat_gFontgrp_372_ref.s \
                           asm/dat_gFontgrp_371_ref.s \
                           asm/dat_gFontgrp_370_ref.s \
                           asm/dat_gFontgrp_369_ref.s \
                           asm/dat_gFontgrp_368_ref.s \
                           asm/dat_gFontgrp_367_ref.s \
                           asm/dat_gFontgrp_366_ref.s \
                           asm/dat_gFontgrp_365_ref.s \
                           asm/dat_gFontgrp_364_ref.s \
                           asm/dat_gFontgrp_363_ref.s \
                           asm/dat_gFontgrp_362_ref.s \
                           asm/dat_gFontgrp_361_ref.s \
                           asm/dat_gFontgrp_360_ref.s \
                           asm/dat_gFontgrp_359_ref.s \
                           asm/dat_gFontgrp_358_ref.s \
                           asm/dat_gFontgrp_357_ref.s \
                           asm/dat_gFontgrp_356_ref.s \
                           asm/dat_gFontgrp_355_ref.s \
                           asm/dat_gFontgrp_354_ref.s \
                           asm/dat_gFontgrp_353_ref.s \
                           asm/dat_gFontgrp_352_ref.s \
                           asm/dat_gFontgrp_351_ref.s \
                           asm/dat_gFontgrp_350_ref.s \
                           asm/dat_gFontgrp_349_ref.s \
                           asm/dat_gFontgrp_348_ref.s \
                           asm/dat_gFontgrp_347_ref.s \
                           asm/dat_gFontgrp_346_ref.s \
                           asm/dat_gFontgrp_345_ref.s \
                           asm/dat_gFontgrp_344_ref.s \
                           asm/dat_gFontgrp_343_ref.s \
                           asm/dat_gFontgrp_342_ref.s \
                           asm/dat_gFontgrp_341_ref.s \
                           asm/dat_gFontgrp_340_ref.s \
                           asm/dat_gFontgrp_339_ref.s \
                           asm/dat_gFontgrp_338_ref.s \
                           asm/dat_gFontgrp_337_ref.s \
                           asm/dat_gFontgrp_336_ref.s \
                           asm/dat_gFontgrp_335_ref.s \
                           asm/dat_gFontgrp_334_ref.s \
                           asm/dat_gFontgrp_333_ref.s \
                           asm/dat_gFontgrp_332_ref.s \
                           asm/dat_gFontgrp_331_ref.s \
                           asm/dat_gFontgrp_330_ref.s \
                           asm/dat_gFontgrp_329_ref.s \
                           asm/dat_gFontgrp_328_ref.s \
                           asm/dat_gFontgrp_327_ref.s \
                           asm/dat_gFontgrp_326_ref.s \
                           asm/dat_gFontgrp_325_ref.s \
                           asm/dat_gFontgrp_324_ref.s \
                           asm/dat_gFontgrp_323_ref.s \
                           asm/dat_gFontgrp_318_ref.s \
                           asm/dat_gFontgrp_304_ref.s \
                           asm/dat_gFontgrp_292_ref.s \
                           asm/dat_gFontgrp_278_ref.s \
                           asm/dat_gFontgrp_276_ref.s \
                           asm/dat_gFontgrp_275_ref.s \
                           asm/dat_gFontgrp_274_ref.s \
                           asm/dat_gFontgrp_273_ref.s \
                           asm/dat_gFontgrp_272_ref.s \
                           asm/dat_gFontgrp_271_ref.s \
                           asm/dat_gFontgrp_270_ref.s \
                           asm/dat_gFontgrp_269_ref.s \
                           asm/dat_gFontgrp_268_ref.s \
                           asm/dat_gFontgrp_267_ref.s \
                           asm/dat_gFontgrp_266_ref.s \
                           asm/dat_gFontgrp_265_ref.s \
                           asm/dat_gFontgrp_264_ref.s \
                           asm/dat_gFontgrp_263_ref.s \
                           asm/dat_gFontgrp_262_ref.s \
                           asm/dat_gFontgrp_261_ref.s \
                           asm/dat_gFontgrp_260_ref.s \
                           asm/dat_gFontgrp_259_ref.s \
                           asm/dat_gFontgrp_258_ref.s \
                           asm/dat_gFontgrp_257_ref.s \
                           asm/dat_gFontgrp_256_ref.s \
                           asm/dat_gFontgrp_255_ref.s \
                           asm/dat_gFontgrp_254_ref.s \
                           asm/dat_gFontgrp_253_ref.s \
                           asm/dat_gFontgrp_252_ref.s \
                           asm/dat_gFontgrp_251_ref.s \
                           asm/dat_gFontgrp_250_ref.s \
                           asm/dat_gFontgrp_249_ref.s \
                           asm/dat_gFontgrp_248_ref.s \
                           asm/dat_gFontgrp_247_ref.s \
                           asm/dat_gFontgrp_246_ref.s \
                           asm/dat_gFontgrp_245_ref.s \
                           asm/dat_gFontgrp_244_ref.s \
                           asm/dat_gFontgrp_243_ref.s \
                           asm/dat_gFontgrp_242_ref.s \
                           asm/dat_gFontgrp_240_ref.s \
                           asm/dat_gFontgrp_238_ref.s \
                           asm/dat_gFontgrp_236_ref.s \
                           asm/dat_gFontgrp_234_ref.s \
                           asm/dat_gFontgrp_233_ref.s \
                           asm/dat_gFontgrp_232_ref.s \
                           asm/dat_gFontgrp_231_ref.s \
                           asm/dat_gFontgrp_230_ref.s \
                           asm/dat_gFontgrp_229_ref.s \
                           asm/dat_gFontgrp_228_ref.s \
                           asm/dat_gFontgrp_227_ref.s \
                           asm/dat_gFontgrp_226_ref.s \
                           asm/dat_gFontgrp_225_ref.s \
                           asm/dat_gFontgrp_224_ref.s \
                           asm/dat_gFontgrp_223_ref.s \
                           asm/dat_gFontgrp_222_ref.s \
                           asm/dat_gFontgrp_221_ref.s \
                           asm/dat_gFontgrp_220_ref.s \
                           asm/dat_gFontgrp_219_ref.s \
                           asm/dat_gFontgrp_218_ref.s \
                           asm/dat_gFontgrp_217_ref.s \
                           asm/dat_gFontgrp_216_ref.s \
                           asm/dat_gFontgrp_215_ref.s \
                           asm/dat_gFontgrp_214_ref.s \
                           asm/dat_gFontgrp_213_ref.s \
                           asm/dat_gFontgrp_212_ref.s \
                           asm/dat_gFontgrp_211_ref.s \
                           asm/dat_gFontgrp_210_ref.s \
                           asm/dat_gFontgrp_209_ref.s \
                           asm/dat_gFontgrp_208_ref.s \
                           asm/dat_gFontgrp_207_ref.s \
                           asm/dat_gFontgrp_206_ref.s \
                           asm/dat_gFontgrp_205_ref.s \
                           asm/dat_gFontgrp_204_ref.s \
                           asm/dat_gFontgrp_203_ref.s \
                           asm/dat_gFontgrp_201_ref.s \
                           asm/dat_gFontgrp_200_ref.s \
                           asm/dat_gFontgrp_199_ref.s \
                           asm/dat_gFontgrp_198_ref.s \
                           asm/dat_gFontgrp_197_ref.s \
                           asm/dat_gFontgrp_196_ref.s \
                           asm/dat_gFontgrp_195_ref.s \
                           asm/dat_gFontgrp_194_ref.s \
                           asm/dat_gFontgrp_193_ref.s \
                           asm/dat_gFontgrp_192_ref.s \
                           asm/dat_gFontgrp_191_ref.s \
                           asm/dat_gFontgrp_190_ref.s \
                           asm/dat_gFontgrp_189_ref.s \
                           asm/dat_gFontgrp_188_ref.s \
                           asm/dat_gFontgrp_187_ref.s \
                           asm/dat_gFontgrp_186_ref.s \
                           asm/dat_gFontgrp_185_ref.s \
                           asm/dat_gFontgrp_184_ref.s \
                           asm/dat_gFontgrp_183_ref.s \
                           asm/dat_gFontgrp_182_ref.s \
                           asm/dat_gFontgrp_181_ref.s \
                           asm/dat_gFontgrp_180_ref.s \
                           asm/dat_gFontgrp_179_ref.s \
                           asm/dat_gFontgrp_178_ref.s \
                           asm/dat_gFontgrp_177_ref.s \
                           asm/dat_gFontgrp_176_ref.s \
                           asm/dat_gFontgrp_175_ref.s \
                           asm/dat_gFontgrp_174_ref.s \
                           asm/dat_gFontgrp_173_ref.s \
                           asm/dat_gFontgrp_172_ref.s \
                           asm/dat_gFontgrp_171_ref.s \
                           asm/dat_gFontgrp_170_ref.s \
                           asm/dat_gFontgrp_165_ref.s \
                           asm/dat_gFontgrp_151_ref.s \
                           asm/dat_gFontgrp_139_ref.s \
                           asm/dat_gFontgrp_125_ref.s \
                           asm/dat_gFontgrp_123_ref.s \
                           asm/dat_gFontgrp_122_ref.s \
                           asm/dat_gFontgrp_121_ref.s \
                           asm/dat_gFontgrp_120_ref.s \
                           asm/dat_gFontgrp_119_ref.s \
                           asm/dat_gFontgrp_118_ref.s \
                           asm/dat_gFontgrp_117_ref.s \
                           asm/dat_gFontgrp_116_ref.s \
                           asm/dat_gFontgrp_115_ref.s \
                           asm/dat_gFontgrp_114_ref.s \
                           asm/dat_gFontgrp_113_ref.s \
                           asm/dat_gFontgrp_112_ref.s \
                           asm/dat_gFontgrp_111_ref.s \
                           asm/dat_gFontgrp_110_ref.s \
                           asm/dat_gFontgrp_109_ref.s \
                           asm/dat_gFontgrp_108_ref.s \
                           asm/dat_gFontgrp_107_ref.s \
                           asm/dat_gFontgrp_106_ref.s \
                           asm/dat_gFontgrp_105_ref.s \
                           asm/dat_gFontgrp_104_ref.s \
                           asm/dat_gFontgrp_103_ref.s \
                           asm/dat_gFontgrp_102_ref.s \
                           asm/dat_gFontgrp_101_ref.s \
                           asm/dat_gFontgrp_100_ref.s \
                           asm/dat_Ch8EventData_ref.s \
                           asm/dat_Ch7EventData_ref.s \
                           asm/dat_Ch5EventData_ref.s \
                           asm/dat_data_bg_p39.s \
                           asm/dat_data_bg_p32.s \
                           asm/dat_data_banim_p224.s \
                           asm/dat_data_bg_p37.s \
                           asm/dat_data_bg_p25.s \
                           asm/dat_gFontgrp_99_ref.s \
                           asm/dat_gFontgrp_98_ref.s \
                           asm/dat_gFontgrp_97_ref.s \
                           asm/dat_gFontgrp_96_ref.s \
                           asm/dat_gFontgrp_95_ref.s \
                           asm/dat_gFontgrp_94_ref.s \
                           asm/dat_gFontgrp_93_ref.s \
                           asm/dat_gFontgrp_92_ref.s \
                           asm/dat_gFontgrp_91_ref.s \
                           asm/dat_gFontgrp_90_ref.s \
                           asm/dat_gFontgrp_89_ref.s \
                           asm/dat_gFontgrp_88_ref.s \
                           asm/dat_gFontgrp_86_ref.s \
                           asm/dat_gFontgrp_84_ref.s \
                           asm/dat_gFontgrp_82_ref.s \
                           asm/dat_gFontgrp_80_ref.s \
                           asm/dat_gFontgrp_79_ref.s \
                           asm/dat_gFontgrp_78_ref.s \
                           asm/dat_gFontgrp_77_ref.s \
                           asm/dat_gFontgrp_76_ref.s \
                           asm/dat_gFontgrp_75_ref.s \
                           asm/dat_gFontgrp_74_ref.s \
                           asm/dat_gFontgrp_73_ref.s \
                           asm/dat_gFontgrp_72_ref.s \
                           asm/dat_gFontgrp_71_ref.s \
                           asm/dat_gFontgrp_70_ref.s \
                           asm/dat_gFontgrp_69_ref.s \
                           asm/dat_gFontgrp_68_ref.s \
                           asm/dat_gFontgrp_67_ref.s \
                           asm/dat_gFontgrp_66_ref.s \
                           asm/dat_gFontgrp_65_ref.s \
                           asm/dat_gFontgrp_64_ref.s \
                           asm/dat_gFontgrp_63_ref.s \
                           asm/dat_gFontgrp_62_ref.s \
                           asm/dat_gFontgrp_61_ref.s \
                           asm/dat_gFontgrp_60_ref.s \
                           asm/dat_gFontgrp_59_ref.s \
                           asm/dat_gFontgrp_58_ref.s \
                           asm/dat_gFontgrp_57_ref.s \
                           asm/dat_gFontgrp_56_ref.s \
                           asm/dat_gFontgrp_55_ref.s \
                           asm/dat_gFontgrp_54_ref.s \
                           asm/dat_gFontgrp_53_ref.s \
                           asm/dat_gFontgrp_52_ref.s \
                           asm/dat_gFontgrp_51_ref.s \
                           asm/dat_gFontgrp_50_ref.s \
                           asm/dat_gFontgrp_49_ref.s \
                           asm/dat_gFontgrp_47_ref.s \
                           asm/dat_gFontgrp_46_ref.s \
                           asm/dat_gFontgrp_45_ref.s \
                           asm/dat_gFontgrp_44_ref.s \
                           asm/dat_gFontgrp_43_ref.s \
                           asm/dat_gFontgrp_42_ref.s \
                           asm/dat_gFontgrp_41_ref.s \
                           asm/dat_gFontgrp_40_ref.s \
                           asm/dat_gFontgrp_39_ref.s \
                           asm/dat_gFontgrp_38_ref.s \
                           asm/dat_gFontgrp_37_ref.s \
                           asm/dat_gFontgrp_36_ref.s \
                           asm/dat_gFontgrp_35_ref.s \
                           asm/dat_gFontgrp_34_ref.s \
                           asm/dat_gFontgrp_33_ref.s \
                           asm/dat_gFontgrp_32_ref.s \
                           asm/dat_gFontgrp_31_ref.s \
                           asm/dat_gFontgrp_30_ref.s \
                           asm/dat_gFontgrp_29_ref.s \
                           asm/dat_gFontgrp_28_ref.s \
                           asm/dat_gFontgrp_27_ref.s \
                           asm/dat_gFontgrp_26_ref.s \
                           asm/dat_gFontgrp_25_ref.s \
                           asm/dat_gFontgrp_24_ref.s \
                           asm/dat_gFontgrp_23_ref.s \
                           asm/dat_gFontgrp_22_ref.s \
                           asm/dat_gFontgrp_21_ref.s \
                           asm/dat_gFontgrp_20_ref.s \
                           asm/dat_gFontgrp_19_ref.s \
                           asm/dat_gFontgrp_18_ref.s \
                           asm/dat_gFontgrp_17_ref.s \
                           asm/dat_gFontgrp_16_ref.s \
                           asm/dat_data_bg_p24.s \
                           asm/dat_data_bg_p0.s \
                           asm/dat_worldmap_gmapunit_p795.s \
                           asm/dat_const_data_DAEF0.s \
                           asm/dat_data_bg_p31.s \
                           asm/dat_data_bg_p26.s \
                           asm/dat_data_bg_p13.s \
                           asm/dat_Ch5XEvents_ref.s \
                           asm/dat_data_bg_p7.s \
                           asm/dat_trig_rodata.s \
                           asm/dat_Ch9Events_ref.s \
                           asm/dat_Ch6Events_ref.s \
                           asm/dat_Ch4Events_ref.s \
                           asm/dat_Ch3Events_ref.s \
                           asm/dat_Ch2Events_ref.s \
                           asm/dat_Ch1Events_ref.s \
                           asm/dat_data_5AA96C_p0.s \
                           asm/data_banim.s \
                           asm/direct_sound_data.s \
                           asm/data_data_banim_terrain.s \
                           asm/data_banim_pal.s \
                           asm/snd_song002_agbfe3_bgm_op_theme_i_7.s \
                           asm/snd_song067_agbfe3_bgm_op_theme_7.s \
                           asm/snd_song020_agbfe3_bgm_map_cp2_8.s \
                           asm/snd_song020_agbfe3_bgm_map_cp2_10.s \
                           asm/snd_song014_agbfe3_bgm_map_pl5_5.s \
                           asm/snd_song061_bgm_sys_fase_cp.s \
                           asm/snd_song037_agbfe3_bgm_evt_start_7.s \
                           asm/snd_song060_bgm_sys_fase_pl.s \
                           asm/snd_song022_agbfe3_bgm_map_cp5_5.s \
                           asm/snd_song320_bmp_evt_20b_1.s \
                           asm/snd_song062_agbfe3_bgm_gameover.s \
                           asm/snd_song322_mon_mao_die1.s \
                           asm/snd_song035_agbfe3_bgm_btl_class_chg_5.s \
                           asm/snd_song039_agbfe3_bgm_evt_yorokobi_6.s \
                           asm/snd_song046_agbfe3_bgm_evt_enemy2_2.s \
                           asm/frontier_fontgrp_ui.s \
                           asm/snd_song029_agbfe3_bgm_btl_boss4_4.s \
                           asm/frontier_ending_cg.s \
                           asm/snd_song070_agbfe3_bgm_ed_after_8.s \
                           asm/snd_song070_agbfe3_bgm_ed_after_7.s \
                           asm/snd_song013_agbfe3_bgm_map_pl12_6.s \
                           asm/snd_song058_agbfe3_bgm_ff_togijyo.s \
                           asm/snd_song321_bmp_evt_20b_2.s \
                           asm/data_085D1F2C.s \
                           asm/snd_song023_agbfe3_bgm_map_cp4_3.s \
                           asm/snd_song017_agbfe3_bgm_map_pl6_4.s \
                           asm/snd_song010_agbfe3_bgm_map_pl3_4.s \
                           asm/snd_song007_agbfe3_bgm_wmap_04_6.s \
                           asm/snd_song006_agbfe3_bgm_wmap_03_3.s \
                           asm/snd_song001_agbfe3_bgm_opening_3.s \
                           asm/snd_song001_agbfe3_bgm_opening_1.s \
                           asm/data_085D30F8.s \
                           asm/data_08A61EAC.s \
                           asm/frontier_map_ch9events.s \
                           asm/data_08A5A6AD.s \
                           asm/snd_song790_sys_chapter_start.s \
                           asm/data_08A61264.s \
                           asm/data_08908704.s \
                           asm/data_08577608.s \
                           asm/data_08A61BE4.s \
                           asm/data_08A6369C.s \
                           asm/data_08A602D4.s \
                           asm/rom_header_080000C0.s \
                           asm/data_08A634E8.s \
                           asm/data_08A60AB4.s \
                           asm/snd_song947_mon_mao_magic1_2.s \
                           asm/snd_song946_mon_mao_magic1_1.s \
                           asm/snd_song944_btl_snr_magic2_2.s \
                           asm/snd_song943_btl_snr_magic2_1.s \
                           asm/data_08A62EDC.s \
                           asm/data_08A62C34.s \
                           asm/data_08A62A14.s \
                           asm/data_0890C914.s \
                           asm/snd_song035_agbfe3_bgm_btl_class_chg_4.s \
                           asm/data_08A710FC.s \
                           asm/data_08A7239C.s \
                           asm/data_08A7230C.s \
                           asm/data_08A72258.s \
                           asm/data_08A721E8.s \
                           asm/data_08A7214C.s \
                           asm/data_08A720E0.s \
                           asm/data_08A72038.s \
                           asm/data_08A71FC0.s \
                           asm/data_08A71C60.s \
                           asm/data_08A71BF0.s \
                           asm/data_08A68574.s \
                           asm/data_085775A4.s \
                           asm/data_08A66110.s \
                           asm/data_08A60A28.s \
                           asm/data_08FE0000.s \
                           asm/data_08BB8E94.s \
                           asm/data_08FFF000.s \
                           asm/data_08EF86C8.s \
                           asm/data_08C01928.s \
                           asm/data_08A64E30.s \
                           asm/data_08A632C8.s \
                           asm/data_08A63120.s \
                           asm/data_08EE0AD0.s \
                           asm/data_08BAB5E4.s \
                           asm/data_08BAB2DC.s \
                           asm/data_08B755D4.s \
                           asm/data_08B7229C.s \
                           asm/data_08B6EE04.s \
                           asm/data_08B6BD34.s \
                           asm/data_08B65D08.s \
                           asm/data_08B5B560.s \
                           asm/data_08B3E688.s \
                           asm/data_08B3E1C8.s \
                           asm/data_08ABCAD4.s \
                           asm/data_08A9DCD4.s \
                           asm/data_08A9DAB4.s \
                           asm/data_08A9D904.s \
                           asm/data_08A9CA64.s \
                           asm/data_08A9A8D4.s \
                           asm/data_08A686CC.s \
                           asm/data_08A6846C.s \
                           asm/data_08A661E0.s \
                           asm/data_08A652C0.s \
                           asm/data_08A6378C.s \
                           asm/data_08A62808.s \
                           asm/data_08A62340.s \
                           asm/data_08A618F0.s \
                           asm/data_08A61624.s \
                           asm/data_08A612F4.s \
                           asm/data_08A60BE4.s \
                           asm/data_08A60AE8.s \
                           asm/data_08A60354.s \
                           asm/data_08A5E3B8.s \
                           asm/data_08A5DF98.s \
                           asm/data_08A5DE70.s \
                           asm/data_08A5DAE8.s \
                           asm/data_08A5D270.s \
                           asm/data_08A5CFA0.s \
                           asm/data_08A5CC68.s \
                           asm/data_08A5C25C.s \
                           asm/data_08A5BDD8.s \
                           asm/data_08A5B56C.s \
                           asm/data_08A5B424.s \
                           asm/data_08A5B090.s \
                           asm/data_08A5AE80.s \
                           asm/data_08A5ADC8.s \
                           asm/data_08A5ABAC.s \
                           asm/data_08A5AAA8.s \
                           asm/data_08A5A828.s \
                           asm/data_08A156DC.s \
                           asm/data_089263A8.s \
                           asm/data_08926134.s \
                           asm/data_08925F90.s \
                           asm/data_08925DD8.s \
                           asm/data_0890F470.s \
                           asm/data_0890F2E0.s \
                           asm/data_0890ECE8.s \
                           asm/data_0890EB30.s \
                           asm/data_0890E394.s \
                           asm/data_0890D874.s \
                           asm/data_0890D554.s \
                           asm/data_0890D234.s \
                           asm/data_0890C9BC.s \
                           asm/data_0890C0A4.s \
                           asm/data_0890BDC4.s \
                           asm/data_0890B0B8.s \
                           asm/data_0890ADC0.s \
                           asm/data_0890AAC8.s \
                           asm/data_0890A6A8.s \
                           asm/data_0890A480.s \
                           asm/data_08909814.s \
                           asm/data_089095A8.s \
                           asm/data_0890933C.s \
                           asm/data_08908958.s \
                           asm/data_08908790.s \
                           asm/data_08908354.s \
                           asm/data_08908228.s \
                           asm/data_089038BC.s \
                           asm/data_088617C8.s \
                           asm/data_08855D58.s \
                           asm/data_087E6E80.s \
                           asm/data_087E1A58.s \
                           asm/data_087E1718.s \
                           asm/data_087AEA64.s \
                           asm/data_087AA984.s \
                           asm/data_087AA848.s \
                           asm/data_087AA6B8.s \
                           asm/data_087A8668.s \
                           asm/data_0877B9B4.s \
                           asm/data_08764BF4.s \
                           asm/data_087644A8.s \
                           asm/data_0872CDCC.s \
                           asm/data_0872CC70.s \
                           asm/data_0872CA78.s \
                           asm/data_0872C934.s \
                           asm/data_086EA628.s \
                           asm/data_086E2A84.s \
                           asm/data_086E24B4.s \
                           asm/data_086DF490.s \
                           asm/data_086CF94C.s \
                           asm/data_086C0290.s \
                           asm/data_086BFC18.s \
                           asm/data_086BF0FC.s \
                           asm/data_086BDDDC.s \
                           asm/data_086BC90C.s \
                           asm/data_086BB154.s \
                           asm/data_086BAB74.s \
                           asm/data_086BA1E4.s \
                           asm/data_086B9E8C.s \
                           asm/data_086B8D40.s \
                           asm/data_086B730C.s \
                           asm/data_086B0964.s \
                           asm/data_086AEA74.s \
                           asm/data_086AC554.s \
                           asm/data_086AAE60.s \
                           asm/data_086A8F70.s \
                           asm/data_086A488C.s \
                           asm/data_086A4364.s \
                           asm/data_086A328C.s \
                           asm/data_086A2D64.s \
                           asm/data_086A1CB0.s \
                           asm/data_086A01E0.s \
                           asm/data_0869C14C.s \
                           asm/data_08689354.s \
                           asm/data_0867B54C.s \
                           asm/data_086724CC.s \
                           asm/data_0865A268.s \
                           asm/data_0864CAC8.s \
                           asm/data_08647830.s \
                           asm/data_086371AC.s \
                           asm/data_08636008.s \
                           asm/data_086329CC.s \
                           asm/data_08631BAC.s \
                           asm/data_08630AD8.s \
                           asm/data_08622128.s \
                           asm/data_086215FC.s \
                           asm/data_0861F7FC.s \
                           asm/data_0861F580.s \
                           asm/data_0861CCC0.s \
                           asm/data_08616558.s \
                           asm/data_08613A6C.s \
                           asm/data_08612134.s \
                           asm/data_086114F8.s \
                           asm/data_08610D90.s \
                           asm/data_086101B4.s \
                           asm/data_0860F5FC.s \
                           asm/data_0860E538.s \
                           asm/data_0860E1CC.s \
                           asm/data_0860DEB4.s \
                           asm/data_0860D254.s \
                           asm/data_08607B7C.s \
                           asm/data_08606FE4.s \
                           asm/data_08606D84.s \
                           asm/data_08606B24.s \
                           asm/data_086068D0.s \
                           asm/data_08604E24.s \
                           asm/data_08604A8C.s \
                           asm/data_08602D54.s \
                           asm/data_08601388.s \
                           asm/data_085FEDD8.s \
                           asm/data_085FEC28.s \
                           asm/data_085FE490.s \
                           asm/data_085FE358.s \
                           asm/data_085FDDAC.s \
                           asm/data_085FD998.s \
                           asm/data_085FD0E8.s \
                           asm/data_085FC638.s \
                           asm/data_085FC458.s \
                           asm/data_085F34A0.s \
                           asm/data_085F22B4.s \
                           asm/data_085F1568.s \
                           asm/data_085F13A8.s \
                           asm/data_085E62D0.s \
                           asm/data_085E3534.s \
                           asm/data_085E0698.s \
                           asm/data_085D31EC.s \
                           asm/data_085D1EA4.s \
                           asm/data_085C5CE0.s \
                           asm/data_085C5B58.s \
                           asm/data_085C4830.s \
                           asm/data_085C4518.s \
                           asm/data_085C3950.s \
                           asm/data_085C3560.s \
                           asm/data_085C2980.s \
                           asm/data_085BA36C.s \
                           asm/data_085BA1F4.s \
                           asm/data_085B938C.s \
                           asm/data_085B8F80.s \
                           asm/data_085B8EEC.s \
                           asm/data_0859A0AC.s \
                           asm/data_085985AC.s \
                           asm/data_08595864.s \
                           asm/data_08595594.s \
                           asm/data_08595474.s \
                           asm/data_0859527C.s \
                           asm/data_08594E8C.s \
                           asm/data_08594A54.s \
                           asm/data_0859497C.s \
                           asm/data_0857E32C.s \
                           asm/data_0857DEF4.s \
                           asm/data_0857DCB4.s \
                           asm/data_0857D48C.s \
                           asm/data_0857C6C4.s \
                           asm/data_0857AF6C.s \
                           asm/data_0857AE4C.s \
                           asm/data_0857AC54.s \
                           asm/data_0857A864.s \
                           asm/data_0857A42C.s \
                           asm/data_0857A354.s \
                           asm/data_0857A114.s \
                           asm/data_08577688.s \
                           asm/data_085772B4.s \
                           asm/data_08576754.s \
                           asm/data_0857656C.s \
                           asm/data_08576124.s \
                           asm/data_08575DCC.s \
                           asm/data_08574898.s \
                           asm/data_08574748.s \
                           asm/data_08572FC8.s \
                           asm/data_08572E14.s \
                           asm/data_0856FA38.s \
                           asm/data_0856F374.s \
                           asm/data_0856EDC0.s \
                           asm/data_0856E058.s \
                           asm/data_0856D9D0.s \
                           asm/data_0856CC9C.s \
                           asm/data_08567225.s \
                           asm/data_08565E77.s \
                           asm/data_085659E0.s \
                           asm/data_08565768.s \
                           asm/data_085649C8.s \
                           asm/data_0856443C.s \
                           asm/data_08561D7A.s \
                           asm/data_085580A1.s \
                           asm/data_0855439B.s \
                           asm/data_08553F66.s \
                           asm/data_085537F3.s \
                           asm/data_085520AC.s \
                           asm/data_08551DB5.s \
                           asm/data_0855133E.s \
                           asm/data_0854EDB8.s \
                           asm/data_0854DF1F.s \
                           asm/data_0854C2B5.s \
                           asm/data_085483CE.s \
                           asm/data_085475B5.s \
                           asm/data_085472FA.s \
                           asm/data_0854359D.s \
                           asm/data_085432BC.s \
                           asm/data_08540B63.s \
                           asm/data_0853D31C.s \
                           asm/data_0853518C.s \
                           asm/data_08214004.s \
                           asm/data_08213A10.s \
                           asm/data_081F6D00.s \
                           asm/data_081F66A4.s \
                           asm/data_081F64C0.s \
                           asm/data_081F611C.s \
                           asm/data_081F5BF0.s \
                           asm/data_081F4A20.s \
                           asm/data_081F42F8.s \
                           asm/data_081F3D80.s \
                           asm/data_081F3844.s \
                           asm/data_081F3358.s \
                           asm/data_081F2D20.s \
                           asm/data_081F25BC.s \
                           asm/data_081F1F10.s \
                           asm/data_081F153C.s \
                           asm/data_081F0CF0.s \
                           asm/data_081F04B4.s \
                           asm/data_081EFD00.s \
                           asm/data_081EF574.s \
                           asm/data_081EEE80.s \
                           asm/data_081EE82C.s \
                           asm/data_081EB814.s \
                           asm/data_081EA8F8.s \
                           asm/data_081E9C6C.s \
                           asm/data_081E8FAC.s \
                           asm/data_081E8A58.s \
                           asm/data_081E8124.s \
                           asm/data_081E77E0.s \
                           asm/data_081E6F28.s \
                           asm/data_081E6488.s \
                           asm/data_081E5A34.s \
                           asm/data_081E4E20.s \
                           asm/data_081E4370.s \
                           asm/data_081E3958.s \
                           asm/data_081E314C.s \
                           asm/data_081E287C.s \
                           asm/data_081DE63C.s \
                           asm/data_081DDF10.s \
                           asm/data_081DD57C.s \
                           asm/data_081DBEB4.s \
                           asm/data_081DB354.s \
                           asm/data_081DA858.s \
                           asm/data_081D9F94.s \
                           asm/data_081D90A8.s \
                           asm/data_081D7910.s \
                           asm/data_081D6FF0.s \
                           asm/data_081D67AC.s \
                           asm/data_081D5C6C.s \
                           asm/data_081D51E4.s \
                           asm/data_081D485C.s \
                           asm/data_081D3CF8.s \
                           asm/data_081D33A4.s \
                           asm/data_081D28EC.s \
                           asm/data_081D1A40.s \
                           asm/data_081D10F4.s \
                           asm/data_081D07F8.s \
                           asm/data_081CFF44.s \
                           asm/data_081CF484.s \
                           asm/data_081CEF00.s \
                           asm/data_081CE5F0.s \
                           asm/data_081CDC7C.s \
                           asm/data_081CD240.s \
                           asm/data_081CC8FC.s \
                           asm/data_081CBF48.s \
                           asm/data_081CB584.s \
                           asm/data_081CAAB0.s \
                           asm/data_081CA04C.s \
                           asm/data_081C9510.s \
                           asm/data_081C8A44.s \
                           asm/data_081C8020.s \
                           asm/data_081C7680.s \
                           asm/data_081C6724.s \
                           asm/data_081C5810.s \
                           asm/data_081C0434.s \
                           asm/data_081BFB18.s \
                           asm/data_081BF1A0.s \
                           asm/data_081BE898.s \
                           asm/data_081BDEB4.s \
                           asm/data_081BD510.s \
                           asm/data_081BCB74.s \
                           asm/data_081BC22C.s \
                           asm/data_081BB74C.s \
                           asm/data_081BAC98.s \
                           asm/data_081BA3D8.s \
                           asm/data_081B9ADC.s \
                           asm/data_081B8E14.s \
                           asm/data_081B8438.s \
                           asm/data_081B782C.s \
                           asm/data_081B6DE0.s \
                           asm/data_081B62E4.s \
                           asm/data_081B583C.s \
                           asm/data_081B4C6C.s \
                           asm/data_081B4084.s \
                           asm/data_081B3734.s \
                           asm/data_081A6774.s \
                           asm/data_0819EADC.s \
                           asm/data_080ED67C.s \
                           asm/data_080DFF00.s \
                           asm/data_080DEE1A.s \
                           asm/data_080DED3A.s \
                           asm/data_080DCCB2.s \
                           asm/data_080DC8B0.s \
                           asm/data_080DC684.s \
                           asm/snd_song056_agbfe3_bgm_togijyo_info_3.s \
                           asm/data_08BB8A74.s \
                           asm/data_08B8B490.s \
                           asm/data_08B8A7B0.s \
                           asm/data_08B3E86C.s \
                           asm/data_08B1E998.s \
                           asm/data_08B1CCD4.s \
                           asm/data_08AC1AE4.s \
                           asm/data_08AB0B48.s \
                           asm/data_08AAF6DC.s \
                           asm/data_08A9CA34.s \
                           asm/data_08A980D0.s \
                           asm/data_08A97BEC.s \
                           asm/data_08A964FC.s \
                           asm/data_08A933E8.s \
                           asm/data_08A68F2C.s \
                           asm/data_08A68B20.s \
                           asm/data_08A64C88.s \
                           asm/data_08A63088.s \
                           asm/data_08A614C0.s \
                           asm/data_08A611DC.s \
                           asm/data_08A5DA90.s \
                           asm/data_08A5D5C0.s \
                           asm/data_08A5D524.s \
                           asm/data_08A5D40C.s \
                           asm/data_08A5D360.s \
                           asm/data_08A5D1E8.s \
                           asm/data_08A5CEDC.s \
                           asm/data_08A5B3A8.s \
                           asm/data_08A5B2B4.s \
                           asm/data_08A5B238.s \
                           asm/data_08A5B1C8.s \
                           asm/data_08A5AFE4.s \
                           asm/data_08A5AF38.s \
                           asm/data_08A5AD4C.s \
                           asm/data_08A5AC94.s \
                           asm/data_08A5A9B4.s \
                           asm/data_08A5A910.s \
                           asm/data_08A5A7B0.s \
                           asm/data_08A15984.s \
                           asm/data_08A146D4.s \
                           asm/data_08925CD4.s \
                           asm/data_08925BF8.s \
                           asm/data_0890D0CC.s \
                           asm/data_0890C824.s \
                           asm/data_0890C7AC.s \
                           asm/data_0890C6A8.s \
                           asm/data_0890BD24.s \
                           asm/data_0890BC70.s \
                           asm/data_0890AA3C.s \
                           asm/data_0890A3D4.s \
                           asm/data_0890A320.s \
                           asm/data_089092B0.s \
                           asm/data_0890915C.s \
                           asm/data_0890375C.s \
                           asm/data_0885612C.s \
                           asm/data_08856004.s \
                           asm/data_088486DC.s \
                           asm/data_087FB938.s \
                           asm/data_087FB4BC.s \
                           asm/data_087FB044.s \
                           asm/data_087FABCC.s \
                           asm/data_087FA0B4.s \
                           asm/data_087F9E98.s \
                           asm/data_087F98C4.s \
                           asm/data_087F9798.s \
                           asm/data_087AA068.s \
                           asm/data_087A89EC.s \
                           asm/data_087A2554.s \
                           asm/data_087A2494.s \
                           asm/data_0877B894.s \
                           asm/data_0872CFC4.s \
                           asm/data_0872C194.s \
                           asm/data_0872C080.s \
                           asm/data_08718440.s \
                           asm/data_08715D90.s \
                           asm/data_08713018.s \
                           asm/data_086F6364.s \
                           asm/data_086F6198.s \
                           asm/data_086E93DC.s \
                           asm/data_086BCCD8.s \
                           asm/data_086BB064.s \
                           asm/data_086B87AC.s \
                           asm/data_086B8608.s \
                           asm/data_086B7E10.s \
                           asm/data_086A3E90.s \
                           asm/data_086A3BCC.s \
                           asm/data_086A2890.s \
                           asm/data_086A25CC.s \
                           asm/data_086A0C24.s \
                           asm/data_0869BFF0.s \
                           asm/data_086834CC.s \
                           asm/data_0867E6BC.s \
                           asm/data_0867E3B4.s \
                           asm/data_086730D0.s \
                           asm/data_08663218.s \
                           asm/data_0865A694.s \
                           asm/data_0865A404.s \
                           asm/data_08659FFC.s \
                           asm/data_0864738C.s \
                           asm/data_08645FC4.s \
                           asm/data_08636294.s \
                           asm/data_0863230C.s \
                           asm/data_086314EC.s \
                           asm/data_08625014.s \
                           asm/data_08624C8C.s \
                           asm/data_08620BB8.s \
                           asm/data_0861F3BC.s \
                           asm/data_0861F2B8.s \
                           asm/data_0861F1B0.s \
                           asm/data_0861F0CC.s \
                           asm/data_0861EAF0.s \
                           asm/data_0861E944.s \
                           asm/data_0861E7B0.s \
                           asm/data_0861E61C.s \
                           asm/data_0861E578.s \
                           asm/data_0861E4D4.s \
                           asm/data_0861E430.s \
                           asm/data_0861E38C.s \
                           asm/data_0861E2E8.s \
                           asm/data_0860EA7C.s \
                           asm/data_0860E820.s \
                           asm/data_0860E394.s \
                           asm/data_0860E028.s \
                           asm/data_08607220.s \
                           asm/data_08607184.s \
                           asm/data_08602EAC.s \
                           asm/data_085FFB30.s \
                           asm/data_085FC068.s \
                           asm/data_085F3338.s \
                           asm/data_085E3724.s \
                           asm/data_085D1E10.s \
                           asm/data_085CBFA4.s \
                           asm/data_085CBE64.s \
                           asm/data_085C6A20.s \
                           asm/data_085C5A00.s \
                           asm/data_085C4440.s \
                           asm/data_085C3B10.s \
                           asm/data_085C3A08.s \
                           asm/data_085C34F0.s \
                           asm/data_085C3348.s \
                           asm/data_085BA10C.s \
                           asm/data_085BA09C.s \
                           asm/data_085B9EE8.s \
                           asm/data_085B9E14.s \
                           asm/data_0859848C.s \
                           asm/data_085957D4.s \
                           asm/data_08594374.s \
                           asm/data_0859137C.s \
                           asm/data_0857DBDC.s \
                           asm/data_0857DA2C.s \
                           asm/data_0857D36C.s \
                           asm/data_0857B1AC.s \
                           asm/data_08579D4C.s \
                           asm/data_08577EF0.s \
                           asm/data_0857742E.s \
                           asm/data_08576B40.s \
                           asm/data_08576874.s \
                           asm/data_08576361.s \
                           asm/data_08576255.s \
                           asm/data_08575F70.s \
                           asm/data_08575ED0.s \
                           asm/data_08575C4C.s \
                           asm/data_08575ACC.s \
                           asm/data_085757CC.s \
                           asm/data_08575580.s \
                           asm/data_0857535C.s \
                           asm/data_085750E0.s \
                           asm/data_08575028.s \
                           asm/data_08574CD8.s \
                           asm/data_08574A20.s \
                           asm/data_08573814.s \
                           asm/data_08573678.s \
                           asm/data_085734E8.s \
                           asm/data_08572C54.s \
                           asm/data_085706C8.s \
                           asm/data_08570120.s \
                           asm/data_0856FC7C.s \
                           asm/data_0856FB20.s \
                           asm/data_0856DBC0.s \
                           asm/data_0856DAF4.s \
                           asm/data_0856D92C.s \
                           asm/data_0856A370.s \
                           asm/data_0856A1E4.s \
                           asm/data_08566BCC.s \
                           asm/data_0855F8C0.s \
                           asm/data_0855F708.s \
                           asm/data_0855F56E.s \
                           asm/data_08553430.s \
                           asm/data_0853593F.s \
                           asm/data_081F65C0.s \
                           asm/data_081A00C8.s \
                           asm/data_080E0008.s \
                           asm/data_080DD3D0.s \
                           asm/data_080DCDAC.s \
                           asm/data_080DC144.s \
                           asm/data_080DC104.s \
                           asm/data_080DA744.s \
                           asm/data_08048798.s \
                           asm/data_08A5D0E4.s \
                           asm/data_085F14DC.s \
                           asm/data_085BA00C.s \
                           asm/snd_song981_btl_mon_magic1.s \
                           asm/snd_song980_btl_evl_magic2.s \
                           asm/snd_song950_mon_gog_magic1.s \
                           asm/snd_song085_agbfe3_bgm_btl_boss5_2_3.s \
                           asm/snd_song145_se_sys_chapter_start1_2.s \
                           asm/snd_song086_agbfe3_bgm_ed_staff_2_5.s \
                           asm/snd_song029_agbfe3_bgm_btl_boss4_0.s \
                           asm/snd_song045_agbfe3_bgm_evt_lyon2_4.s \
                           asm/snd_song038_agbfe3_bgm_evt_enemy_6.s \
                           asm/snd_song038_agbfe3_bgm_evt_enemy_3.s \
                           asm/snd_song038_agbfe3_bgm_evt_enemy_2.s \
                           asm/snd_song030_agbfe3_bgm_btl_boss5_3.s \
                           asm/snd_song319_bmp_evt_15_1.s \
                           asm/snd_song754_h_btl_dragon_bress_01.s \
                           asm/snd_song070_agbfe3_bgm_ed_after_4.s \
                           asm/snd_song069_agbfe3_bgm_evt_last_2.s \
                           asm/snd_song066_agbfe3_bgm_ed_staff_5.s \
                           asm/snd_song044_agbfe3_bgm_evt_lyon_4.s \
                           asm/snd_song044_agbfe3_bgm_evt_lyon_3.s \
                           asm/snd_song013_agbfe3_bgm_map_pl12_9.s \
                           asm/snd_song012_agbfe3_bgm_map_pl11_7.s \
                           asm/snd_song021_agbfe3_bgm_map_cp3_0.s \
                           asm/snd_song020_agbfe3_bgm_map_cp2_0.s \
                           asm/snd_song059_agbfe3_bgm_ff_loop_5.s \
                           asm/snd_song024_agbfe3_bgm_map_cp8_7.s \
                           asm/snd_song024_agbfe3_bgm_map_cp8_6.s \
                           asm/snd_song019_agbfe3_bgm_map_cp1_3.s \
                           asm/snd_song015_agbfe3_bgm_map_pl9_4.s \
                           asm/snd_song011_agbfe3_bgm_map_pl4_7.s \
                           asm/snd_song010_agbfe3_bgm_map_pl3_3.s \
                           asm/snd_song009_agbfe3_bgm_map_pl2_8.s \
                           asm/snd_song001_agbfe3_bgm_opening_0.s \
                           asm/snd_song755_h_btl_dragon_out_01.s \
                           asm/snd_song900_bmp_bos_nightmare1.s \
                           asm/snd_song940_btl_bgl_attack7_1.s \
                           asm/snd_song967_mon_bgl_attack7.s \
                           asm/snd_song896_mon_mao_appear1.s \
                           asm/snd_song035_agbfe3_bgm_btl_class_chg_2.s \
                           asm/snd_song617_se_bmp_map25_saint_light1.s \
                           asm/snd_banim_efxsound_data_0.s \
                           asm/snd_song034_agbfe3_bgm_btl_staff_b_1.s \
                           asm/snd_song002_agbfe3_bgm_op_theme_i_4.s \
                           asm/snd_song002_agbfe3_bgm_op_theme_i_2.s \
                           asm/snd_song753_h_btl_dragon_scream_01.s \
                           asm/snd_song038_agbfe3_bgm_evt_enemy_0.s \
                           asm/snd_song027_agbfe3_bgm_btl_boss1_0.s \
                           asm/snd_song069_agbfe3_bgm_evt_last_0.s \
                           asm/snd_song017_agbfe3_bgm_map_pl6_0.s \
                           asm/snd_song010_agbfe3_bgm_map_pl3_0.s \
                           asm/snd_song053_agbfe3_bgm_shop_0.s \
                           asm/snd_song951_mon_gog_attack1.s \
                           asm/snd_song959_btl_mon_call1.s \
                           asm/snd_song073_y_doukutu_4_p1.s \
                           asm/snd_song725_bmp_dance2.s \
                           asm/snd_song723_btl_dance2.s \
                           asm/snd_song002_agbfe3_bgm_op_theme_i_0.s \
                           asm/snd_song752_h_btl_dragon_shake_01.s \
                           asm/snd_song001_agbfe3_bgm_opening_2.s \
                           asm/snd_song290_se_btl_fimbul1_1.s \
                           asm/snd_song080_h_evt_hubuki_s.s \
                           asm/snd_song073_y_doukutu_4_p0.s \
                           asm/snd_song076_h_se_bird_p2.s \
                           asm/gap_001F70E5.s \
                           asm/gap_000D2AD0.s \
                           asm/gap_000C532C.s \
                           asm/gap_000C31D4.s \
                           asm/gap_000BD0C8.s \
                           asm/gap_000BD054.s \
                           asm/gap_000BBA3C.s \
                           asm/gap_000B46D4.s \
                           asm/gap_000B1030.s \
                           asm/gap_000B0664.s \
                           asm/gap_000AE5A4.s \
                           asm/gap_0009D634.s \
                           asm/gap_0008359C.s \
                           asm/gap_0006E79C.s \
                           asm/gap_0006E4DC.s \
                           asm/gap_000695C4.s \
                           asm/gap_0006582C.s \
                           asm/gap_00061FD8.s \
                           asm/gap_000396D8.s \
                           asm/gap_00037E00.s \
                           asm/gap_00024818.s \
                           asm/gap_00024670.s \
                           asm/gap_0001BF98.s \
                           asm/gap_0001B9B0.s \
                           asm/gap_00014818.s \
                           asm/gap_000062C0.s \
                           asm/gap_00006274.s \
                           asm/gap_00003240.s \
                           asm/gap_00003080.s \
                           asm/gfx_data_bg.s \
                           asm/frontier_df4_font_cc.s \
                           asm/frontier_df3_unitdef_b.s \
                           asm/frontier_banim_aurabg3.s \
                           asm/frontier_banim_dracozombie.s \
                           asm/frontier_df4_uistuff.s \
                           asm/frontier_df3_eventscr_ch.s \
                           asm/frontier_df4_ending.s \
                           asm/frontier_df4_banim_a.s \
                           asm/frontier_df3_banim_aura.s \
                           asm/frontier_df3_voicegroup.s \
                           asm/frontier_df3_data_5aa96c.s \
                           asm/frontier_df3_fontgrp_se.s \
                           asm/frontier_df3_banim_mid.s \
                           asm/frontier_df3_opanim_gfx.s \
                           asm/frontier_df4_voice.s \
                           asm/frontier_df3_titlescreen.s \
                           asm/frontier_df3_btl_bg.s \
                           asm/frontier_df3_ending.s \
                           asm/frontier_map_objtype.s \
                           asm/frontier_df3_const_unit_ic.s \
                           asm/frontier_df4_tail.s \
                           asm/dat_data_opanim_gfx_p0.s \
                           asm/dat_data_A01CC4_p2.s \
                           asm/dat_mine_pal.s \
                           asm/dat_worldmap_gmapunit_p724.s \
                           asm/frontier_df4_banim_b.s \
                           asm/dat_data_opanim_gfx_p25.s \
                           asm/frontier_df4_menu.s \
                           asm/frontier_df4_misc_lo.s \
                           asm/dat_data_opanim_gfx_p24.s \
                           asm/data_08909A80.s \
                           asm/dat_data_banim_p17.s \
                           asm/dat_data_banim_p0.s \
                           asm/data_08908DBC.s \
                           asm/data_08908590.s \
                           asm/dat_worldmap_gmapunit_p1573.s \
                           asm/data_0890B3B0.s \
                           asm/dat_data_99D6DC.s \
                           asm/dat_data_banim_p11.s \
                           asm/data_08A61C70.s \
                           asm/data_08A66768.s \
                           asm/data_08A63D0C.s \
                           asm/data_089084A8.s \
                           asm/data_08908CA0.s \
                           asm/data_085C6770.s \
                           asm/data_08A68360.s \
                           asm/data_08A62134.s \
                           asm/dat_worldmap_gmapunit_p723.s \
                           asm/data_08A72A80.s \
                           asm/data_08A67C08.s \
                           asm/data_08A668DC.s \
                           asm/data_08A674E0.s \
                           asm/dat_anim_mapanim_objects.s \
                           asm/dat_anim_mapanim_torchfx.s \
                           asm/dat_anim_worldmap_skirmish.s \
                           asm/dat_anim_mapanim_berserk_silence.s \
                           asm/dat_anim_arrow_trap.s \
                           asm/dat_anim_worldmap_highlight.s \
                           asm/dat_anim_mine_fx.s \
                           asm/dat_data_banim_p134.s \
                           asm/dat_anim_085A0EA0.s \
                           asm/data_08A64420.s \
                           asm/data_08A642F0.s \
                           asm/dat_data_A01CC4_2.s \
                           asm/data_08A62FA4.s \
                           asm/data_08A62D74.s \
                           asm/data_08A62AFC.s \
                           asm/data_08A607B4.s \
                           asm/data_08A67B00.s \
                           asm/data_08A64FA0.s \
                           asm/dat_particles_fx.s \
                           asm/snd_song021_agbfe3_bgm_map_cp3_3.s \
                           asm/data_08A62734.s \
                           asm/data_08A61F60.s \
                           asm/data_085C33C0.s \
                           asm/data_08A625BC.s \
                           asm/data_08A157AC.s \
                           asm/data_08A61B60.s \
                           asm/data_08A66A00.s \
                           asm/data_08A63238.s \
                           asm/dat_worldmap_gmapunit_p798.s \
                           asm/data_08A70F34.s \
                           asm/data_08A66080.s \
                           asm/data_08A63894.s \
                           asm/dat_data_banim_p19.s \
                           asm/dat_worldmap_gmapunit_p275.s \
                           asm/data_08B25710.s \
                           asm/dat_classchg_data.s \
                           asm/dat_worldmap_gmapunit_p1572.s \
                           asm/dat_TextGlyphs_System_ref.s \
                           asm/dat_TextGlyphs_Talk_ref.s \
                           asm/dat_TextGlyphs_Special_ref.s \
                           asm/dat_lut_29_ref.s \
                           asm/dat_bldyLut_10_ref.s \
                           asm/dat_worldmap_gmapunit_p5.s
ASM_OBJECTS := $(filter-out $(DATA_INCBIN_ASM_EXCLUDE:.s=.o),$(ASM_S_FILES:.s=.o)) $(GENERATED_S:.s=.o)
ALL_OBJECTS := $(C_OBJECTS) $(DATA_INCBIN_OBJECTS) $(ASM_OBJECTS)

# --- NON_MATCHING staging (D26): readable C that DOCUMENTS a region-different
# function whose byte source is still asm/<fn>.s. PROVE-BUILDS ONLY -- NEVER
# linked into $(ELF), NEVER checksummed by `make compare`. `$(wildcard src/*.c)`
# above does NOT recurse into src/nonmatching/, so the oracle excludes these for
# free; and NONMATCH_OBJECTS is deliberately kept OUT of ALL_OBJECTS so $(ELF)
# and `compare` can never see them. See docs/nonmatching.md.
NONMATCH_CFILES  := $(wildcard src/nonmatching/*.c)
NONMATCH_OBJECTS := $(NONMATCH_CFILES:.c=.o)

#### Targets ####

all: $(ROM)
	@$(SHASUM) -c checksum.sha1

# `make compare` is the build's only test: SHA-1 of the built ROM vs the original.
compare: $(ROM)
	$(SHASUM) -c checksum.sha1

# The carve glue (ldscript.txt + asm/baserom.s + asm/jp_syms.s) is GENERATED from
# the layout/ manifests and is gitignored, so the build regenerates it whenever a
# manifest changes -- the monolith <name>.tsv OR any per-task fragment under
# <name>.d/. Per-task fragments are what let many carves run in parallel without
# conflicting on these shared generated files. (Grouped target: one gen_layout
# run produces all three; needs GNU make >= 4.3.)
#
# The inputs include the per-task fragment files AND their .d directories: a
# directory's mtime changes when a fragment is added OR REMOVED, so a fragment
# DELETION (e.g. a carve revert) also triggers a regenerate -- a plain file
# wildcard cannot notice deletions. gen_layout.py writes each output only when its
# content actually changes (write_if_changed), so an unchanged rebuild stays
# incremental (no needless downstream relink).
GEN_LAYOUT_INPUTS := scripts/gen_layout.py ldscript.template.txt \
	$(wildcard layout/carved_rom.tsv    layout/carved_rom.d    layout/carved_rom.d/*.tsv) \
	$(wildcard layout/carved_ram.tsv    layout/carved_ram.d    layout/carved_ram.d/*.tsv) \
	$(wildcard layout/baseline_syms.tsv layout/baseline_syms.d layout/baseline_syms.d/*.tsv)

$(LDSCRIPT) $(GENERATED_S) &: $(GEN_LAYOUT_INPUTS)
	$(PYTHON) scripts/gen_layout.py

# `make layout` stays as a manual force-regenerate alias (e.g. for carve scripts).
layout:
	$(PYTHON) scripts/gen_layout.py

# --- JP message text (Huffman-compressed) -----------------------------------
# Regenerate src/msg_data.c from the committed bracket-annotated JP text whenever
# the text source changes. msg_jp.py build-c re-Huffman-encodes the block as
# COMPILED C (byte-identical to ROM after link). The file is committed (the src/*.c
# wildcard must see it on a fresh checkout); this rule keeps it in sync when texts/
# change. It does NOT read baserom.gba -- the block is producible from committed
# source. See docs/text.md.
TEXT_TOOLS  := scripts/texttools
MSG_JP      := $(PYTHON) $(TEXT_TOOLS)/msg_jp.py
MSG_SOURCES := texts/jp_texts.txt texts/jp_textdefs.txt texts/jp_huffman_tiebreaks.txt

src/msg_data.c: $(MSG_SOURCES) $(TEXT_TOOLS)/msg_jp.py
	$(MSG_JP) build-c

# Convenience: verify the rebuilt block is byte-identical to baserom.gba (dev only).
text-verify:
	$(MSG_JP) verify

# Build the IDA Pro reverse-engineering database (tools/ida/fe8j.i64) from the
# 32-bit ARM ELF, for the headless Hex-Rays decompiler MCP. Needs the local
# idalib venv (which has the `idapro` module). See docs/reverse-engineering.md.
# Re-run after meaningful decomp progress to refresh symbols.
IDA_PY ?= $(HOME)/ida-mcp-venv/bin/python
ida-db: $(ELF)
	$(IDA_PY) scripts/ida/build_ida_db.py

# Build the cached Ghidra project (the open-source second-opinion decompiler).
# One-time and slow; see docs/reverse-engineering.md. Needs JDK 21 + Ghidra
# (installed under ~/ghidra-tools) — paths are set in scripts/ghidra/ghidra_env.sh.
ghidra-db: $(ELF)
	scripts/ghidra/build_ghidra_project.sh

# Refresh Copilot CLI's isolated copy of the Ghidra project (fe8j -> fe8j-cp) so
# Claude and Copilot can run their `ghidra` MCP servers concurrently without
# contending on the project's exclusive lock. Run after `ghidra-db`. See
# docs/reverse-engineering.md and docs/decisions.md (D18).
ghidra-cp:
	scripts/ghidra/clone_copilot_project.sh

.PHONY: all compare clean check check-nonmatching nonmatching layout ida-db ghidra-db ghidra-cp

# NOTE: baserom.gba is NO LONGER a build input. Every ROM byte is produced from committed
# source (matching C, descriptive asm, extracted assets, committed data/*.bin). asm/baserom.s
# is generated empty (0 incbins). baserom.gba is kept ONLY as the verification reference and
# the source for one-time asset re-extraction (scripts/extract_*). `make` builds with it absent.

$(ASM_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) -g $< -o $@

#### Sound asset rules (Phase 1 Music) ####
# MINIMAL, FLAGGED addition: turn committed AIFF (.aif) sample source into the
# raw GBA direct-sound PCM blob (.bin) the ROM contains, via the vendored
# aif2pcm. baserom.gba is NEVER in this chain -- asm/direct_sound_data.s incbins
# the rebuilt .bin, so the 3.27 MB m4a sample blob reproduces byte-for-byte with
# baserom removed (the Phase-1 self-containment win). The .bin is a gitignored
# build intermediate; the .aif is the committed source of truth.
#
#   foo.aif (committed) --aif2pcm--> foo.bin --.incbin--> direct_sound_data.o --> ROM
#
# A `.aif` with no recipe stops make from trying to "rebuild" the committed source.
%.aif: ;
sound/%.bin: sound/%.aif
	$(AIF2PCM) $< $@

# asm/direct_sound_data.o incbins every sound/direct_sound_samples/*.bin, so it
# must rebuild when any sample changes. List the .bin deps explicitly (one per
# committed .aif). (find, not `wildcard sound/**`, because GNU make does not
# expand the `**` globstar.)
DIRECT_SOUND_BINS := $(patsubst %.aif,%.bin,$(shell find sound/direct_sound_samples -name '*.aif' 2>/dev/null))
asm/direct_sound_data.o: $(DIRECT_SOUND_BINS)

# Sound DATA blobs (Phase 1 self-containment, the voicegroup + song-body + m4a-table
# remainder): the region-different / table-pinned sound data (voicegroups, song
# bodies, gMPlayTable, m4a scalar tables, frontier voice gaps) is carried as
# COMMITTED, symbol-named `data/sound/*.bin` -- the same "commit a named .bin for
# opaque region-different data" model as data/banim/*.bin. baserom.gba is NOT in
# this chain: each sound `.s` `.incbin`s its own data/sound/*.bin, so with baserom
# removed the whole sound remainder still reproduces byte-for-byte. The `.bin` are
# committed SOURCE (no recipe -- make treats them as leaves); the editable-.mid /
# voice_* readability polish is deferred (see docs/sound.md, D35). Each object must
# rebuild when one of its blobs changes, so depend on the full set.
SOUND_DATA_BINS := $(wildcard data/sound/*.bin)
$(patsubst %.s,%.o,$(wildcard asm/snd_song*.s asm/snd_banim_efxsound_data_*.s \
	asm/dat_voicegroup*_ref.s asm/dat_gMPlayTable_ref.s \
	asm/dat_gMPlayJumpTableTemplate_ref.s asm/dat_gSoundRoomTable_ref.s \
	asm/frontier_df3_voicegroup.s asm/frontier_df4_voice.s \
	asm/m4a_1.s asm/stranded_m4a.s asm/stranded_soundwrapper.s \
	asm/stranded_banim-efxsound.s)): $(SOUND_DATA_BINS)

# Banim OAM / AnimSprite / motion / modes DATA (Phase 1 self-containment): the
# per-animation data blobs are COMMITTED, descriptively-named `data/banim/*.bin`
# (the JP bytes, byte-identical by construction -- region-different, mostly
# LZ-compressed opaque data; this is fireemblem8u's "commit a named .bin for
# opaque data" model). baserom.gba is NOT in this chain. Each banim data `.s`
# `.incbin`s its own data/banim/*.bin, so the object must rebuild when one
# changes. The `.bin` are committed SOURCE (no recipe -- make treats them as
# leaves), so there is no generic %.bin rule outside sound/.
BANIM_OAM_BINS := $(wildcard data/banim/*.bin)
asm/data_banim.o $(patsubst %.s,%.o,$(wildcard asm/dat_banim_ekrdragonfx_*.s asm/dat_banim_ekrskill_*.s)): $(BANIM_OAM_BINS)

# Residual DATA (Phase 1 final self-containment sweep): every remaining
# NON-SOUND `.incbin "baserom.gba"` was re-rooted onto a COMMITTED,
# descriptively-named `data/residual/<symbol>.bin` (the JP bytes, byte-identical
# by construction -- region-different game-data tables, residue blobs, opaque
# graphics, and the genuinely-foreign ARM helpers; fireemblem8u's "commit a named
# .bin for opaque data" model). baserom.gba is NOT in this chain. Each `.s` that
# `.incbin`s a data/residual/*.bin must rebuild when its .bin changes; the set of
# such objects is derived by grep at parse time (the .bin are committed leaves --
# no recipe, so no generic %.bin rule outside sound/). See
# scripts/extract_residual_data.py and docs/decomp-completion-standard.md.
RESIDUAL_BINS := $(wildcard data/residual/*.bin)
RESIDUAL_OBJS := $(patsubst %.s,%.o,$(shell grep -lr 'data/residual/' asm --include='*.s' 2>/dev/null))
$(RESIDUAL_OBJS): $(RESIDUAL_BINS)

#### Asset (graphics) rules ####
# Generic source-asset pipeline, ported from ../fireemblem8u. These turn the
# COMMITTED editable source (PNG / JASC .pal) into the raw GBA bytes the ROM
# contains, via the vendored gbagfx (scripts/tools/gbagfx/setup.sh). The build
# intermediates (*.4bpp *.8bpp *.gbapal *.lz *.rl) are gitignored and regenerated.
#
#   png (committed) --4bpp--> .4bpp --lz--> .4bpp.lz --.incbin--> object --> ROM
#
# baserom.gba is NEVER in this chain: an asset region built this way reproduces
# byte-for-byte with baserom removed (the Phase-0 self-containment goal).
#
# Bit depth is taken from the OUTPUT extension; -width is passed where a decode
# needs it (encode infers width from the PNG). LZ_FLAGS pins gbagfx's -mindist
# PER ASSET (1/2/3) so the recompressed bytes match the original FE8 compressor.
# A `.s` with no recipe and these stop make from trying to "rebuild" committed
# sources via a chain of implicit rules.
%.png: ;
%.pal: ;

%.1bpp: %.png  ; $(GBAGFX) $< $@
%.4bpp: %.png  ; $(GBAGFX) $< $@
%.8bpp: %.png  ; $(GBAGFX) $< $@
%.gbapal: %.pal ; $(PAL2GBAPAL) $< $@
%.gbapal: %.png ; $(GBAGFX) $< $@
%.lz: % ; $(GBAGFX) $< $@ $(LZ_FLAGS)
%.rl: % ; $(GBAGFX) $< $@

# .fk: FE "fake compression" -- a 4-byte LE header (total-size<<8, low byte 0 =
# uncompressed) followed by the raw bytes verbatim. Portrait tilesets (and similar
# graphics) are marked compressed in the ROM but stored raw under this header. The
# rule (matching ../fireemblem8u's `%.fk: % ; ./scripts/compressor.py $< fk`) is
# implemented inline so it needs no extra script.
%.fk: %
	$(PYTHON) -c "import sys,struct;d=open(sys.argv[1],'rb').read();open(sys.argv[2],'wb').write(struct.pack('<I',(len(d)+4)<<8)+d)" $< $@

# bin2c: emit a tiles blob as a C array header (used where a 4bpp must be a C
# `const` array rather than an incbin).
%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@

# --- PARALLEL-SAFE per-subsystem asset wiring (graphics/**/*.mk) -------------
# Per-asset -mindist pins and object->generated-asset dependencies used to live
# INLINE here, which made every graphics-extraction agent edit this one shared
# file -> merge conflicts. They now live in a TRACKED `*.mk` PER graphics
# subsystem (e.g. graphics/item_icon/item_icon.mk), auto-collected below. A new
# extraction batch adds a NEW file under its graphics/<subsystem>/ dir and never
# touches this Makefile -- so many graphics agents can run concurrently. Each
# .mk carries that subsystem's `LZ_FLAGS := -mindist N` overrides and its
# `asm/<file>.o: <generated assets>` deps. (find, not `wildcard graphics/**`,
# because GNU make does not expand the `**` globstar.)
GRAPHICS_MK := $(shell find graphics -name '*.mk' 2>/dev/null)
-include $(GRAPHICS_MK)
# src/data INCBIN objects -> their generated assets (clean-build ordering); see scripts/gen_data_incbin_deps.py
-include layout/data_incbin_deps.mk

# DATA_INCBIN: src/data/**/*.c (any subdirectory, excluding map/) compiled with
# preproc first so INCBIN_U8/INCBIN_U16/INCBIN_U32 expand into .incbin directives
# before cpp sees them.  Mirror of the US DATA_SRC_C_OBJECTS rule.  These objects
# ARE in ALL_OBJECTS and DO get linked -- they replace their asm/dat_*.s
# counterparts in the layout.  A new subsystem under src/data/<new>/ automatically
# uses this recipe; no additional Makefile edit is required.
$(DATA_INCBIN_OBJECTS): %.o: %.c
	$(PREPROC) $< | $(CPP) $(CPPFLAGS) - | iconv -f UTF-8 -t CP932 | $(CC1) $(CC1FLAGS) -o $*.s
	printf '\t.text\n\t.align 2, 0\n' >> $*.s
	$(AS) $(ASFLAGS) $*.s -o $@
	@$(PYTHON) scripts/apply_patches.py $@

# C compile pipeline (agbcc): cpp -> iconv UTF-8->CP932 -> agbcc -> as.
# NONMATCH_OBJECTS reuse this exact recipe but are NOT in $(C_OBJECTS) /
# $(ALL_OBJECTS), so they compile under `make nonmatching` yet never link.
$(C_OBJECTS) $(NONMATCH_OBJECTS): %.o: %.c
	$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CC1FLAGS) -o $*.s
	printf '\t.text\n\t.align 2, 0\n' >> $*.s
	$(AS) $(ASFLAGS) $*.s -o $@
	@$(PYTHON) scripts/apply_patches.py $@

# --- NON_MATCHING staging target (D26) ---------------------------------------
# Compile the readable staging C purely to PROVE IT BUILDS. This target is NOT a
# dependency of $(ELF) or `compare`: NONMATCH_OBJECTS are absent from ALL_OBJECTS
# and the ldscript has no `*(.text)` catch-all, so a non-matching object cannot
# enter the oracle ROM. The byte source remains the existing asm/<fn>.s.
nonmatching: $(NONMATCH_OBJECTS)
	@echo "NON_MATCHING staging: PROVE-BUILDS ONLY -- compiled, NOT linked, NOT checksummed (oracle untouched)."

# Lint: every src/nonmatching/<fn>.c must have a committed byte source asm/<fn>.s
# (a readable staging body cannot exist for a function with no oracle byte source).
check-nonmatching:
	$(PYTHON) scripts/check_nonmatching.py

$(ELF): $(ALL_OBJECTS) $(LDSCRIPT)
	$(LD) --no-check-sections -T $(LDSCRIPT) -Map $(MAP) -o $@ $(ALL_OBJECTS) -L tools/agbcc/lib -lc -lgcc

%.gba: %.elf
	$(OBJCOPY) --strip-debug -O binary --pad-to 0x9000000 --gap-fill=0xff $< $@

clean:
	# Remove EVERY .o under asm/ and src/ (recursively, incl. src/data/ and the
	# src/nonmatching/ staging objects) via `find` -- this also clears ORPHAN .o whose .s was
	# deleted by a carve (a wildcard-only clean would keep them and the local build false-greens
	# while CI's fresh checkout fails). `find` is COUNT-SAFE. Do NOT name the full object-list
	# variable here: make expands it even inside a recipe comment, and once the carve grows past
	# a few thousand objects that single expanded argument overflows the shell per-arg limit
	# (MAX_ARG_STRLEN, 128 KiB) and `make clean` dies with "Argument list too long".
	# NOTE: only *.o -- never `find -name '*.s'`: asm/*.s are the COMMITTED descriptive-asm sources.
	find asm src -name '*.o' -type f -delete
	$(RM) $(ROM) $(ELF) $(MAP) $(CFILES:.c=.s) $(DATA_INCBIN_CFILES:.c=.s) $(GENERATED_S) $(LDSCRIPT)
	$(RM) $(NONMATCH_CFILES:.c=.s)
	# Regenerated asset build intermediates (committed source is PNG/.pal; these
	# are rebuilt by the %.4bpp/%.lz/... rules). Delete ONLY gitignored ones --
	# `git clean -Xf` removes solely ignored files, so a COMMITTED asset such as
	# graphics/debug_font.4bpp.h (the hand-committed C array #included by
	# src/fontgrp.c) is preserved. A bare `find -name '*.4bpp.h' -delete` would
	# wrongly nuke it and break the build. Falls back to nothing outside a git tree.
	@git clean -Xf -- 'graphics/**/*.1bpp' 'graphics/**/*.4bpp' 'graphics/**/*.8bpp' \
		'graphics/**/*.gbapal' 'graphics/**/*.lz' 'graphics/**/*.rl' 'graphics/**/*.fk' 'graphics/**/*.4bpp.h' \
		'graphics/*.1bpp' 'graphics/*.4bpp' 'graphics/*.8bpp' 'graphics/*.gbapal' \
		'graphics/*.lz' 'graphics/*.rl' 'graphics/*.fk' 'graphics/*.4bpp.h' >/dev/null 2>&1 || true
	# Sound build intermediates (committed source is .aif; .bin rebuilt by aif2pcm).
	# Gitignored, so `git clean -Xf` removes only them and never a committed .aif.
	@git clean -Xf -- 'sound/**/*.bin' >/dev/null 2>&1 || true

# Fast repo-consistency lint (no toolchain / no ROM needed): every object the build links
# has a git-tracked source. Catches the "layout row without a committed .s/.c" class that
# builds locally (stale .o) but fails CI's fresh checkout. Also enforced in CI.
check:
	$(PYTHON) scripts/check_layout.py

# Keep chained asset intermediates (e.g. the .4bpp produced en route from PNG to
# .4bpp.lz) instead of letting make treat them as deletable intermediates and
# rebuild them on every invocation.
.SECONDARY:
