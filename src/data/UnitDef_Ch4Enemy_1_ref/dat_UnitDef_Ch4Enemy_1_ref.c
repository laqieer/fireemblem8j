#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch4Enemy_1.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_Ch4Enemy_1_0[];
extern const u8 REDA_Ch4Enemy_1_1[];
extern const u8 REDA_Ch4Enemy_1_2[];
extern const u8 REDA_Ch4Enemy_1_3[];

SECTION(".rodata.dat_UnitDef_Ch4Enemy_1_ref") static const u32 UnitDef_Ch4Enemy_1__shift[] = {
    0x150052AA,
    0x01000000,
    (u32)&REDA_Ch4Enemy_1_0,
    0x00006CAE,
    0x200C0000,
    0x150052AA,
    0x01000000,
    (u32)&REDA_Ch4Enemy_1_1,
    0x000000AD,
    0x000C0000,
    0x150052AA,
    0x01000000,
    (u32)&REDA_Ch4Enemy_1_2,
    0x000000AD,
    0x000C0000,
    0x150052AA,
    0x01000000,
    (u32)&REDA_Ch4Enemy_1_3,
    0x000000AD,
    0x000C0000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Ch4Enemy_1\n\t.set UnitDef_Ch4Enemy_1, UnitDef_Ch4Enemy_1__shift\n");
