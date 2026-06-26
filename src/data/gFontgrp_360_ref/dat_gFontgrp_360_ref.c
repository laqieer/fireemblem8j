#include "global.h"

/* De-pointered from data/residual/gFontgrp_360.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df3_fontgrp_se_007_581A04[];

SECTION(".rodata.dat_gFontgrp_360_ref") static const u32 gFontgrp_360__shift[] = {
    (u32)&frontier_df3_fontgrp_se_007_581A04,
    0x00000681,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000F3F,
    0x00003AEA,
    0x00003B3A,
    0x00003B3A,
    0x00003B3A,
    0x00003B3A,
    0x00003B3A,
    0x00000EEA,
    0x00000EEB,
    0x000003AB,
    0x000003AB,
    0x000000FC,
    0x00000000,
};
__asm__(".global gFontgrp_360\n\t.set gFontgrp_360, gFontgrp_360__shift\n");
