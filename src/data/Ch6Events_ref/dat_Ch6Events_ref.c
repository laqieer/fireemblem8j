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
extern const u8 UnitDef_Ch6Ally_1[];
extern const u8 UnitDef_Ch6Ally_2[];
extern const u8 UnitDef_Ch6Ally_3[];
extern const u8 EventListScr_Ch6_Turn[];
extern const u8 EventListScr_Ch6_Character[];
extern const u8 EventListScr_Ch6_Location[];
extern const u8 EventListScr_Ch6_Misc[];
extern const u8 EventListScr_Ch6_SelectUnit[];
extern const u8 EventListScr_Ch6_SelectDestination[];
extern const u8 EventListScr_Ch6_UnitMove[];
extern const u8 EventListScr_Ch6_Tutorial[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch6Events_ref") static const u32 Ch6Events__shift[] = {
    (u32)&EventListScr_Ch6_Turn,
    (u32)&EventListScr_Ch6_Character,
    (u32)&EventListScr_Ch6_Location,
    (u32)&EventListScr_Ch6_Misc,
    (u32)&EventListScr_Ch6_SelectUnit,
    (u32)&EventListScr_Ch6_SelectDestination,
    (u32)&EventListScr_Ch6_UnitMove,
    (u32)&EventListScr_Ch6_Tutorial,
    (u32)&gUidebug_2 + 0x31E,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x32,
    (u32)&UnitDef_Event_Ch6Ally,
    (u32)&UnitDef_Event_Ch6Ally,
    (u32)&UnitDef_Ch6Ally_1,
    (u32)&UnitDef_Ch6Ally_2,
    (u32)&UnitDef_Ch6Ally_3,
    (u32)&UnitDef_Ch6Enemy_1,
    (u32)&UnitDef_Ch6Enemy_2,
    (u32)&UnitDef_Ch6Enemy_3,
    (u32)&EventScr_Ch6_BeginningScene,
    (u32)&EventScr_Ch6_EndingScene,
};
extern const u32 Ch6Events __attribute__((alias("Ch6Events__shift")));
