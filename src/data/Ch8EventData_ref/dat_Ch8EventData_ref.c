#include "global.h"

/* De-pointered from data/residual/Ch8EventData.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch8_Character[];
extern const u8 EventScr_Ch8_BeginningScene[];
extern const u8 UnitDef_Event_Ch8Ally[];
extern const u8 data_08A5AFE4[];
extern const u8 data_08A5B090[];
extern const u8 data_08A652C0[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch8EventData_ref") static const u32 Ch8EventData__shift[] = {
    (u32)&data_08A5AFE4,
    (u32)&EventListScr_Ch8_Character,
    (u32)&data_08A5B090,
    (u32)&data_08A5B090 + 0x4C,
    (u32)&data_08A5B090 + 0x68,
    (u32)&data_08A5B090 + 0x6C,
    (u32)&data_08A5B090 + 0x70,
    (u32)&data_08A5B090 + 0x74,
    (u32)&gUidebug_2 + 0x32D,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x35,
    (u32)&UnitDef_Event_Ch8Ally,
    (u32)&UnitDef_Event_Ch8Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch8_BeginningScene,
    (u32)&data_08A652C0,
};
extern const u32 Ch8EventData __attribute__((alias("Ch8EventData__shift")));
