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

CFILES      := $(wildcard src/*.c) $(wildcard src/data/*.c)
# asm/baserom.s + asm/jp_syms.s are GENERATED from the layout/ manifests by
# scripts/gen_layout.py (gitignored, regenerated at build time). Manage them
# explicitly rather than via the wildcard, which would miss them on a fresh
# checkout (they don't exist until the first build regenerates them).
GENERATED_S := asm/baserom.s asm/jp_syms.s
# asm/msg_data.s is GENERATED from the committed JP text source (texts/jp_texts.txt
# + textdefs + huffman tiebreaks) by scripts/texttools/msg_jp.py, re-encoding the
# Huffman-compressed message block byte-identically. Gitignored + regenerated like
# the layout-generated .s, so a fresh checkout rebuilds it from source (NO baserom
# dependency). See docs/text.md.
TEXT_GENERATED_S := asm/msg_data.s
ASM_S_FILES := $(filter-out $(GENERATED_S) $(TEXT_GENERATED_S),$(wildcard asm/*.s))
C_OBJECTS   := $(CFILES:.c=.o)
ASM_OBJECTS := $(ASM_S_FILES:.s=.o) $(GENERATED_S:.s=.o) $(TEXT_GENERATED_S:.s=.o)
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
# Regenerate asm/msg_data.s from the committed bracket-annotated JP text whenever
# the text source changes. msg_jp.py re-Huffman-encodes byte-identically to the
# original block (see docs/text.md). This rule does NOT read baserom.gba, so the
# message block becomes producible from committed source.
TEXT_TOOLS  := scripts/texttools
MSG_JP      := $(PYTHON) $(TEXT_TOOLS)/msg_jp.py
MSG_SOURCES := texts/jp_texts.txt texts/jp_textdefs.txt texts/jp_huffman_tiebreaks.txt

asm/msg_data.s: $(MSG_SOURCES) $(TEXT_TOOLS)/msg_jp.py
	$(MSG_JP) build

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
	asm/dat_voicegroup*_ref.s asm/dat_m4a_tables.s asm/dat_gMPlayTable_ref.s \
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
	$(RM) $(ROM) $(ELF) $(MAP) $(CFILES:.c=.s) $(GENERATED_S) $(TEXT_GENERATED_S) $(LDSCRIPT)
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
