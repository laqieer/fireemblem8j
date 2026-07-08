#include "global.h"

/* De-pointered from data/residual/TileAnimations2.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 TileAnimations2_frame_0[];
extern const u8 TileAnimations2_frame_1[];
extern const u8 TileAnimations2_frame_10[];
extern const u8 TileAnimations2_frame_11[];
extern const u8 TileAnimations2_frame_12[];
extern const u8 TileAnimations2_frame_13[];
extern const u8 TileAnimations2_frame_14[];
extern const u8 TileAnimations2_frame_15[];
extern const u8 TileAnimations2_frame_2[];
extern const u8 TileAnimations2_frame_3[];
extern const u8 TileAnimations2_frame_4[];
extern const u8 TileAnimations2_frame_5[];
extern const u8 TileAnimations2_frame_6[];
extern const u8 TileAnimations2_frame_7[];
extern const u8 TileAnimations2_frame_8[];
extern const u8 TileAnimations2_frame_9[];
extern const u8 TileAnimationsUnused1_frame_0[];
extern const u8 TileAnimationsUnused1_frame_1[];
extern const u8 TileAnimationsUnused1_frame_10[];
extern const u8 TileAnimationsUnused1_frame_11[];
extern const u8 TileAnimationsUnused1_frame_12[];
extern const u8 TileAnimationsUnused1_frame_13[];
extern const u8 TileAnimationsUnused1_frame_14[];
extern const u8 TileAnimationsUnused1_frame_15[];
extern const u8 TileAnimationsUnused1_frame_2[];
extern const u8 TileAnimationsUnused1_frame_3[];
extern const u8 TileAnimationsUnused1_frame_4[];
extern const u8 TileAnimationsUnused1_frame_5[];
extern const u8 TileAnimationsUnused1_frame_6[];
extern const u8 TileAnimationsUnused1_frame_7[];
extern const u8 TileAnimationsUnused1_frame_8[];
extern const u8 TileAnimationsUnused1_frame_9[];

SECTION(".rodata.dat_TileAnimations2_ref") static const u32 TileAnimations2__shift[] = {
    0x1000001C,
    (u32)&TileAnimations2_frame_0,
    0x1000001C,
    (u32)&TileAnimations2_frame_1,
    0x1000001C,
    (u32)&TileAnimations2_frame_2,
    0x1000001C,
    (u32)&TileAnimations2_frame_3,
    0x1000001C,
    (u32)&TileAnimations2_frame_4,
    0x1000001C,
    (u32)&TileAnimations2_frame_5,
    0x1000001C,
    (u32)&TileAnimations2_frame_6,
    0x1000001C,
    (u32)&TileAnimations2_frame_7,
    0x1000001C,
    (u32)&TileAnimations2_frame_8,
    0x1000001C,
    (u32)&TileAnimations2_frame_9,
    0x1000001C,
    (u32)&TileAnimations2_frame_10,
    0x1000001C,
    (u32)&TileAnimations2_frame_11,
    0x1000001C,
    (u32)&TileAnimations2_frame_12,
    0x1000001C,
    (u32)&TileAnimations2_frame_13,
    0x1000001C,
    (u32)&TileAnimations2_frame_14,
    0x1000001C,
    (u32)&TileAnimations2_frame_15,
    0x00000000,
    0x00000000,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_0,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_1,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_2,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_3,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_4,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_5,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_6,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_7,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_8,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_9,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_10,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_11,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_12,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_13,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_14,
    0x1000001C,
    (u32)&TileAnimationsUnused1_frame_15,
    0x00000000,
    0x00000000,
};
extern const u32 TileAnimations2 __attribute__((alias("TileAnimations2__shift")));
