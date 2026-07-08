#include "global.h"

/* De-pointered from data/residual/Ch11EirikaMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch11a_Turn[];
extern const u8 EventListScr_Ch11a_Character[];
extern const u8 EventListScr_Ch11a_Location[];
extern const u8 EventListScr_Ch11a_Misc[];
extern const u8 EventListScr_Ch11a_SelectUnit[];
extern const u8 EventListScr_Ch11a_SelectDestination[];
extern const u8 EventListScr_Ch11a_UnitMove[];
extern const u8 EventListScr_Ch11a_Tutorial[];
extern const u8 frontier_df4_banim_b_077_90DB94[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch11EirikaMapChanges_ref") static const u32 Ch11EirikaMapChanges__shift[] = {
    (u32)&EventListScr_Ch11a_Turn,
    (u32)&EventListScr_Ch11a_Character,
    (u32)&EventListScr_Ch11a_Location,
    (u32)&EventListScr_Ch11a_Misc,
    (u32)&EventListScr_Ch11a_SelectUnit,
    (u32)&EventListScr_Ch11a_SelectDestination,
    (u32)&EventListScr_Ch11a_UnitMove,
    (u32)&EventListScr_Ch11a_Tutorial,
    (u32)&gUidebug_2 + 0x347,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x3D,
    (u32)&frontier_df4_banim_b_077_90DB94 + 0x288,
    (u32)&frontier_df4_banim_b_077_90DB94 + 0x288,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
extern const u32 Ch11EirikaMapChanges __attribute__((alias("Ch11EirikaMapChanges__shift")));
