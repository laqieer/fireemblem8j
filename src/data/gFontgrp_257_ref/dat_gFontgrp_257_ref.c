#include "global.h"

/* De-pointered from data/residual/gFontgrp_257.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df4_uistuff_014_598E64[];

SECTION(".rodata.dat_gFontgrp_257_ref") static const u32 gFontgrp_257__shift[] = {
    (u32)&frontier_df4_uistuff_014_598E64,
    0x00000982,
    0x00000000,
    0x00000000,
    0x0000000B,
    0x00002E0B,
    0x00002ECB,
    0x00000ACB,
    0x0000008B,
    0x0000000B,
    0x0000000B,
    0x0000000B,
    0x0000B00B,
    0x0000B00B,
    0x00002C0B,
    0x00002E0B,
    0x00000BAE,
    0x000002F8,
};
__asm__(".global gFontgrp_257\n\t.set gFontgrp_257, gFontgrp_257__shift\n");
