#include "global.h"

/* De-pointered from data/residual/gFontgrp_346.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_348[];

SECTION(".rodata.dat_gFontgrp_346_ref") static const u32 gFontgrp_346__shift[] = {
    (u32)&gFontgrp_348,
    0x00000881,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x000000F0,
    0x0000C3AC,
    0x0003BEFB,
    0x0000EB0C,
    0x00003C00,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global gFontgrp_346\n\t.set gFontgrp_346, gFontgrp_346__shift\n");
