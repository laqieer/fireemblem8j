#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch5Enemy_1.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_Ch5Enemy_1_0[];
extern const u8 REDA_Ch5Enemy_1_1[];
extern const u8 REDA_Ch5Enemy_1_2[];
extern const u8 REDA_Ch5Enemy_1_3[];
extern const u8 REDA_Ch5Enemy_1_4[];
extern const u8 REDA_Ch5Enemy_1_5[];
extern const u8 REDA_Ch5Enemy_1_6[];
extern const u8 REDA_Ch5Enemy_1_7[];
extern const u8 REDA_Ch5Enemy_1_8[];

SECTION(".rodata.dat_UnitDef_Ch5Enemy_1_ref") static const u32 UnitDef_Ch5Enemy_1__shift[] = {
    0x2D003F80,
    0x0100000A,
    (u32)&REDA_Ch5Enemy_1_0,
    0x0000001F,
    0x00090300,
    0x2D001980,
    0x0100000B,
    (u32)&REDA_Ch5Enemy_1_1,
    0x0000002D,
    0x00090000,
    0x35000F80,
    0x01000000,
    (u32)&REDA_Ch5Enemy_1_2,
    0x00000001,
    0x00090300,
    0x2D003F80,
    0x01000000,
    (u32)&REDA_Ch5Enemy_1_3,
    0x0000001F,
    0x00090000,
    0x2D001980,
    0x01000000,
    (u32)&REDA_Ch5Enemy_1_4,
    0x0000002D,
    0x00090300,
    0x2D004E80,
    0x01000000,
    (u32)&REDA_Ch5Enemy_1_5,
    0x00000014,
    0x00090300,
    0x25001980,
    0x0100000A,
    (u32)&REDA_Ch5Enemy_1_6,
    0x0000002D,
    0x00091200,
    0x25003F80,
    0x0100000A,
    (u32)&REDA_Ch5Enemy_1_7,
    0x0000001F,
    0x00091200,
    0x2D004E80,
    0x0100000A,
    (u32)&REDA_Ch5Enemy_1_8,
    0x00000014,
    0x00090300,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Ch5Enemy_1\n\t.set UnitDef_Ch5Enemy_1, UnitDef_Ch5Enemy_1__shift\n");
