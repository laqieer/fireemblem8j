#include "global.h"

/* De-pointered from data/residual/FinalEphraimEvents1.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch21b_BeginningScene[];
extern const u8 EventListScr_Ch21b_Turn[];
extern const u8 EventListScr_Ch21b_Character[];
extern const u8 EventListScr_Ch21b_Location[];
extern const u8 EventListScr_Ch21b_Misc[];
extern const u8 EventListScr_Ch21b_SelectUnit[];
extern const u8 EventListScr_Ch21b_SelectDestination[];
extern const u8 EventListScr_Ch21b_UnitMove[];
extern const u8 EventListScr_Ch21b_Tutorial[];
extern const u8 frontier_df3_unitdef_b_053_91FAF4[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_FinalEphraimEvents1_ref") static const u32 FinalEphraimEvents1__shift[] = {
    (u32)&EventListScr_Ch21b_Turn,
    (u32)&EventListScr_Ch21b_Character,
    (u32)&EventListScr_Ch21b_Location,
    (u32)&EventListScr_Ch21b_Misc,
    (u32)&EventListScr_Ch21b_SelectUnit,
    (u32)&EventListScr_Ch21b_SelectDestination,
    (u32)&EventListScr_Ch21b_UnitMove,
    (u32)&EventListScr_Ch21b_Tutorial,
    (u32)&gUidebug_2 + 0x64B,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x6B,
    (u32)&frontier_df3_unitdef_b_053_91FAF4,
    (u32)&frontier_df3_unitdef_b_053_91FAF4,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch21b_BeginningScene,
    (u32)&EventScr_Ch21b_BeginningScene + 0xC,
};
extern const u32 FinalEphraimEvents1 __attribute__((alias("FinalEphraimEvents1__shift")));
