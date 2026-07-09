#include "global.h"

/* De-pointered from data/residual/LagdouRuins5MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 UnitDef_Ruin5Ally[];
extern const u8 dat_gChDAsset_08A5DE70_ref[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_LagdouRuins5MapChanges_ref") static const u32 LagdouRuins5MapChanges__shift[] = {
    (u32)&dat_gChDAsset_08A5DE70_ref + 0x60,
    (u32)&dat_gChDAsset_08A5DE70_ref + 0x88,
    (u32)&dat_gChDAsset_08A5DE70_ref + 0x8C,
    (u32)&dat_gChDAsset_08A5DE70_ref + 0xB4,
    (u32)&dat_gChDAsset_08A5DE70_ref + 0xD0,
    (u32)&dat_gChDAsset_08A5DE70_ref + 0xD4,
    (u32)&dat_gChDAsset_08A5DE70_ref + 0xD8,
    (u32)&dat_gChDAsset_08A5DE70_ref + 0xDC,
    (u32)&gUidebug_2 + 0x664,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x78,
    (u32)&UnitDef_Ruin5Ally,
    (u32)&UnitDef_Ruin5Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
extern const u32 LagdouRuins5MapChanges __attribute__((alias("LagdouRuins5MapChanges__shift")));
