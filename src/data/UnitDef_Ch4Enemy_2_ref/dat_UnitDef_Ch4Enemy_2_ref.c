#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch4Enemy_2.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_Ch4Enemy_2_0[];
extern const u8 REDA_Ch4Enemy_2_1[];
extern const u8 REDA_Ch4Enemy_2_2[];

SECTION(".rodata.dat_UnitDef_Ch4Enemy_2_ref") static const u32 UnitDef_Ch4Enemy_2__shift[] = {
    0x0D0054AC,
    0x0100024E,
    (u32)&REDA_Ch4Enemy_2_0,
    0x00000014,
    0x000C0000,
    0x0D0054AC,
    0x0100020E,
    (u32)&REDA_Ch4Enemy_2_1,
    0x00000014,
    0x000C1200,
    0x150054AC,
    0x0100018E,
    (u32)&REDA_Ch4Enemy_2_2,
    0x00000014,
    0x000C0000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Ch4Enemy_2\n\t.set UnitDef_Ch4Enemy_2, UnitDef_Ch4Enemy_2__shift\n");
