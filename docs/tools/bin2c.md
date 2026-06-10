# bin2c — binary blob → C array header

[bin2c](https://github.com/pret/pokeemerald/tree/master/tools/bin2c) (pret's,
originally YamaArashi's) turns a binary file into a C array initializer / `.h`.
A tiny dependency-free C11 program.

## Why we vendor it (Phase 0, supporting)

In the asset pipeline bin2c backs the `%.4bpp.h: %.4bpp` rule: where a tiles
blob must appear as a C `const` array rather than a raw `.incbin` (e.g.
`src/fontgrp.c` `#include "graphics/debug_font.4bpp.h"`), bin2c is what generates
that header from the `.4bpp`. It is lower priority than gbagfx (which produces
the tiles in the first place), so it is vendored second.

## Setup

```bash
scripts/tools/bin2c/setup.sh
```

Idempotent. Stages `bin2c.c` from `../fireemblem8u/tools/bin2c` (override with
`FE8U=/path`; falls back to pret upstream), builds with `gcc -O2`, and smoke-tests
that 4 input bytes round-trip into the emitted array. The binary lands in the
**gitignored** `tools/bin2c/bin2c`; the setup script + this doc are tracked.

## Usage

```bash
tools/bin2c/bin2c INPUT_FILE VAR_NAME [OPTIONS...] > out.h
```

bin2c emits lowercase hex with a `u` suffix (`0xdeu`). The Makefile drives it via:

```make
%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@
```

Note: `graphics/debug_font.4bpp.h` is **committed** (not regenerated on a normal
build), so `make clean` preserves it (it deletes only gitignored intermediates).
