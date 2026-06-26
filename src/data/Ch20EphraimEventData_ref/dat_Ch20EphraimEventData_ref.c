#include "global.h"

/* De-pointered from data/residual/Ch20EphraimEventData.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Ch20b_Turn[];
extern const u8 EventScr_Ch20b_BeginningScene[];
extern const u8 EventScr_Ch21b_EndingScene[];
extern const u8 UnitDef_Ch21BAlly[];
extern const u8 data_08A5D524[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch20EphraimEventData_ref") static const u32 Ch20EphraimEventData__shift[] = {
    (u32)&EventListScr_Ch20b_Turn,
    (u32)&EventListScr_Ch20b_Turn + 0x28,
    (u32)&EventListScr_Ch20b_Turn + 0x2C,
    (u32)&EventListScr_Ch20b_Turn + 0x60,
    (u32)&data_08A5D524 + 0x3C,
    (u32)&data_08A5D524 + 0x40,
    (u32)&data_08A5D524 + 0x44,
    (u32)&data_08A5D524 + 0x48,
    (u32)&gUidebug_2 + 0x64A,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x6A,
    (u32)&UnitDef_Ch21BAlly,
    (u32)&UnitDef_Ch21BAlly,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch20b_BeginningScene,
    (u32)&EventScr_Ch21b_EndingScene,
};
__asm__(".global Ch20EphraimEventData\n\t.set Ch20EphraimEventData, Ch20EphraimEventData__shift\n");
