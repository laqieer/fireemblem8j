#include "global.h"

/* De-pointered from data/residual/Ch19EphraimEventData.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch19b_Turn[];
extern const u8 data_08A5D40C[];
extern const u8 frontier_df3_eventscr_ch_017_A6F47C[];
extern const u8 frontier_df3_unitdef_b_049_91E988[];
extern const u8 frontier_df3_unitdef_b_049_91E988_tail_p1[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch19EphraimEventData_ref") static const u32 Ch19EphraimEventData__shift[] = {
    (u32)&EventListScr_Ch19b_Turn,
    (u32)&EventListScr_Ch19b_Turn + 0x70,
    (u32)&EventListScr_Ch19b_Turn + 0x74,
    (u32)&data_08A5D40C + 0x8,
    (u32)&data_08A5D40C + 0x48,
    (u32)&data_08A5D40C + 0x4C,
    (u32)&data_08A5D40C + 0x50,
    (u32)&data_08A5D40C + 0x54,
    (u32)&gUidebug_2 + 0x649,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x69,
    (u32)&frontier_df3_unitdef_b_049_91E988_tail_p1,
    (u32)&frontier_df3_unitdef_b_049_91E988_tail_p1,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&frontier_df3_eventscr_ch_017_A6F47C + 0x15C,
    (u32)&frontier_df3_eventscr_ch_017_A6F47C + 0x1C4,
};
__asm__(".global Ch19EphraimEventData\n\t.set Ch19EphraimEventData, Ch19EphraimEventData__shift\n");
