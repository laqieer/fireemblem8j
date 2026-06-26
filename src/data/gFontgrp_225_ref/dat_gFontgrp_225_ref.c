#include "global.h"

/* De-pointered from data/residual/gFontgrp_225.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df4_uistuff_020_59BFE4[];

SECTION(".rodata.dat_gFontgrp_225_ref") static const u32 gFontgrp_225__shift[] = {
    (u32)&frontier_df4_uistuff_020_59BFE4,
    0x00000782,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000B0B,
    0x00000B0B,
    0x00000B8B,
    0x000002EC,
    0x000002EC,
    0x000002EC,
    0x000000B0,
    0x000000B0,
    0x00000000,
};
__asm__(".global gFontgrp_225\n\t.set gFontgrp_225, gFontgrp_225__shift\n");
