#include "global.h"

/* De-pointered from data/residual/gFontgrp_103.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df3_fontgrp_se_000_57E884[];

SECTION(".rodata.dat_gFontgrp_103_ref") static const u32 gFontgrp_103__shift[] = {
    (u32)&frontier_df3_fontgrp_se_000_57E884,
    0x00000782,
    0x00000000,
    0x00000000,
    0x00003300,
    0x0000EECC,
    0x0000EEFB,
    0x0000333B,
    0x0000003B,
    0x0000003B,
    0x0000003B,
    0x0000303B,
    0x0000EC3B,
    0x0000EC3B,
    0x00003BFB,
    0x00000EAC,
    0x000003F0,
    0x00000000,
};
__asm__(".global gFontgrp_103\n\t.set gFontgrp_103, gFontgrp_103__shift\n");
