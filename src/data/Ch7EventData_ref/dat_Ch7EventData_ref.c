#include "global.h"

/* De-pointered from data/residual/Ch7EventData.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch7_BeginningScene[];
extern const u8 EventScr_Ch7_EndingScene[];
extern const u8 UnitDef_Event_Ch7Ally[];
extern const u8 EventListScr_Ch7_Turn[];
extern const u8 EventListScr_Ch7_Character[];
extern const u8 EventListScr_Ch7_Location[];
extern const u8 EventListScr_Ch7_Misc[];
extern const u8 EventListScr_Ch7_SelectUnit[];
extern const u8 EventListScr_Ch7_SelectDestination[];
extern const u8 EventListScr_Ch7_UnitMove[];
extern const u8 EventListScr_Ch7_Tutorial[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch7EventData_ref") static const u32 Ch7EventData__shift[] = {
    (u32)&EventListScr_Ch7_Turn,
    (u32)&EventListScr_Ch7_Character,
    (u32)&EventListScr_Ch7_Location,
    (u32)&EventListScr_Ch7_Misc,
    (u32)&EventListScr_Ch7_SelectUnit,
    (u32)&EventListScr_Ch7_SelectDestination,
    (u32)&EventListScr_Ch7_UnitMove,
    (u32)&EventListScr_Ch7_Tutorial,
    (u32)&gUidebug_2 + 0x31F,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x33,
    (u32)&UnitDef_Event_Ch7Ally,
    (u32)&UnitDef_Event_Ch7Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch7_BeginningScene,
    (u32)&EventScr_Ch7_EndingScene,
};
extern const u32 Ch7EventData __attribute__((alias("Ch7EventData__shift")));
