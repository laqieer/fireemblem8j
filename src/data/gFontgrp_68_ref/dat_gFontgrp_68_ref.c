#include "global.h"

/* De-pointered from data/residual/gFontgrp_68.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0857D48C[];

SECTION(".rodata.dat_gFontgrp_68_ref") static const u32 gFontgrp_68__shift[] = {
    (u32)&data_0857D48C,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0000000F,
    0x0000303B,
    0x0000ECEC,
    0x0000ECF0,
    0x0000EC00,
    0x0000E700,
    0x00003B00,
    0x000039C0,
    0x00000EF0,
    0x0000039C,
    0x000000EB,
    0x0000003F,
    0x00000000,
};
__asm__(".global gFontgrp_68\n\t.set gFontgrp_68, gFontgrp_68__shift\n");
