#include "global.h"

/* De-pointered from data/residual/Ch7EventData.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch7_BeginningScene[];
extern const u8 EventScr_Ch7_EndingScene[];
extern const u8 UnitDef_Event_Ch7Ally[];
extern const u8 data_08A5AF38[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch7EventData_ref") static const u32 Ch7EventData__shift[] = {
    (u32)&data_08A5AF38,
    (u32)&data_08A5AF38 + 0x10,
    (u32)&data_08A5AF38 + 0x14,
    (u32)&data_08A5AF38 + 0x3C,
    (u32)&data_08A5AF38 + 0x4C,
    (u32)&data_08A5AF38 + 0x50,
    (u32)&data_08A5AF38 + 0x54,
    (u32)&data_08A5AF38 + 0x58,
    (u32)&gUidebug_2 + 0x31F,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x33,
    (u32)&UnitDef_Event_Ch7Ally,
    (u32)&UnitDef_Event_Ch7Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch7_BeginningScene,
    (u32)&EventScr_Ch7_EndingScene,
};
__asm__(".global Ch7EventData\n\t.set Ch7EventData, Ch7EventData__shift\n");
