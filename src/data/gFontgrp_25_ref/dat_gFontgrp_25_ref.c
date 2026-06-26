#include "global.h"

/* De-pointered from data/residual/gFontgrp_25.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0857DCB4[];

SECTION(".rodata.dat_gFontgrp_25_ref") static const u32 gFontgrp_25__shift[] = {
    (u32)&data_0857DCB4,
    0x00000783,
    0x00000000,
    0x00000000,
    0x00003300,
    0x0000EEF0,
    0x0000EEEC,
    0x000033EC,
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
__asm__(".global gFontgrp_25\n\t.set gFontgrp_25, gFontgrp_25__shift\n");
