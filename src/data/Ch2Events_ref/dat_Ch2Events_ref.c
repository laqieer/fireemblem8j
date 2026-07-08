#include "global.h"

/* De-pointered from data/residual/Ch2Events.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch2_Location[];
extern const u8 EventListScr_Ch2_Tutorial[];
extern const u8 EventScr_Ch2_BeginningScene[];
extern const u8 EventScr_Ch2_EndingScene[];
extern const u8 UnitDef_Event_Ch2Ally[];
extern const u8 EventListScr_Ch2_Turn[];
extern const u8 EventListScr_Ch2_Character[];
extern const u8 EventListScr_Ch2_Misc[];
extern const u8 EventListScr_Ch2_SelectUnit[];
extern const u8 EventListScr_Ch2_SelectDestination[];
extern const u8 EventListScr_Ch2_UnitMove[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch2Events_ref") static const u32 Ch2Events__shift[] = {
    (u32)&EventListScr_Ch2_Turn,
    (u32)&EventListScr_Ch2_Character,
    (u32)&EventListScr_Ch2_Location,
    (u32)&EventListScr_Ch2_Misc,
    (u32)&EventListScr_Ch2_SelectUnit,
    (u32)&EventListScr_Ch2_SelectDestination,
    (u32)&EventListScr_Ch2_UnitMove,
    (u32)&EventListScr_Ch2_Tutorial,
    (u32)&gUidebug_2 + 0x314,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x28,
    (u32)&UnitDef_Event_Ch2Ally,
    (u32)&UnitDef_Event_Ch2Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch2_BeginningScene,
    (u32)&EventScr_Ch2_EndingScene,
};
extern const u32 Ch2Events __attribute__((alias("Ch2Events__shift")));
