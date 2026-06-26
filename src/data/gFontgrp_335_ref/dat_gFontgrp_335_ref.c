#include "global.h"

/* De-pointered from data/residual/gFontgrp_335.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df4_uistuff_003_57CC64[];

SECTION(".rodata.dat_gFontgrp_335_ref") static const u32 gFontgrp_335__shift[] = {
    (u32)&frontier_df4_uistuff_003_57CC64,
    0x000007FA,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000FF0,
    0x00003AAC,
    0x0000EBEB,
    0x00003AFF,
    0x00000FB0,
    0x0000FFAC,
    0x0000EAAB,
    0x0000FFFF,
    0x00000000,
};
__asm__(".global gFontgrp_335\n\t.set gFontgrp_335, gFontgrp_335__shift\n");
