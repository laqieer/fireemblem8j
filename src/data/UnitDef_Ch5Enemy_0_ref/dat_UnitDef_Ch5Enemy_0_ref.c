#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch5Enemy_0.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_Ch5Enemy_0_0[];
extern const u8 REDA_Ch5Enemy_0_1[];
extern const u8 REDA_Ch5Enemy_0_2[];
extern const u8 REDA_Ch5Enemy_0_3[];
extern const u8 REDA_Ch5Enemy_0_4[];
extern const u8 REDA_Ch5Enemy_0_5[];
extern const u8 REDA_Ch5Enemy_0_6[];

SECTION(".rodata.dat_UnitDef_Ch5Enemy_0_ref") static const u32 UnitDef_Ch5Enemy_0__shift[] = {
    0x4400094A,
    0x0100000D,
    (u32)&REDA_Ch5Enemy_0_0,
    0x0000001C,
    0x00090303,
    0x35004E80,
    0x0100000C,
    (u32)&REDA_Ch5Enemy_0_1,
    0x00000014,
    0x00090300,
    0x2D003F80,
    0x0100000A,
    (u32)&REDA_Ch5Enemy_0_2,
    0x0000001F,
    0x00090300,
    0x2D003F80,
    0x0100000A,
    (u32)&REDA_Ch5Enemy_0_3,
    0x0000001F,
    0x00090300,
    0x35004E80,
    0x0100000D,
    (u32)&REDA_Ch5Enemy_0_4,
    0x00000014,
    0x00090300,
    0x2D004E80,
    0x0100000C,
    (u32)&REDA_Ch5Enemy_0_5,
    0x00000014,
    0x00090000,
    0x2D004E80,
    0x0100000A,
    (u32)&REDA_Ch5Enemy_0_6,
    0x00000014,
    0x00090000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Ch5Enemy_0\n\t.set UnitDef_Ch5Enemy_0, UnitDef_Ch5Enemy_0__shift\n");
