#include "global.h"

/* De-pointered from data/residual/gFontgrp_24.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_357[];

SECTION(".rodata.dat_gFontgrp_24_ref") static const u32 gFontgrp_24__shift[] = {
    (u32)&gFontgrp_357,
    0x00000683,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000030,
    0x000000EC,
    0x000000EC,
    0x000000EC,
    0x000003EC,
    0x00000EAC,
    0x00003BEC,
    0x00000CEC,
    0x000000EC,
    0x000000EC,
    0x000000EC,
    0x00000030,
    0x00000000,
};
__asm__(".global gFontgrp_24\n\t.set gFontgrp_24, gFontgrp_24__shift\n");
