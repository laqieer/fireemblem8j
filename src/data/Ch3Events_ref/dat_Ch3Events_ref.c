#include "global.h"

/* De-pointered from data/residual/Ch3Events.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch3_BeginningScene[];
extern const u8 EventScr_Ch3_EndingScene[];
extern const u8 UnitDef_Event_Ch3Ally[];
extern const u8 data_08A5AAA8[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch3Events_ref") static const u32 Ch3Events__shift[] = {
    (u32)&data_08A5AAA8,
    (u32)&data_08A5AAA8 + 0x1C,
    (u32)&data_08A5AAA8 + 0x30,
    (u32)&data_08A5AAA8 + 0x94,
    (u32)&data_08A5AAA8 + 0xA4,
    (u32)&data_08A5AAA8 + 0xA8,
    (u32)&data_08A5AAA8 + 0xAC,
    (u32)&data_08A5AAA8 + 0xB0,
    (u32)&gUidebug_2 + 0x315,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x29,
    (u32)&UnitDef_Event_Ch3Ally,
    (u32)&UnitDef_Event_Ch3Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch3_BeginningScene,
    (u32)&EventScr_Ch3_EndingScene,
};
__asm__(".global Ch3Events\n\t.set Ch3Events, Ch3Events__shift\n");
