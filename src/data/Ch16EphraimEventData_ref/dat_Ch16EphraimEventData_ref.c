#include "global.h"

/* De-pointered from data/residual/Ch16EphraimEventData.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch16b_Location[];
extern const u8 EventScr_Ch16b_BeginningScene[];
extern const u8 UnitDef_Ch17BAlly_0[];
extern const u8 data_08A5CFA0[];
extern const u8 data_08A5D0E4[];
extern const u8 frontier_df3_unitdef_b_042_91C230[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch16EphraimEventData_ref") static const u32 Ch16EphraimEventData__shift[] = {
    (u32)&data_08A5CFA0,
    (u32)&data_08A5CFA0 + 0xAC,
    (u32)&EventListScr_Ch16b_Location,
    (u32)&EventListScr_Ch16b_Location + 0x1C,
    (u32)&EventListScr_Ch16b_Location + 0x5C,
    (u32)&EventListScr_Ch16b_Location + 0x60,
    (u32)&data_08A5D0E4,
    (u32)&data_08A5D0E4 + 0x4,
    (u32)&gUidebug_2 + 0x4E4,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x66,
    (u32)&UnitDef_Ch17BAlly_0,
    (u32)&UnitDef_Ch17BAlly_0,
    (u32)&frontier_df3_unitdef_b_042_91C230 + 0x348,
    (u32)&frontier_df3_unitdef_b_042_91C230 + 0x668,
    (u32)&frontier_df3_unitdef_b_042_91C230 + 0x988,
    (u32)&frontier_df3_unitdef_b_042_91C230 + 0x410,
    (u32)&frontier_df3_unitdef_b_042_91C230 + 0x730,
    (u32)&frontier_df3_unitdef_b_042_91C230 + 0xA50,
    (u32)&EventScr_Ch16b_BeginningScene,
    (u32)&EventScr_Ch16b_BeginningScene + 0x18,
};
extern const u32 Ch16EphraimEventData __attribute__((alias("Ch16EphraimEventData__shift")));
