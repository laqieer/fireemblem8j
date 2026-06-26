#include "global.h"

/* De-pointered from data/residual/gFontgrp_20.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_351[];

SECTION(".rodata.dat_gFontgrp_20_ref") static const u32 gFontgrp_20__shift[] = {
    (u32)&gFontgrp_351,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x000030CC,
    0x0000EFBB,
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
__asm__(".global gFontgrp_20\n\t.set gFontgrp_20, gFontgrp_20__shift\n");
