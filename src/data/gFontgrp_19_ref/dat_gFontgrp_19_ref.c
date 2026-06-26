#include "global.h"

/* De-pointered from data/residual/gFontgrp_19.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_350[];

SECTION(".rodata.dat_gFontgrp_19_ref") static const u32 gFontgrp_19__shift[] = {
    (u32)&gFontgrp_350,
    0x00000683,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000CCC,
    0x00003BBB,
    0x00003BBB,
    0x00003BBB,
    0x00003BCC,
    0x00000EF0,
    0x000003AC,
    0x000000F0,
    0x00000000,
};
__asm__(".global gFontgrp_19\n\t.set gFontgrp_19, gFontgrp_19__shift\n");
