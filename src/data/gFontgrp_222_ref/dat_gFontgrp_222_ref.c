#include "global.h"

/* De-pointered from data/residual/gFontgrp_222.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_085985AC[];

SECTION(".rodata.dat_gFontgrp_222_ref") static const u32 gFontgrp_222__shift[] = {
    (u32)&data_085985AC,
    0x00000983,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0000000B,
    0x0000002E,
    0x0000B0B8,
    0x0000B0A0,
    0x0000B800,
    0x00002C00,
    0x00002E00,
    0x00000B00,
    0x00000B80,
    0x000002E0,
    0x000000BA,
    0x0000002F,
};
__asm__(".global gFontgrp_222\n\t.set gFontgrp_222, gFontgrp_222__shift\n");
