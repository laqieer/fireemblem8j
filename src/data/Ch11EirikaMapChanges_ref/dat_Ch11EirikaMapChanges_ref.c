#include "global.h"

/* De-pointered from data/residual/Ch11EirikaMapChanges.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_08A5B424[];
extern const u8 frontier_df4_banim_b_077_90DB94[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_Ch11EirikaMapChanges_ref") static const u32 Ch11EirikaMapChanges__shift[] = {
    (u32)&data_08A5B424,
    (u32)&data_08A5B424 + 0x34,
    (u32)&data_08A5B424 + 0x58,
    (u32)&data_08A5B424 + 0xA4,
    (u32)&data_08A5B424 + 0xF0,
    (u32)&data_08A5B424 + 0xF4,
    (u32)&data_08A5B424 + 0xF8,
    (u32)&data_08A5B424 + 0xFC,
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
