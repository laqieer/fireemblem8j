#include "global.h"

/* De-pointered from data/residual/gClassReelOrderedLut.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 frontier_df4_menu_035_AB0830[];
extern const u8 gClassReelData[];

SECTION(".rodata.dat_gClassReelOrderedLut_ref") static const u32 gClassReelOrderedLut__shift[] = {
    (u32)&gClassReelData + 0x444,
    (u32)&frontier_df4_menu_035_AB0830 + 0x160,
    (u32)&gClassReelData + 0x310,
    (u32)&frontier_df4_menu_035_AB0830 + 0x17C,
    (u32)&frontier_df4_menu_035_AB0830 + 0x198,
    (u32)&gClassReelData + 0x4D0,
    (u32)&frontier_df4_menu_035_AB0830 + 0xD4,
    (u32)&frontier_df4_menu_035_AB0830 + 0xF0,
    (u32)&frontier_df4_menu_035_AB0830 + 0x10C,
    (u32)&frontier_df4_menu_035_AB0830 + 0x128,
    (u32)&frontier_df4_menu_035_AB0830 + 0x144,
    (u32)&frontier_df4_menu_035_AB0830 + 0x1B4,
    (u32)&frontier_df4_menu_035_AB0830 + 0x48,
    (u32)&frontier_df4_menu_035_AB0830 + 0x64,
    (u32)&frontier_df4_menu_035_AB0830 + 0x80,
    (u32)&frontier_df4_menu_035_AB0830 + 0x9C,
    (u32)&frontier_df4_menu_035_AB0830 + 0xB8,
    (u32)&gClassReelData + 0x4EC,
    (u32)&gClassReelData + 0x460,
    (u32)&gClassReelData + 0x498,
    (u32)&gClassReelData + 0x4B4,
    (u32)&frontier_df4_menu_035_AB0830 + 0x10,
    (u32)&frontier_df4_menu_035_AB0830 + 0x2C,
    (u32)&gClassReelData + 0x508,
    (u32)&gClassReelData + 0x348,
    (u32)&gClassReelData + 0x364,
    (u32)&gClassReelData + 0x380,
    (u32)&gClassReelData + 0x39C,
    (u32)&gClassReelData + 0x16C,
    (u32)&gClassReelData + 0x284,
    (u32)&gClassReelData + 0x2A0,
    (u32)&gClassReelData + 0x2BC,
    (u32)&gClassReelData + 0x2D8,
    (u32)&frontier_df4_menu_035_AB0830 + 0x1EC,
    (u32)&gClassReelData + 0x428,
    (u32)&gClassReelData + 0x3B8,
    (u32)&gClassReelData + 0x3D4,
    (u32)&gClassReelData + 0x3F0,
    (u32)&gClassReelData + 0x40C,
    (u32)&gClassReelData + 0x47C,
    (u32)&frontier_df4_menu_035_AB0830 + 0x1D0,
    (u32)&gClassReelData + 0x1DC,
    (u32)&gClassReelData + 0x1F8,
    (u32)&gClassReelData + 0x214,
    (u32)&gClassReelData + 0x230,
    (u32)&gClassReelData + 0x24C,
    (u32)&gClassReelData + 0x268,
    (u32)&gClassReelData + 0xA8,
    (u32)&gClassReelData + 0xC4,
    (u32)&gClassReelData + 0xE0,
    (u32)&gClassReelData + 0xFC,
    (u32)&gClassReelData + 0x118,
    (u32)&gClassReelData + 0x134,
    (u32)&gClassReelData,
    (u32)&gClassReelData + 0x1C,
    (u32)&gClassReelData + 0x38,
    (u32)&gClassReelData + 0x54,
    (u32)&gClassReelData + 0x70,
    (u32)&gClassReelData + 0x8C,
    (u32)&gClassReelData + 0x150,
    (u32)&gClassReelData + 0x188,
    (u32)&gClassReelData + 0x1A4,
    (u32)&gClassReelData + 0x1C0,
    (u32)&gClassReelData + 0x32C,
    0x00000000,
};
__asm__(".global gClassReelOrderedLut\n\t.set gClassReelOrderedLut, gClassReelOrderedLut__shift\n");
