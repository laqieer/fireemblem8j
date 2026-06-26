#include "global.h"

/* De-pointered from data/residual/gFontgrp_45.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0857E32C[];

SECTION(".rodata.dat_gFontgrp_45_ref") static const u32 gFontgrp_45__shift[] = {
    (u32)&data_0857E32C,
    0x00000883,
    0x00000000,
    0x00000000,
    0x0000FC00,
    0x00036700,
    0x0003BAC0,
    0x0003EEFC,
    0x0003AAAB,
    0x0000FEFC,
    0x0000EEEC,
    0x0000EEEC,
    0x00039EE7,
    0x0003BEDB,
    0x0003BEFB,
    0x0000CECC,
    0x00000300,
    0x00000000,
};
__asm__(".global gFontgrp_45\n\t.set gFontgrp_45, gFontgrp_45__shift\n");
