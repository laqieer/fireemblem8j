#include "global.h"

/* De-pointered from data/residual/gFontgrp_33.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0857DEF4[];

SECTION(".rodata.dat_gFontgrp_33_ref") static const u32 gFontgrp_33__shift[] = {
    (u32)&data_0857DEF4,
    0x00000883,
    0x00000000,
    0x00000000,
    0x0000FC00,
    0x00036700,
    0x0003BB30,
    0x00036CEC,
    0x0000FBEC,
    0x0000ECEC,
    0x0000ECEC,
    0x0000ECEC,
    0x00039CEC,
    0x0003B03B,
    0x0003B03B,
    0x0003B03B,
    0x0000C00F,
    0x00000000,
};
__asm__(".global gFontgrp_33\n\t.set gFontgrp_33, gFontgrp_33__shift\n");
