#include "global.h"

/* De-pointered from data/residual/gFontgrp_218.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0859848C[];

SECTION(".rodata.dat_gFontgrp_218_ref") static const u32 gFontgrp_218__shift[] = {
    (u32)&data_0859848C,
    0x00000983,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0000BFFF,
    0x0000BAAB,
    0x0000B00B,
    0x0000B00B,
    0x0000B00B,
    0x0000B000,
    0x0000B800,
    0x00002C00,
    0x00000E00,
    0x00000B80,
    0x000002E0,
    0x000000B0,
};
__asm__(".global gFontgrp_218\n\t.set gFontgrp_218, gFontgrp_218__shift\n");
