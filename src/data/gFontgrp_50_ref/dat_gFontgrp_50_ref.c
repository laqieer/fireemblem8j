#include "global.h"

/* De-pointered from data/residual/gFontgrp_50.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df4_uistuff_004_57CF7C[];

SECTION(".rodata.dat_gFontgrp_50_ref") static const u32 gFontgrp_50__shift[] = {
    (u32)&frontier_df4_uistuff_004_57CF7C,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000C00,
    0x00003B00,
    0x00003B00,
    0x00003B3C,
    0x00003BEC,
    0x00003BB0,
    0x00000EC0,
    0x00003AC0,
    0x0000EEC0,
    0x0000F3BC,
    0x000000EB,
    0x0000003C,
    0x00000000,
};
__asm__(".global gFontgrp_50\n\t.set gFontgrp_50, gFontgrp_50__shift\n");
