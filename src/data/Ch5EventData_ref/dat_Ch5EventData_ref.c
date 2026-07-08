#include "global.h"

/* De-pointered from data/residual/Ch5EventData.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch5_Location[];
extern const u8 EventScr_Ch5_BeginningScene[];
extern const u8 EventScr_Ch5_EndingScene[];
extern const u8 UnitDef_Event_Ch5Ally[];
extern const u8 EventListScr_Ch5_Turn[];
extern const u8 EventListScr_Ch5_Character[];
extern const u8 EventListScr_Ch5_Misc[];
extern const u8 EventListScr_Ch5_SelectUnit[];
extern const u8 EventListScr_Ch5_SelectDestination[];
extern const u8 EventListScr_Ch5_UnitMove[];
extern const u8 EventListScr_Ch5_Tutorial[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch5EventData_ref") static const u32 Ch5EventData__shift[] = {
    (u32)&EventListScr_Ch5_Turn,
    (u32)&EventListScr_Ch5_Character,
    (u32)&EventListScr_Ch5_Location,
    (u32)&EventListScr_Ch5_Misc,
    (u32)&EventListScr_Ch5_SelectUnit,
    (u32)&EventListScr_Ch5_SelectDestination,
    (u32)&EventListScr_Ch5_UnitMove,
    (u32)&EventListScr_Ch5_Tutorial,
    (u32)&gUidebug_2 + 0x318,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x2C,
    (u32)&UnitDef_Event_Ch5Ally,
    (u32)&UnitDef_Event_Ch5Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch5_BeginningScene,
    (u32)&EventScr_Ch5_EndingScene,
};
extern const u32 Ch5EventData __attribute__((alias("Ch5EventData__shift")));
