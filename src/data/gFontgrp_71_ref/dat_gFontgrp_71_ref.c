#include "global.h"

/* De-pointered from data/residual/gFontgrp_71.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_360[];

SECTION(".rodata.dat_gFontgrp_71_ref") static const u32 gFontgrp_71__shift[] = {
    (u32)&gFontgrp_360,
    0x00000682,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000C3C,
    0x00003BEB,
    0x00003BEB,
    0x00003BEB,
    0x00003BAB,
    0x00003BAB,
    0x00003BAC,
    0x00000EAC,
    0x00000EB0,
    0x000003C0,
    0x00000000,
};
__asm__(".global gFontgrp_71\n\t.set gFontgrp_71, gFontgrp_71__shift\n");
