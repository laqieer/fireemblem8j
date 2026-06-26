#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_Ch1EnemyReinforce.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_Ch1_7[];
extern const u8 REDA_Ch1_8[];
extern const u8 REDA_Ch1_9[];

SECTION(".rodata.dat_UnitDef_Event_Ch1EnemyReinforce_ref") static const u32 UnitDef_Event_Ch1EnemyReinforce__shift[] = {
    0x0D463F80,
    0x0100024E,
    (u32)&REDA_Ch1_7,
    0x0000001F,
    0x00090000,
    0x15464E83,
    0x0100024E,
    (u32)&REDA_Ch1_8,
    0x00000014,
    0x00090000,
    0x0D463F80,
    0x0100024E,
    (u32)&REDA_Ch1_9,
    0x0000001F,
    0x00090000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Event_Ch1EnemyReinforce\n\t.set UnitDef_Event_Ch1EnemyReinforce, UnitDef_Event_Ch1EnemyReinforce__shift\n");
