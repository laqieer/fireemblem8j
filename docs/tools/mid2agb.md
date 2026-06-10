# mid2agb — Standard MIDI (`.mid`) → m4a/sappy song bytecode (`.s`)

[mid2agb](https://github.com/pret/pokeemerald/tree/master/tools/mid2agb) (pret's
m4a song compiler) compiles a Standard MIDI File into the m4a/sappy song
bytecode (`.s`) the ROM contains. We vendor the **US decomp's** copy
(`../fireemblem8u/tools/mid2agb`).

## Per-song flags (critical)

Each FE8 song is built with EXACT flags
`-E -G<voicegroup> -R020 -P010 -V<volume>`. The full per-song table is FE8U's
`songs.mk` (one rule per song). Examples:

```
song001_agbfe3_bgm_opening   -E -G000 -R020 -P010 -V051
song002_agbfe3_bgm_op_theme_i -E -G001 -R020 -P010 -V050
song003_agbfe3_bgm_pro_first -E -G002 -R020 -P010 -V056
```

`-E` = exact gate-time; `-G` = voicegroup index; `-R` = reverb; `-P` = priority;
`-V` = master volume. These are sensitive: a wrong `-V/-R/-P/-G` changes the
emitted bytes.

## Setup

```bash
scripts/tools/mid2agb/setup.sh        # builds tools/mid2agb/mid2agb from ../fireemblem8u
```

Idempotent; binary in the gitignored `tools/mid2agb/`. Needs only a C++11 compiler.

## Usage

```bash
tools/mid2agb/mid2agb song001.mid song001.s -E -G000 -R020 -P010 -V051
```

## Feasibility for FE8J (see docs/sound.md)

Reproducing the JP ROM song bytes from `.mid` is **feasible but hard**, for two
reasons:

1. **Byte-matching `.mid`.** mid2agb output depends on exact MIDI event
   timing/ordering. FE8U ships the original `.mid` (JP and US share the same
   songs), so this input exists.
2. **Link-time relocation.** A song body embeds **absolute pointers** to its own
   track data. The mid2agb `.s` produces a relocatable object; the linker must
   place it at the **JP song address** so those self-pointers resolve to
   JP-absolute values. Verified on song001: the JP ROM matches the US `.mid`
   structure except at exactly the 4-byte pointer slots (delta = the JP↔US base
   shift). So `.mid`+mid2agb reproduces the JP song **iff** linked at the JP
   address.

This is the right **next** sound front (after voicegroups); the song bodies are
currently correct named-incbin (`asm/snd_song*.s`) with JP pointers baked in.
mid2agb is vendored so the work can start.
