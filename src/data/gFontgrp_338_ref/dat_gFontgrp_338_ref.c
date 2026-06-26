#include "global.h"

/* De-pointered from data/residual/gFontgrp_338.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_356[];

SECTION(".rodata.dat_gFontgrp_338_ref") static const u32 gFontgrp_338__shift[] = {
    (u32)&gFontgrp_356,
    0x000007FA,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00003FFC,
    0x0000EAAB,
    0x00003FEB,
    0x00003AAB,
    0x0000EBFC,
    0x0000EBEB,
    0x00003AAC,
    0x00000FF0,
    0x00000000,
};
__asm__(".global gFontgrp_338\n\t.set gFontgrp_338, gFontgrp_338__shift\n");
