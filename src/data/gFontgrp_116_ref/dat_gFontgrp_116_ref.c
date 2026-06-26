#include "global.h"

/* De-pointered from data/residual/gFontgrp_116.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df3_fontgrp_se_002_57FACC[];

SECTION(".rodata.dat_gFontgrp_116_ref") static const u32 gFontgrp_116__shift[] = {
    (u32)&frontier_df3_fontgrp_se_002_57FACC,
    0x00000882,
    0x00000000,
    0x00000000,
    0x00000000,
    0x000003C0,
    0x00000DB0,
    0x00003AC0,
    0x00000F00,
    0x00003EC0,
    0x0000EEF0,
    0x000399EC,
    0x0003BBEC,
    0x0003BBDB,
    0x0003BBBB,
    0x0000CECC,
    0x00000300,
    0x00000000,
};
__asm__(".global gFontgrp_116\n\t.set gFontgrp_116, gFontgrp_116__shift\n");
