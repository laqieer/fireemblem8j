# scaninc — include-dependency scanner for the battle-animation pipeline

[scaninc](https://github.com/pret/pokeemerald/tree/master/tools/scaninc) (pret's
GBA-decomp source scanner) reads a `.s`/`.c` file and prints every file it pulls
in via `.include` / `#include`. The build uses that list as extra Make
prerequisites, so editing a shared header rebuilds every object that includes it.

We vendor it like the other asset tools: the built binary lives in the gitignored
`tools/scaninc/`, and only `scripts/tools/scaninc/setup.sh` + this doc are tracked.
`setup.sh` builds it from pret's C++ source (identical across pret projects),
preferring the sibling US decomp's copy and falling back to upstream
`pret/pokeemerald`.

## Where it is used: the BA1 battle-animation compressing-linker pipeline

The battle-animation data blob `banim/data_banim.o` (placed at the JP banim base
`0x08C02000`) is built by `scripts/arm_compressing_linker.py` from editable
sources:

- `graphics/banim/*.png` + `*.agbpal` — the sprite sheets and palettes
  (gbagfx → `.4bpp.lz` / `.agbpal.lz`).
- `banim/*_motion.s` — one per animation, holding the OAM frame tables
  (`.data.oam_l` / `.data.oam_r`), the animation **script** (`.data.script`,
  opcodes that reference sheet symbols), and the mode offsets (`.data.modes`).
  Each `.s` `.include`s `include/banim_sheet.inc`, `include/banim_code.inc`, and
  `include/banim_code_frame.inc`.

The Makefile assembles each motion `.s` with:

```make
banim/%.o: banim_dep = $(shell $(SCANINC) -I include -I "" $*.s)
banim/%.o: banim/%.s $$(banim_dep)
	$(AS) $(ASFLAGS) -g $< -o $@
```

`scaninc` is what makes `banim_dep` resolve to the three `banim_*.inc`, so an edit
to a macro (e.g. a new `banim_code_*` opcode) correctly rebuilds the motion
objects and re-runs the compressing linker. `make NODEP=1` skips the scan (the
same convention the sound/asm rules use).

## Usage

```bash
scripts/tools/scaninc/setup.sh                              # build the tool
tools/scaninc/scaninc -I include -I "" banim/banim_lorm_sp1_motion.s
#   include/../include/banim_code.inc
#   include/../include/banim_code_frame.inc
#   include/../include/banim_sheet.inc
```

`make compare` (sha1 of the built ROM) remains the only byte oracle; scaninc only
affects incremental-rebuild correctness, never the produced bytes.
