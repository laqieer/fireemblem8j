#include "global.h"

/* De-pointered from data/residual/gFontgrp_32.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_358[];

SECTION(".rodata.dat_gFontgrp_32_ref") static const u32 gFontgrp_32__shift[] = {
    (u32)&gFontgrp_358,
    0x00000883,
    0x00000000,
    0x00000000,
    0x0000CC00,
    0x0003BB00,
    0x0003BB30,
    0x0000CCEC,
    0x00003BEC,
    0x0000E7EC,
    0x0000ECEC,
    0x0000ECEC,
    0x00039CEC,
    0x0003B0DB,
    0x0003B03B,
    0x0003B03B,
    0x0000C00C,
    0x00000000,
};
__asm__(".global gFontgrp_32\n\t.set gFontgrp_32, gFontgrp_32__shift\n");
