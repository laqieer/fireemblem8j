#### Fire Emblem: Seima no Kouseki (FE8 JP) decompilation ####
#
# Bootstrap build: reproduces the original JP ROM byte-for-byte from a raw-ROM
# incbin baseline (asm/baserom.s), then progressively replaces incbin ranges
# with decompiled C (src/) and descriptively-named asm/data. Mirrors the
# toolchain of the sibling US decomp (../fireemblem8u).
#
# Requires a local copy of the original ROM at ./baserom.gba
#   sha1: 7da0456035366aa18414faa79d8fe7649f03c1ed   (Fire Emblem - Seima no Kouseki (J))

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

CFILES      := $(wildcard src/*.c)
# asm/baserom.s + asm/jp_syms.s are GENERATED from the layout/ manifests by
# scripts/gen_layout.py (gitignored, regenerated at build time). Manage them
# explicitly rather than via the wildcard, which would miss them on a fresh
# checkout (they don't exist until the first build regenerates them).
GENERATED_S := asm/baserom.s asm/jp_syms.s
ASM_S_FILES := $(filter-out $(GENERATED_S),$(wildcard asm/*.s))
C_OBJECTS   := $(CFILES:.c=.o)
ASM_OBJECTS := $(ASM_S_FILES:.s=.o) $(GENERATED_S:.s=.o)
ALL_OBJECTS := $(C_OBJECTS) $(ASM_OBJECTS)

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
GEN_LAYOUT_INPUTS := scripts/gen_layout.py ldscript.template.txt baserom.gba \
	$(wildcard layout/carved_rom.tsv    layout/carved_rom.d    layout/carved_rom.d/*.tsv) \
	$(wildcard layout/carved_ram.tsv    layout/carved_ram.d    layout/carved_ram.d/*.tsv) \
	$(wildcard layout/baseline_syms.tsv layout/baseline_syms.d layout/baseline_syms.d/*.tsv)

$(LDSCRIPT) $(GENERATED_S) &: $(GEN_LAYOUT_INPUTS)
	$(PYTHON) scripts/gen_layout.py

# `make layout` stays as a manual force-regenerate alias (e.g. for carve scripts).
layout:
	$(PYTHON) scripts/gen_layout.py

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

asm/baserom.o: baserom.gba

$(ASM_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) -g $< -o $@

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

# bin2c: emit a tiles blob as a C array header (used where a 4bpp must be a C
# `const` array rather than an incbin).
%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@

# --- PILOT asset (Phase 0) ---------------------------------------------------
# Img_MenuScrollBar (the menu scroll-bar UI graphic, 16x64, 4bpp) is the FIRST
# FE8J region whose ROM bytes are reproduced from a REBUILT committed source asset
# (graphics/misc/Img_MenuScrollBar.png) instead of `.incbin "baserom.gba"`. It was
# LZ-compressed in the original ROM with gbagfx's default minimum match distance
# of 2 (verified by decompress->recompress->diff against the ROM blob at
# 0x00A9645C). Pin it so the rebuilt .4bpp.lz is byte-identical to the original.
graphics/misc/Img_MenuScrollBar.4bpp.lz: LZ_FLAGS := -mindist 2

# asm/dat_worldmap_gmapunit_p1598.o now .incbins the REBUILT
# graphics/misc/Img_MenuScrollBar.4bpp.lz (not baserom), so it must be regenerated
# from the committed PNG before the asm is assembled. (The generic $(ASM_OBJECTS)
# rule has no way to know about an .incbin'd generated file, so state it here.)
asm/dat_worldmap_gmapunit_p1598.o: graphics/misc/Img_MenuScrollBar.4bpp.lz

# --- Item icon sheet (Phase 1) -----------------------------------------------
# asm/dat_data_item_icon.s .incbins 224 REBUILT graphics/item_icon/*.4bpp (each
# re-encoded from a committed PNG via the generic %.4bpp:%.png rule) plus the
# committed item_icon_palette.agbpal binary. Region-SAME with US, uncompressed 4bpp
# (no -mindist needed). The .4bpp must be regenerated from the PNGs before the asm
# is assembled, so derive the dep list from the committed PNGs. (Ported by
# scripts/extract_graphics.py; see docs/tools/gbagfx.md.)
ITEM_ICON_4BPP := $(patsubst %.png,%.4bpp,$(wildcard graphics/item_icon/*.png))
asm/dat_data_item_icon.o: $(ITEM_ICON_4BPP)

# --- Unit-icon WAIT map-sprite sheets (Phase 1) ------------------------------
# asm/dat_const_data_unit_icon_wait.s .incbins 107 REBUILT
# graphics/unit_icon/wait/*.4bpp.lz map-sprite sheets (each PNG -> 4bpp -> LZ77 via
# the generic %.4bpp:%.png and %.lz:% rules). Region-SAME with US (JP 0x081a71e0 ==
# US 0x081b7828). These are LZ-COMPRESSED, so -mindist must byte-match the original
# FE8 compressor PER ASSET: 95 sheets use gbagfx's default (mindist 2); the 12 below
# need mindist 1 (discovered by scripts/extract_graphics.py's 1/2/3 sweep). Ported
# by scripts/extract_graphics.py; see docs/tools/gbagfx.md.
UNIT_ICON_WAIT_LZ := $(patsubst %.png,%.4bpp.lz,$(wildcard graphics/unit_icon/wait/*.png))
asm/dat_const_data_unit_icon_wait.o: $(UNIT_ICON_WAIT_LZ)

graphics/unit_icon/wait/unit_icon_wait_Archer_sheet.4bpp.lz:      LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Archer_F_sheet.4bpp.lz:    LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Sage_sheet.4bpp.lz:        LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Pirate_sheet.4bpp.lz:      LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Monk_sheet.4bpp.lz:        LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Necromancer_sheet.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Bonewalker_sheet.4bpp.lz:  LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Wight_sheet.4bpp.lz:       LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Wight_Bow_sheet.4bpp.lz:   LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Peer_sheet.4bpp.lz:        LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Prince_sheet.4bpp.lz:      LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Unk77_sheet.4bpp.lz:       LZ_FLAGS := -mindist 1

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
	$(RM) $(ROM) $(ELF) $(MAP) $(CFILES:.c=.s) $(GENERATED_S) $(LDSCRIPT)
	$(RM) $(NONMATCH_CFILES:.c=.s)
	# Regenerated asset build intermediates (committed source is PNG/.pal; these
	# are rebuilt by the %.4bpp/%.lz/... rules). Delete ONLY gitignored ones --
	# `git clean -Xf` removes solely ignored files, so a COMMITTED asset such as
	# graphics/debug_font.4bpp.h (the hand-committed C array #included by
	# src/fontgrp.c) is preserved. A bare `find -name '*.4bpp.h' -delete` would
	# wrongly nuke it and break the build. Falls back to nothing outside a git tree.
	@git clean -Xf -- 'graphics/**/*.1bpp' 'graphics/**/*.4bpp' 'graphics/**/*.8bpp' \
		'graphics/**/*.gbapal' 'graphics/**/*.lz' 'graphics/**/*.rl' 'graphics/**/*.4bpp.h' \
		'graphics/*.1bpp' 'graphics/*.4bpp' 'graphics/*.8bpp' 'graphics/*.gbapal' \
		'graphics/*.lz' 'graphics/*.rl' 'graphics/*.4bpp.h' >/dev/null 2>&1 || true

# Fast repo-consistency lint (no toolchain / no ROM needed): every object the build links
# has a git-tracked source. Catches the "layout row without a committed .s/.c" class that
# builds locally (stale .o) but fails CI's fresh checkout. Also enforced in CI.
check:
	$(PYTHON) scripts/check_layout.py

# Keep chained asset intermediates (e.g. the .4bpp produced en route from PNG to
# .4bpp.lz) instead of letting make treat them as deletable intermediates and
# rebuild them on every invocation.
.SECONDARY:
