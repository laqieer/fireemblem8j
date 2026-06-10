# Sound (m4a / sappy) — extraction status and feasibility

The FE8 sound engine is **m4a** (a.k.a. "sappy" / `MusicPlayer`). Its data in the
JP ROM splits into four classes, in ROM order:

| Class | JP range | bytes | source representation | status |
|---|---|---|---|---|
| m4a engine tables | 0x081F6ED0.. | ~0.5 KB | C / `.s` (`gScaleTable`, …) | named incbin (`dat_m4a_tables.s`) |
| voicegroups + prog-wave + `gMPlayTable` | 0x081F7470..0x082140B4 | ~118 KB | `.s` (`voice_*` macros) | partly named incbin |
| `gSongTable` + song bodies | 0x082140B4..0x08216064 + 0x08534E80.. | ~120 KB | `gSongTable` `.s` + `.mid` via mid2agb | named incbin (`snd_song*.s`) |
| **direct-sound PCM samples** | **0x08216064..0x08534E80** | **3,272,220 (3.12 MB)** | **`.aif` via aif2pcm** | **EXTRACTED ✅** |

The reference model is the US decomp (`../fireemblem8u/sound/`), which builds all
four classes from committed source (no baserom): `.aif`+aif2pcm for samples,
`.s` for voicegroups/tables, `.mid`+mid2agb for song bodies.

---

## DONE — direct-sound PCM samples (3.12 MB) build from committed `.aif`

`asm/direct_sound_data.s` (the single biggest `.incbin "baserom.gba"` blob in the
repo, ~20% of build self-containment) is now reproduced **byte-for-byte from
committed AIFF source** via `tools/aif2pcm`, exactly as FE8U does it:

```
foo.aif (committed) --aif2pcm--> foo.bin (gitignored) --.incbin--> direct_sound_data.o --> ROM
```

**Why it is byte-exact (verified, not assumed).** Every one of FE8J's **439**
direct-sound samples is byte-identical to the US `aif2pcm` output for the
corresponding `.aif`, up to a 0–3 byte trailing zero-pad that the assembler's
`.align 2` (4-byte) reproduces. The JP sample *set* equals the US sample *set*
(content-addressed match: 439/439, including the 45 numeric-named JP samples that
map to US address-named `.aif`); the JP `.incbin` sizes merely bake in the
inter-sample alignment pad. A trailing `.align 2` after the last sample supplies
its own pad so the section is exactly 3,272,220 bytes and nothing downstream
shifts.

**Proven self-contained.** With `baserom.gba` removed, `make asm/direct_sound_data.o`
rebuilds the section and it is byte-identical to the ROM region 0x216064..0x534E80.
`make compare` and `make clean && make compare` stay `OK`.

**Tooling.** `tools/aif2pcm` is vendored via `scripts/tools/aif2pcm/setup.sh`
(built from `../fireemblem8u/tools/aif2pcm`). The Makefile rule is
`sound/%.bin: sound/%.aif ; $(AIF2PCM) $< $@`, with `asm/direct_sound_data.o`
depending on every `sound/direct_sound_samples/*.bin`. The committed `.aif` are
the source of truth; the `.bin` are gitignored build intermediates.

**Reproduce / re-extract.** `scripts/sound/extract_direct_sound_samples.py`
content-matches each JP sample to a US `.aif`, copies it under the JP symbol name,
and rewrites `asm/direct_sound_data.s`.

---

## Feasibility of the remaining sound classes

### Voicegroups + program-wave + tables (~118 KB) — TRACTABLE, region-different `.s`

Voicegroups are instrument tables built from `voice_*` macros (US
`sound/voicegroups/voicegroupNNN.s`, `asm/macros/music_voice.inc`). They are
**region-different**: a voicegroup's `voice_directsound`/`voice_keysplit` entries
embed **absolute pointers** to sample/keysplit data, which differ between US and
JP (different absolute addresses). So they cannot be byte-copied from US; they
must be emitted as `.s` with the **JP** pointer values (the macro arguments are
the same instrument params, only the embedded addresses differ).

Path to source: port `asm/macros/music_voice.inc`, then for each voicegroup write
a `voicegroupNNN.s` whose `voice_*` macro args reproduce the JP bytes (the macro
expansions are deterministic; verify with `make compare`). This is mechanical but
per-voicegroup work (~93 voicegroups, ~118 KB). It is a real naming + structure
win but **not** a large self-containment number. Currently 32/93 are carved as
named incbin (`dat_voicegroupNNN_ref.s`); the rest are still in `asm/baserom.s`.

### Song bodies (`snd_song*.s`, ~56 KB carved) — HARD: mid2agb + relocation

Each song is m4a bytecode compiled by `mid2agb` from a `.mid` with **exact
per-song flags** `-E -G<voicegroup> -R020 -P010 -V<volume>` (the full table is in
FE8U's `songs.mk`; e.g. song001 = `-E -G000 -R020 -P010 -V051`). Reproducing the
ROM song bytes from source has **two** requirements, and the second is the hard one:

1. **A byte-matching `.mid`.** mid2agb's output bitstream is sensitive to the
   MIDI's exact event timing, ordering, and meta-events. FE8U ships the original
   `.mid` (e.g. `sound/songs/midi/song001_agbfe3_bgm_opening.mid`); a *matching*
   JP build would reuse it (FE8 JP/US share the same songs).
2. **Link-time relocation to the JP song address.** A song body contains internal
   **absolute pointers** to its own track data. Verified on song001: the US
   pre-link `.o` stores them as offsets (`0x00000303`) with relocations, which the
   linker resolves to JP-absolute pointers (`0x08535183` at JP 0x08534E80) — and
   indeed the JP ROM bytes match the US `.mid` structure **except** at exactly
   these 4-byte pointer slots (delta `0xF7ACB180` = the JP↔US base shift). So the
   `.mid`+mid2agb pipeline DOES reproduce the JP song **iff** the assembled object
   is linked at the JP song address so its self-pointers resolve correctly.

**Feasibility verdict:** reproducible in principle (US `.mid` + US flags +
assemble + link at the JP address), but it requires wiring the m4a song-object
build (assemble the mid2agb `.s` with `MPlayDef.s`/`asm/macros/m4a.inc`, then let
the existing layout linker place it at the JP address so relocations resolve) and
verifying byte-exactness per song. Today the songs are correctly represented as
named incbin with their JP-absolute pointers already baked in (so they *do*
byte-match), but they are **not yet reconstructed from `.mid`**. This is the right
**next** sound front after the voicegroups; it is genuinely harder than the
samples because of the relocation wiring, not because of any mid2agb mismatch.

`tools/mid2agb` is vendored (`scripts/tools/mid2agb/setup.sh`) so this work can
start; the per-song flags live in FE8U's `songs.mk`.

### `gSongTable` (~3 KB) — TRACTABLE `.s`

`gSongTable` is an array of `song <label>, <player>, <unk>` entries (macro
`song` in `asm/macros/m4a.inc`). Region-different (each entry's `.4byte \label`
is an absolute pointer to a JP song body). Portable as `song_table.s` once the
song labels exist at their JP addresses (depends on the song-body wiring above).

---

## Summary

- **Samples (3.12 MB, the bulk): DONE** — committed `.aif` + aif2pcm, self-contained, byte-verified.
- **Voicegroups/tables (~118 KB): tractable** region-different `.s` (JP pointer values), mechanical per-voicegroup.
- **Song bodies + gSongTable (~120 KB): hard but feasible** — `.mid`+mid2agb is the right tool and reproduces the structure; the work is the link-time relocation wiring so song self-pointers resolve at the JP address.

The 3.12 MB samples were the single biggest self-containment lever in the whole
repo; extracting them moved build self-containment **62.39% → 81.89%**.
