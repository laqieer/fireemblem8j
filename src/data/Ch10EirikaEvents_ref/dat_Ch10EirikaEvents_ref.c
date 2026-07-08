#include "global.h"

/* De-pointered from data/residual/Ch10EirikaEvents.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch10a_Character[];
extern const u8 EventListScr_Ch10a_Location[];
extern const u8 EventScr_Ch10a_BeginningScene[];
extern const u8 EventScr_Ch10a_EndingScene[];
extern const u8 UnitDef_Ch10AEnemy_7[];
extern const u8 UnitDef_Ch10AEnemy_8[];
extern const u8 UnitDef_Ch10AEnemy_9[];
extern const u8 UnitDef_Event_Ch10aAlly[];
extern const u8 UnitDef_Ch10AAlly_2[];
extern const u8 UnitDef_Ch10AAlly_3[];
extern const u8 UnitDef_Ch10AAlly_4[];
extern const u8 EventListScr_Ch10a_Turn[];
extern const u8 EventListScr_Ch10a_Misc[];
extern const u8 EventListScr_Ch10a_SelectUnit[];
extern const u8 EventListScr_Ch10a_SelectDestination[];
extern const u8 EventListScr_Ch10a_UnitMove[];
extern const u8 EventListScr_Ch10a_Tutorial[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch10EirikaEvents_ref") static const u32 Ch10EirikaEvents__shift[] = {
    (u32)&EventListScr_Ch10a_Turn,
    (u32)&EventListScr_Ch10a_Character,
    (u32)&EventListScr_Ch10a_Location,
    (u32)&EventListScr_Ch10a_Misc,
    (u32)&EventListScr_Ch10a_SelectUnit,
    (u32)&EventListScr_Ch10a_SelectDestination,
    (u32)&EventListScr_Ch10a_UnitMove,
    (u32)&EventListScr_Ch10a_Tutorial,
    (u32)&gUidebug_2 + 0x333,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x3B,
    (u32)&UnitDef_Event_Ch10aAlly,
    (u32)&UnitDef_Event_Ch10aAlly,
    (u32)&UnitDef_Ch10AAlly_2,
    (u32)&UnitDef_Ch10AAlly_3,
    (u32)&UnitDef_Ch10AAlly_4,
    (u32)&UnitDef_Ch10AEnemy_7,
    (u32)&UnitDef_Ch10AEnemy_8,
    (u32)&UnitDef_Ch10AEnemy_9,
    (u32)&EventScr_Ch10a_BeginningScene,
    (u32)&EventScr_Ch10a_EndingScene,
};
extern const u32 Ch10EirikaEvents __attribute__((alias("Ch10EirikaEvents__shift")));
