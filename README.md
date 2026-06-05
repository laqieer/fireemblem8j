# Fire Emblem: Seima no Kouseki (聖魔の光石)

A decompilation / disassembly of **Fire Emblem: The Sacred Stones — Japanese version**
(`Fire Emblem - Seima no Kouseki`, game code `BE8J`).

It builds the following ROM:
* `fireemblem8.gba` `sha1: 7da0456035366aa18414faa79d8fe7649f03c1ed`

This is the JP counterpart of the (essentially complete) US decomp
[laqieer/fireemblem8u](https://github.com/laqieer/fireemblem8u). The two ROMs are
compiled from the same Intelligent Systems source by the same compiler, so the
bulk of the work is **re-linking the US C source against the JP ROM's data
layout** and decompiling the comparatively small set of region-specific code and
data (text, fonts, menus, save versioning).

## Status

The project starts from a **byte-perfect raw-ROM baseline**: `asm/baserom.s`
incbins the whole ROM, so `make compare` reports `OK` from day one. Progress is
measured by how much of that incbin has been replaced with real decompiled C
(`src/`) and descriptively-named data — see [`docs/strategy.md`](docs/strategy.md)
and the [project board](https://github.com/users/laqieer/projects/3).

## Building

You need the ARM toolchain (`binutils-arm-none-eabi`) and, for C decompilation,
`agbcc` installed into `tools/agbcc` (same as the US decomp).

```bash
# Place your own copy of the original ROM here:
#   ./baserom.gba   (sha1 7da0456035366aa18414faa79d8fe7649f03c1ed)
make compare       # builds fireemblem8.gba and verifies the sha1
```

Success ends with:
```
fireemblem8.gba: OK
```

## Layout

| Path             | Purpose                                                        |
|------------------|----------------------------------------------------------------|
| `baserom.gba`    | Original JP ROM (you provide; gitignored).                     |
| `asm/baserom.s`  | Raw-ROM incbin baseline; shrinks as decompilation progresses.  |
| `src/`           | Decompiled C (ported/adapted from the US decomp).              |
| `asm/`           | Hand-written / carved-out assembly and data.                   |
| `include/`       | Headers (ported from the US decomp).                           |
| `ldscript.txt`   | ROM layout; decompiled objects are placed ahead of the incbin. |
| `tools/agbcc`    | The GCC 2.95 ARM compiler (install locally; gitignored).       |
| `docs/`          | Strategy & methodology notes.                                  |

## License

Decompilation infrastructure mirrors the US decomp. Game assets/data are the
property of Nintendo / Intelligent Systems; no copyrighted ROM data is committed.
