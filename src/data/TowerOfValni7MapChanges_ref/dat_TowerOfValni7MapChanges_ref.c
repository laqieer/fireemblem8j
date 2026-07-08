#include "global.h"

/* De-pointered from data/residual/TowerOfValni7MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 TowerOfValni6MapChanges[];
extern const u8 UnitDef_Tower7Ally[];
extern const u8 data_08A5DA90[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_TowerOfValni7MapChanges_ref") static const u32 TowerOfValni7MapChanges__shift[] = {
    (u32)&TowerOfValni6MapChanges + 0x50,
    (u32)&TowerOfValni6MapChanges + 0x78,
    (u32)&TowerOfValni6MapChanges + 0x7C,
    (u32)&TowerOfValni6MapChanges + 0x80,
    (u32)&data_08A5DA90,
    (u32)&data_08A5DA90 + 0x4,
    (u32)&data_08A5DA90 + 0x8,
    (u32)&data_08A5DA90 + 0xC,
    (u32)&gUidebug_2 + 0x652,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x72,
    (u32)&UnitDef_Tower7Ally,
    (u32)&UnitDef_Tower7Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
extern const u32 TowerOfValni7MapChanges __attribute__((alias("TowerOfValni7MapChanges__shift")));
