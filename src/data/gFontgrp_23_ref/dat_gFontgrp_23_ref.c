#include "global.h"

/* De-pointered from data/residual/gFontgrp_23.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_353[];

SECTION(".rodata.dat_gFontgrp_23_ref") static const u32 gFontgrp_23__shift[] = {
    (u32)&gFontgrp_353,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00003300,
    0x0000EEF0,
    0x0000EEAC,
    0x000033F0,
    0x00003FFC,
    0x0000EAAB,
    0x00003EFC,
    0x00000EC0,
    0x00000EC0,
    0x00000E70,
    0x000003B0,
    0x000000EC,
    0x00000030,
    0x00000000,
};
__asm__(".global gFontgrp_23\n\t.set gFontgrp_23, gFontgrp_23__shift\n");
