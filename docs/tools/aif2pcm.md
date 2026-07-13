# aif2pcm — AIFF → raw GBA direct-sound PCM sample

[aif2pcm](https://github.com/pret/pokeemerald/tree/master/tools/aif2pcm) (pret's
m4a sample tool) converts a committed **AIFF** (`.aif`) into the raw GBA
direct-sound sample blob (`.bin`) the ROM contains: a 0x10-byte header (loop flag,
pitch tune, loop point, length) followed by signed-8-bit PCM. It is the
source-of-truth tool for FE8's **439 direct-sound samples** (the 3.12 MB
`src/data/sound_pcm/direct_sound_data.c` section).

We vendor the **US decomp's** aif2pcm (`../fireemblem8u/tools/aif2pcm`), the exact
copy FE8U byte-matches its samples with. The C is identical across pret projects;
verified: every JP sample is byte-identical to the US `aif2pcm` output for the
corresponding `.aif` (see `docs/sound.md`).

## Why it matters: baserom out of the build graph

Per `docs/decomp-completion-standard.md`, "decomp complete" means the ROM rebuilds
byte-for-byte from committed source with `baserom.gba` removed. The former
`direct_sound_data.s` was the single biggest `.incbin "baserom.gba"` blob
(~20% of self-containment). With aif2pcm it instead builds as:

```
foo.aif (committed) --aif2pcm--> foo.bin (gitignored)
    --INCBIN_U8--> src/data/sound_pcm/direct_sound_data.o --> ROM
```

baserom is never read; the region reproduces with baserom absent (proven).

## Setup

```bash
scripts/tools/aif2pcm/setup.sh        # builds tools/aif2pcm/aif2pcm from ../fireemblem8u
```

Idempotent; the binary lives in the gitignored `tools/aif2pcm/`. Only a C11
compiler + libm are needed.

## Usage

```bash
tools/aif2pcm/aif2pcm sound/direct_sound_samples/foo.aif foo.bin   # AIFF -> raw PCM
```

The Makefile drives this via `sound/%.bin: sound/%.aif`, and
`layout/data_incbin_deps.mk` wires every generated sample into
`src/data/sound_pcm/direct_sound_data.o`.
The committed `.aif` are the source of truth; the `.bin` are build intermediates
(gitignored, removed by `make clean`).

The completed one-shot asm extraction/rewrite script was removed with the
obsolete assembly mirrors. The committed AIFF files and live C provider are the
maintained source of truth.
