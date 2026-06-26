#include "global.h"

/* De-pointered from data/residual/gFontgrp_17.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_346[];

SECTION(".rodata.dat_gFontgrp_17_ref") static const u32 gFontgrp_17__shift[] = {
    (u32)&gFontgrp_346,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000F00,
    0x000039F0,
    0x00000EAC,
    0x00000EF0,
    0x00003EFC,
    0x0000EAAB,
    0x00003EFC,
    0x00000EC0,
    0x00000E70,
    0x000003B0,
    0x000000EC,
    0x0000003C,
    0x00000000,
};
__asm__(".global gFontgrp_17\n\t.set gFontgrp_17, gFontgrp_17__shift\n");
