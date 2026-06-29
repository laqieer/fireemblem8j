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

The entire sound remainder — voicegroups, song bodies, gMPlayTable, m4a scalar
tables, frontier voice gaps, gSoundRoomTable, AND the m4a-engine / sound-wrapper
CODE TUs (`m4a_1`, `stranded_m4a`, `stranded_soundwrapper`,
`stranded_banim-efxsound`), **449 `.incbin "baserom.gba"` directives across 140
`.s` files, 192,255 bytes** — is now reproduced from **committed `data/sound/*.bin`**
(one symbol-named blob per incbin), exactly the `data/banim/*.bin` model: a
committed `.bin` is the self-contained source of truth for region-different /
table-pinned opaque data (and region-same-shifted code, descriptively carried).
baserom.gba is no longer in the sound build chain.
`scripts/sound/reroot_sound_incbin.py` does the extraction + `.s` rewrite; the
Makefile adds one flagged dependency block (`SOUND_DATA_BINS`). **0 sound
`.incbin "baserom.gba"` remain.**

**Proven self-contained.** With `baserom.gba` removed, every re-rooted sound object
(`snd_song*`, `dat_voicegroup*_ref`, `dat_m4a_tables`, `frontier_df3_voicegroup`,
`m4a_1`, `stranded_m4a`, …) assembles from `data/sound/*.bin`; `make compare` and
`make clean && make compare` stay `OK`. Build self-containment **92.38% → 93.53%**
(+1.15 pts). (The m4a-engine code TUs are region-same-shifted Thumb; re-rooting
gives self-containment now, the C decompilation is later readability polish.)

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

**D311 — editable `.mid` song form: PROTOTYPE byte-exact (song001 + song002).**
The readable mid2agb form is now wired and proven for the first two songs. Each is
built from the committed FE8 `.mid` (`sound/songs/midi/songNNN_*.mid`) by a per-song
`%.s: %.mid` rule in `sound/songs.mk` (the exact FE8 flags `-E -G<vg> -R020 -P010
-V<vol>`), assembled with `MPlayDef.s` (`-I include`), and linked at the JP song
address. With the voicegroup symbol bound to its JP address (read live from the
song-header tone pointer; `voicegroup000=0x081F7120`, `voicegroup001=0x081F7720` in
`layout/baseline_syms.d/d311-music.tsv`) the song body's `R_ARM_ABS32` self-pointer
relocations resolve to the JP-absolute values, and the output is **byte-identical to
the JP ROM** (song001 = 4320 B at 0x08534E80, song002 = 6124 B at 0x08535F60;
`make clean && make compare` → `OK`, twice).

*The un-tiling / residue-recarving mechanism (now established).* A song's true ROM
span is `[song_start, song_start + sizeof(mid2agb output))`. Every object whose bytes
fall in that span is the song's OWN internal bytes mislabeled — the `snd_songNNN_*`
fragments, the `data_<addr>` residue objects (these carry the song's track-pointer
`.4byte data_<addr>` self-relocations), `frontier_df4_font_cc.gapK` sections, and
even a `dat_worldmap_gmapunit_pNN` single-symbol object. To un-tile a song:
1. Replace all of the song's fragment + residue + gap manifest rows with ONE row
   `sound/songs/midi/songNNN_*.o(.rodata)` spanning `[song_start, song_end)`.
2. DELETE the now-redundant fragment `src/data/snd_songNNN_*/` dirs and the
   fully-consumed standalone residue objects (`src/data/data_<addr>/`, the misnamed
   `dat_worldmap_gmapunit_pNN`) — their `.o` is gitignored but the `.c` is committed;
   leaving the `.c` re-links the bytes at the 0x09000000 catch-all and overflows ROM.
3. A `frontier_df4_font_cc.gapK` that **straddles** the song boundary must be SPLIT:
   shrink its manifest start to `song_end`, and regenerate its `.bin` to drop the
   leading song bytes (e.g. song002's tail consumed the first 0x112 B of gap6, so
   gap6 became `0x53774C..0x537960`, a fresh 0x214-B `.bin`).
`scripts/gen_layout.py` auto-fills any uncovered address with a baserom incbin, so
the single song row leaves NO gap and the region stays self-contained.

*Scalability — all 70 currently-fragmented JP songs are clean to un-tile.* A scan of
the manifest shows every fragmented song's `[min_frag, max_frag]` span contains ONLY
its own song + fontcc/residue/worldmap objects (zero genuinely-foreign objects
interleaved), so the mechanism generalises. The generator (next phase) reads the
per-song flags from `../fireemblem8u/songs.mk`, reads each song's voicegroup address
from the JP song-header tone pointer in `baserom.gba`, runs mid2agb, computes the
true span from the output size, and emits the manifest/residue edits above. Remaining
scale-up: the 61 not-yet-named voicegroups (`voicegroupNNN.s` with JP sample
pointers), `gSongTable` (`song_table.s`), and the songs still in raw baserom incbin.

**Historical note (superseded by D311 above).** Before D311 the songs were carried as
committed `.bin` fragments tiled across the parallel-carving ldscript; full mid2agb
integration was deferred because un-tiling was thought to touch non-sound glue. The
prototype shows the edits are confined to the song's own fragment/residue objects
plus a single boundary-gap split — sound-region-local and byte-neutral. See D35, D311.

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
