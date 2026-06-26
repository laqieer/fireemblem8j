#include "global.h"

/* De-pointered from data/residual/gFontgrp_340.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_355[];

SECTION(".rodata.dat_gFontgrp_340_ref") static const u32 gFontgrp_340__shift[] = {
    (u32)&gFontgrp_355,
    0x000007FA,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00003FFF,
    0x0000EAAB,
    0x0000EBEB,
    0x00003AFF,
    0x00000EB0,
    0x00000EB0,
    0x00000EB0,
    0x00000FF0,
    0x00000000,
};
__asm__(".global gFontgrp_340\n\t.set gFontgrp_340, gFontgrp_340__shift\n");
