#include "global.h"

/* De-pointered from data/residual/Ch6Events.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch6_BeginningScene[];
extern const u8 EventScr_Ch6_EndingScene[];
extern const u8 UnitDef_Ch6Enemy_1[];
extern const u8 UnitDef_Ch6Enemy_2[];
extern const u8 UnitDef_Ch6Enemy_3[];
extern const u8 UnitDef_Event_Ch6Ally[];
extern const u8 data_0890AAC8[];
extern const u8 data_0890ADC0[];
extern const u8 data_0890B0B8[];
extern const u8 data_08A5AE80[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch6Events_ref") static const u32 Ch6Events__shift[] = {
    (u32)&data_08A5AE80,
    (u32)&data_08A5AE80 + 0x10,
    (u32)&data_08A5AE80 + 0x14,
    (u32)&data_08A5AE80 + 0x30,
    (u32)&data_08A5AE80 + 0x58,
    (u32)&data_08A5AE80 + 0x5C,
    (u32)&data_08A5AE80 + 0x60,
    (u32)&data_08A5AE80 + 0x64,
    (u32)&gUidebug_2 + 0x31E,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x32,
    (u32)&UnitDef_Event_Ch6Ally,
    (u32)&UnitDef_Event_Ch6Ally,
    (u32)&data_0890AAC8,
    (u32)&data_0890ADC0,
    (u32)&data_0890B0B8,
    (u32)&UnitDef_Ch6Enemy_1,
    (u32)&UnitDef_Ch6Enemy_2,
    (u32)&UnitDef_Ch6Enemy_3,
    (u32)&EventScr_Ch6_BeginningScene,
    (u32)&EventScr_Ch6_EndingScene,
};
extern const u32 Ch6Events __attribute__((alias("Ch6Events__shift")));
