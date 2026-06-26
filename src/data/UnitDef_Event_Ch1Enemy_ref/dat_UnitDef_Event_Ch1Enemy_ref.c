#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_Ch1Enemy.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_Ch1_0[];
extern const u8 REDA_Ch1_1[];
extern const u8 REDA_Ch1_2[];
extern const u8 REDA_Ch1_3[];
extern const u8 REDA_Ch1_4[];
extern const u8 REDA_Ch1_5[];
extern const u8 REDA_Ch1_6[];

SECTION(".rodata.dat_UnitDef_Event_Ch1Enemy_ref") static const u32 UnitDef_Event_Ch1Enemy__shift[] = {
    0x24460946,
    0x01000242,
    (u32)&REDA_Ch1_0,
    0x00000014,
    0x00090303,
    0x15464E80,
    0x01000241,
    (u32)&REDA_Ch1_1,
    0x00000014,
    0x00090300,
    0x15464E80,
    0x02000242,
    (u32)&REDA_Ch1_2,
    0x00000014,
    0x00090300,
    0x1D464E80,
    0x01000242,
    (u32)&REDA_Ch1_3,
    0x00000014,
    0x00011203,
    0x15463F80,
    0x01000241,
    (u32)&REDA_Ch1_4,
    0x0000001F,
    0x00010000,
    0x15463F80,
    0x01000242,
    (u32)&REDA_Ch1_5,
    0x0000001F,
    0x00010000,
    0x15463F80,
    0x01000242,
    (u32)&REDA_Ch1_6,
    0x0000001F,
    0x00011200,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Event_Ch1Enemy\n\t.set UnitDef_Event_Ch1Enemy, UnitDef_Event_Ch1Enemy__shift\n");
