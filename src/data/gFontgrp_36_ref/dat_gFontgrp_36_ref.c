#include "global.h"

/* De-pointered from data/residual/gFontgrp_36.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df4_uistuff_005_57DFCC[];

SECTION(".rodata.dat_gFontgrp_36_ref") static const u32 gFontgrp_36__shift[] = {
    (u32)&frontier_df4_uistuff_005_57DFCC,
    0x00000883,
    0x00000000,
    0x00000000,
    0x0000FC00,
    0x0003670C,
    0x0003BB3B,
    0x0003673B,
    0x0000FF3B,
    0x00003AFB,
    0x00000FAB,
    0x000000FB,
    0x0000003B,
    0x0000003B,
    0x00000FFB,
    0x00003AAC,
    0x00000FF0,
    0x00000000,
};
__asm__(".global gFontgrp_36\n\t.set gFontgrp_36, gFontgrp_36__shift\n");
