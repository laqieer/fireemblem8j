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
	# while CI's fresh checkout fails). `find` is COUNT-SAFE: never expand the full object list
	# ($(ALL_OBJECTS), thousands of paths) onto a recipe OR comment line -- once the carve grows
	# past a few thousand objects that single expanded argument overflows the shell's per-arg
	# limit (MAX_ARG_STRLEN, 128 KiB) and `make clean` dies with "Argument list too long".
	# NOTE: only *.o -- never `find -name '*.s'`: asm/*.s are the COMMITTED descriptive-asm sources.
	find asm src -name '*.o' -type f -delete
	$(RM) $(ROM) $(ELF) $(MAP) $(CFILES:.c=.s) $(GENERATED_S) $(LDSCRIPT)
	$(RM) $(NONMATCH_CFILES:.c=.s)

# Fast repo-consistency lint (no toolchain / no ROM needed): every object the build links
# has a git-tracked source. Catches the "layout row without a committed .s/.c" class that
# builds locally (stale .o) but fails CI's fresh checkout. Also enforced in CI.
check:
	$(PYTHON) scripts/check_layout.py
