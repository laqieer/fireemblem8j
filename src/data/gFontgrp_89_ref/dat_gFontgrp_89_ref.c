#include "global.h"

/* De-pointered from data/residual/gFontgrp_89.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_361[];

SECTION(".rodata.dat_gFontgrp_89_ref") static const u32 gFontgrp_89__shift[] = {
    (u32)&gFontgrp_361,
    0x00000882,
    0x00000000,
    0x00000000,
    0x00000000,
    0x000000C0,
    0x00003FB0,
    0x0000EBB0,
    0x0003BEAC,
    0x0000C3B0,
    0x00003FB0,
    0x0000EAAC,
    0x0003BFBB,
    0x0003B3BB,
    0x0003B3BB,
    0x0000ECEC,
    0x00003030,
    0x00000000,
};
__asm__(".global gFontgrp_89\n\t.set gFontgrp_89, gFontgrp_89__shift\n");
