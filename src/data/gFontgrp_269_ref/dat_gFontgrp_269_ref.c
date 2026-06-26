#include "global.h"

/* De-pointered from data/residual/gFontgrp_269.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_0859A0AC[];

SECTION(".rodata.dat_gFontgrp_269_ref") static const u32 gFontgrp_269__shift[] = {
    (u32)&data_0859A0AC,
    0x00000982,
    0x00000000,
    0x00000000,
    0x00000000,
    0x000000B0,
    0x00000BE0,
    0x000002C0,
    0x00000000,
    0x000000B0,
    0x000000B0,
    0x00002EE0,
    0x00002EC0,
    0x0000BBAC,
    0x0000BB2C,
    0x0000BBBB,
    0x0000BBBB,
    0x000002E0,
};
__asm__(".global gFontgrp_269\n\t.set gFontgrp_269, gFontgrp_269__shift\n");
