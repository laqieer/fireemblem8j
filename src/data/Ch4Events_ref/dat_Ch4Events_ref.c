#include "global.h"

/* De-pointered from data/residual/Ch4Events.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch4_1[];
extern const u8 EventScr_Ch4_BeginningScene[];
extern const u8 UnitDef_Ch4Enemy_3[];
extern const u8 UnitDef_Ch4Enemy_4[];
extern const u8 UnitDef_Ch4Enemy_5[];
extern const u8 UnitDef_Event_Ch4Ally[];
extern const u8 UnitDef_Ch4Ally_4[];
extern const u8 UnitDef_Ch4SkirmishAlly2[];
extern const u8 UnitDef_Ch4Ally_5[];
extern const u8 EventListScr_Ch4_Turn[];
extern const u8 EventListScr_Ch4_Character[];
extern const u8 EventListScr_Ch4_Location[];
extern const u8 EventListScr_Ch4_Misc[];
extern const u8 EventListScr_Ch4_SelectUnit[];
extern const u8 EventListScr_Ch4_SelectDestination[];
extern const u8 EventListScr_Ch4_UnitMove[];
extern const u8 EventListScr_Ch4_Tutorial[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch4Events_ref") static const u32 Ch4Events__shift[] = {
    (u32)&EventListScr_Ch4_Turn,
    (u32)&EventListScr_Ch4_Character,
    (u32)&EventListScr_Ch4_Location,
    (u32)&EventListScr_Ch4_Misc,
    (u32)&EventListScr_Ch4_SelectUnit,
    (u32)&EventListScr_Ch4_SelectDestination,
    (u32)&EventListScr_Ch4_UnitMove,
    (u32)&EventListScr_Ch4_Tutorial,
    (u32)&gUidebug_2 + 0x317,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x2B,
    (u32)&UnitDef_Event_Ch4Ally,
    (u32)&UnitDef_Event_Ch4Ally,
    (u32)&UnitDef_Ch4Ally_4,
    (u32)&UnitDef_Ch4SkirmishAlly2,
    (u32)&UnitDef_Ch4Ally_5,
    (u32)&UnitDef_Ch4Enemy_3,
    (u32)&UnitDef_Ch4Enemy_4,
    (u32)&UnitDef_Ch4Enemy_5,
    (u32)&EventScr_Ch4_BeginningScene,
    (u32)&EventScr_Ch4_1,
};
extern const u32 Ch4Events __attribute__((alias("Ch4Events__shift")));
