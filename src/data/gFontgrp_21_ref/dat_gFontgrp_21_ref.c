#include "global.h"

/* De-pointered from data/residual/gFontgrp_21.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_352[];

SECTION(".rodata.dat_gFontgrp_21_ref") static const u32 gFontgrp_21__shift[] = {
    (u32)&gFontgrp_352,
    0x00000883,
    0x00000000,
    0x00000000,
    0x0000CC00,
    0x0003BB00,
    0x0003BBCC,
    0x0000FFBB,
    0x0000EFBB,
    0x0000EFBB,
    0x0000E7CC,
    0x00003B00,
    0x000039C0,
    0x00000EC0,
    0x000003B0,
    0x000000EC,
    0x0000003C,
    0x00000000,
};
__asm__(".global gFontgrp_21\n\t.set gFontgrp_21, gFontgrp_21__shift\n");
