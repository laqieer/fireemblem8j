#include "global.h"

/* De-pointered from data/residual/gFontgrp_337.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0857DA2C[];

SECTION(".rodata.dat_gFontgrp_337_ref") static const u32 gFontgrp_337__shift[] = {
    (u32)&data_0857DA2C,
    0x000007FA,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000FF0,
    0x00003AAC,
    0x00003AEB,
    0x00003AEB,
    0x00003AEB,
    0x0000EAAB,
    0x0000FAFC,
    0x00003F00,
    0x00000000,
};
__asm__(".global gFontgrp_337\n\t.set gFontgrp_337, gFontgrp_337__shift\n");
