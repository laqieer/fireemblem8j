#include "global.h"

/* De-pointered from data/residual/gFontgrp_22.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0857DBDC[];

SECTION(".rodata.dat_gFontgrp_22_ref") static const u32 gFontgrp_22__shift[] = {
    (u32)&data_0857DBDC,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000FF0,
    0x00003AAC,
    0x00000FF0,
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
__asm__(".global gFontgrp_22\n\t.set gFontgrp_22, gFontgrp_22__shift\n");
