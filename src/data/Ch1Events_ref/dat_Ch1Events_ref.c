#include "global.h"

/* De-pointered from data/residual/Ch1Events.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch1_Character[];
extern const u8 EventScr_Ch1_BeginningScene[];
extern const u8 EventScr_Ch1_EndingScene[];
extern const u8 UnitDef_Event_Ch1Ally[];
extern const u8 data_08A5A7B0[];
extern const u8 data_08A5A828[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch1Events_ref") static const u32 Ch1Events__shift[] = {
    (u32)&data_08A5A7B0,
    (u32)&EventListScr_Ch1_Character,
    (u32)&data_08A5A828,
    (u32)&data_08A5A828 + 0x28,
    (u32)&data_08A5A828 + 0x50,
    (u32)&data_08A5A828 + 0x54,
    (u32)&data_08A5A828 + 0x58,
    (u32)&data_08A5A828 + 0x5C,
    (u32)&gUidebug_2 + 0x313,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x27,
    (u32)&UnitDef_Event_Ch1Ally,
    (u32)&UnitDef_Event_Ch1Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch1_BeginningScene,
    (u32)&EventScr_Ch1_EndingScene,
};
__asm__(".global Ch1Events\n\t.set Ch1Events, Ch1Events__shift\n");
