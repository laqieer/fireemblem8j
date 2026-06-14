#### Fire Emblem: Seima no Kouseki (FE8 JP) decompilation ####
#
# Bootstrap build: reproduces the original JP ROM byte-for-byte from a raw-ROM
# incbin baseline (asm/baserom.s), then progressively replaces incbin ranges
# with decompiled C (src/) and descriptively-named asm/data. Mirrors the
# toolchain of the sibling US decomp (../fireemblem8u).
#
# Requires a local copy of the original ROM at ./baserom.gba
#   sha1: 7da0456035366aa18414faa79d8fe7649f03c1ed   (Fire Emblem - Seima no Kouseki (J))

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
                           asm/dat_UnitDef_Ch16BEnemy_2_ref.s
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
	$(LD) --no-check-sections -T $(LDSCRIPT) -Map $(MAP) -o $@ $(ALL_OBJECTS)

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
