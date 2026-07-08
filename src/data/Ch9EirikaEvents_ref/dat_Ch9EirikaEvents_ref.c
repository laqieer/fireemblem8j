#include "global.h"

/* De-pointered from data/residual/Ch9EirikaEvents.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch9a_Location[];
extern const u8 EventListScr_Ch9a_Turn[];
extern const u8 EventScr_Ch9a_BeginningScene[];
extern const u8 EventScr_Ch9a_EndingScene[];
extern const u8 UnitDef_Event_Ch9aAlly[];
extern const u8 EventListScr_Ch9a_Character[];
extern const u8 EventListScr_Ch9a_Misc[];
extern const u8 EventListScr_Ch9a_SelectUnit[];
extern const u8 EventListScr_Ch9a_SelectDestination[];
extern const u8 EventListScr_Ch9a_UnitMove[];
extern const u8 EventListScr_Ch9a_Tutorial[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch9EirikaEvents_ref") static const u32 Ch9EirikaEvents__shift[] = {
    (u32)&EventListScr_Ch9a_Turn,
    (u32)&EventListScr_Ch9a_Character,
    (u32)&EventListScr_Ch9a_Location,
    (u32)&EventListScr_Ch9a_Misc,
    (u32)&EventListScr_Ch9a_SelectUnit,
    (u32)&EventListScr_Ch9a_SelectDestination,
    (u32)&EventListScr_Ch9a_UnitMove,
    (u32)&EventListScr_Ch9a_Tutorial,
    (u32)&gUidebug_2 + 0x330,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x38,
    (u32)&UnitDef_Event_Ch9aAlly,
    (u32)&UnitDef_Event_Ch9aAlly,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch9a_BeginningScene,
    (u32)&EventScr_Ch9a_EndingScene,
};
extern const u32 Ch9EirikaEvents __attribute__((alias("Ch9EirikaEvents__shift")));
