#include "global.h"

/* De-pointered from data/residual/gFontgrp_64.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0857D36C[];

SECTION(".rodata.dat_gFontgrp_64_ref") static const u32 gFontgrp_64__shift[] = {
    (u32)&data_0857D36C,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0000FFFF,
    0x0000EAAB,
    0x0000EFFB,
    0x0000EC3B,
    0x0000EC3B,
    0x0000EC3B,
    0x0000EC3B,
    0x0000EC0C,
    0x0000E700,
    0x000039C0,
    0x00000EB0,
    0x000003C0,
    0x00000000,
};
__asm__(".global gFontgrp_64\n\t.set gFontgrp_64, gFontgrp_64__shift\n");
