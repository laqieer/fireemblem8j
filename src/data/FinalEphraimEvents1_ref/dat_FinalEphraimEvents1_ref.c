#include "global.h"

/* De-pointered from data/residual/FinalEphraimEvents1.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch21b_BeginningScene[];
extern const u8 data_08A5D5C0[];
extern const u8 frontier_df3_unitdef_b_053_91FAF4[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_FinalEphraimEvents1_ref") static const u32 FinalEphraimEvents1__shift[] = {
    (u32)&data_08A5D5C0,
    (u32)&data_08A5D5C0 + 0x4,
    (u32)&data_08A5D5C0 + 0x8,
    (u32)&data_08A5D5C0 + 0xC,
    (u32)&data_08A5D5C0 + 0x28,
    (u32)&data_08A5D5C0 + 0x2C,
    (u32)&data_08A5D5C0 + 0x30,
    (u32)&data_08A5D5C0 + 0x34,
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
__asm__(".global FinalEphraimEvents1\n\t.set FinalEphraimEvents1, FinalEphraimEvents1__shift\n");
