#include "global.h"

/* De-pointered from data/residual/gFontgrp_35.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_347[];

SECTION(".rodata.dat_gFontgrp_35_ref") static const u32 gFontgrp_35__shift[] = {
    (u32)&gFontgrp_347,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00003300,
    0x0000EECC,
    0x0000EEFB,
    0x0000333B,
    0x00000F3B,
    0x00003AFB,
    0x00000FAB,
    0x000000FB,
    0x0000003B,
    0x0000003B,
    0x00000FFB,
    0x00003AAC,
    0x00000FF0,
    0x00000000,
};
__asm__(".global gFontgrp_35\n\t.set gFontgrp_35, gFontgrp_35__shift\n");
