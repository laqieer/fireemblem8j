#include "global.h"

/* De-pointered from data/residual/PrologueEvents.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventListScr_Prologue_Tutorial[];
extern const u8 EventScr_Prologue_BeginningScene[];
extern const u8 EventScr_Prologue_EndingScene[];
extern const u8 data_08A5A6AD[];
extern const u8 frontier_df4_banim_b_073_907F78[];
extern const u8 frontier_df4_menu_005_A5FFAD[];
extern const u8 gUidebug_2[];

SECTION(".rodata.dat_PrologueEvents_ref") static const u32 PrologueEvents__shift[] = {
    (u32)&data_08A5A6AD + 0x3,
    (u32)&data_08A5A6AD + 0x37,
    (u32)&data_08A5A6AD + 0x3B,
    (u32)&data_08A5A6AD + 0x3F,
    (u32)&data_08A5A6AD + 0x67,
    (u32)&data_08A5A6AD + 0x6B,
    (u32)&data_08A5A6AD + 0x6F,
    (u32)&EventListScr_Prologue_Tutorial,
    (u32)&gUidebug_2 + 0x310,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x24,
    (u32)&frontier_df4_banim_b_073_907F78 + 0x224,
    (u32)&frontier_df4_banim_b_073_907F78 + 0x224,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Prologue_BeginningScene,
    (u32)&EventScr_Prologue_EndingScene,
};
extern const u32 PrologueEvents __attribute__((alias("PrologueEvents__shift")));
