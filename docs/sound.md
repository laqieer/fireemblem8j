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

## DONE — remaining sound classes (voicegroups + song bodies + m4a tables) now self-contained

The voicegroup, song-body, gMPlayTable, m4a-scalar-table and frontier-voice-gap
data — the entire non-sample sound remainder, **388 `.incbin "baserom.gba"`
directives across 135 `.s` files, 186,135 bytes** — is now reproduced from
**committed `data/sound/*.bin`** (one symbol-named blob per incbin), exactly the
`data/banim/*.bin` model: a committed `.bin` is the self-contained source of truth
for region-different / table-pinned opaque data. baserom.gba is no longer in the
sound build chain. `scripts/sound/reroot_sound_incbin.py` does the extraction +
`.s` rewrite; the Makefile adds one flagged dependency block
(`SOUND_DATA_BINS`). **0 sound `.incbin "baserom.gba"` remain.**

**Proven self-contained.** With `baserom.gba` removed, the re-rooted sound objects
(`snd_song*`, `dat_voicegroup*_ref`, `dat_m4a_tables`, `frontier_df3_voicegroup`,
…) all assemble from `data/sound/*.bin`; `make compare` and `make clean && make
compare` stay `OK`. Build self-containment **92.38% → 93.49%** (+1.11 pts).

**mid2agb feasibility — VERIFIED end-to-end (the D33 hypothesis, now proven).**
song001 compiled from the US `.mid` (`song001_agbfe3_bgm_opening.mid`) with the US
flags `-E -G000 -R020 -P010 -V051`, assembled (`-I include`, MPlayDef.s),
and **linked at the JP address 0x08534E80 with `voicegroup000 = 0x081F7120`**
(read live from the JP song-header `tone` pointer) is **BYTE-IDENTICAL** to the
4320-byte JP ROM span (0 differing bytes). The `R_ARM_ABS32` self-pointer
relocations against `.rodata` resolve to the correct JP-absolute pointers when the
object is placed at the JP address. So the `.mid` → mid2agb → assemble → link path
**does** reconstruct the JP song. The voicegroup-pointer in the song header is why
voicegroups must be named symbols at their JP addresses for the readable form.

**Why the readable form (mid2agb `.mid` / `voice_*` macros) is DEFERRED, not done.**
The live build uses the *parallel-carving glue* ldscript: each song is **split into
~4 named fragments at its self-pointer boundaries** and interleaved with **232
non-sound objects** (frontier_*, `data_*` residue, dat_*) tiled across the song
address region. Full mid2agb integration means **un-tiling** that region — replacing
the 97 song fragments + their residue fillers with single per-song `.o` linked at
fixed addresses — which restructures the ldscript glue and **touches non-sound files
owned by the parallel final-sweep agent** (high regression risk to the glue this
round). The committed-`.bin` re-root achieves the hard self-containment goal now,
sound-files-only and byte-neutral; the `.mid`/`voice_*` readability is the right
later polish once the song region can be un-tiled safely. See D35.

---

## Feasibility of the remaining sound classes (historical — superseded by the DONE section above)

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
- **Voicegroups / m4a tables / song bodies / frontier voice (186 KB): SELF-CONTAINED** —
  re-rooted to committed `data/sound/*.bin`, 0 baserom incbins remaining, byte-verified.
- **mid2agb song reconstruction: PROVEN feasible** (song001 byte-identical from US `.mid` linked
  at the JP address) but the readable-`.s` form is deferred — the parallel-carving glue tiles songs
  across the ldscript and un-tiling crosses into non-sound files (see D35).

The 3.12 MB samples were the single biggest self-containment lever in the whole
repo; extracting them moved build self-containment **62.39% → 81.89%**. The sound
remainder re-root moved it **92.38% → 93.49%** and brought the sound classes to
**0 `.incbin "baserom.gba"`**.
