#include "global.h"

/* De-pointered from data/residual/Ch5XEvents.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch5x_BeginningScene[];
extern const u8 EventScr_Ch5x_EndingScene[];
extern const u8 UnitDef_Event_Ch5xAlly[];
extern const u8 EventListScr_Ch5x_Turn[];
extern const u8 EventListScr_Ch5x_Character[];
extern const u8 EventListScr_Ch5x_Location[];
extern const u8 EventListScr_Ch5x_Misc[];
extern const u8 EventListScr_Ch5x_SelectUnit[];
extern const u8 EventListScr_Ch5x_SelectDestination[];
extern const u8 EventListScr_Ch5x_UnitMove[];
extern const u8 EventListScr_Ch5x_Tutorial[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch5XEvents_ref") static const u32 Ch5XEvents__shift[] = {
    (u32)&EventListScr_Ch5x_Turn,
    (u32)&EventListScr_Ch5x_Character,
    (u32)&EventListScr_Ch5x_Location,
    (u32)&EventListScr_Ch5x_Misc,
    (u32)&EventListScr_Ch5x_SelectUnit,
    (u32)&EventListScr_Ch5x_SelectDestination,
    (u32)&EventListScr_Ch5x_UnitMove,
    (u32)&EventListScr_Ch5x_Tutorial,
    (u32)&gUidebug_2 + 0x319,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x2D,
    (u32)&UnitDef_Event_Ch5xAlly,
    (u32)&UnitDef_Event_Ch5xAlly,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch5x_BeginningScene,
    (u32)&EventScr_Ch5x_EndingScene,
};
extern const u32 Ch5XEvents __attribute__((alias("Ch5XEvents__shift")));
