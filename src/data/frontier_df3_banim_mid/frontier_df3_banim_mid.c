#include "global.h"
#include "anime.h"

/* Migrated from asm/frontier_df3_banim_mid.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df3_banim_mid_000_64D2B4[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000_64D2B4.bin");
u8 frontier_df3_banim_mid_001_6500B0[] __attribute__((section(".data.frontier_df3_banim_mid.gap1"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_001_6500B0.bin");
struct AnimSpriteData frontier_df3_banim_mid_002_651204[] __attribute__((section(".data.frontier_df3_banim_mid.gap2"))) =
{
    { .header = (u32)(0x0001) | ((u32)0xFFFF << 16), .as = { .affine = { 0x00DD, 0xFF80, 0x0080, 0x00DD } } },
    { .header = (u32)(0x0100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, 56, -32 } } },
    ANIM_SPRITE_END,
};
u8 frontier_df3_banim_mid_003_651C6C[] __attribute__((section(".data.frontier_df3_banim_mid.gap3"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_003_651C6C.bin");
struct AnimSpriteData frontier_df3_banim_mid_004_652948[] __attribute__((section(".data.frontier_df3_banim_mid.gap4"))) =
{
    { .header = (u32)(0x0001) | ((u32)0xFFFF << 16), .as = { .affine = { 0xFF23, 0xFF80, 0xFF80, 0x00DD } } },
    { .header = (u32)(0x0100) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -88, -32 } } },
    ANIM_SPRITE_END,
};
u8 frontier_df3_banim_mid_005_6533B0[] __attribute__((section(".data.frontier_df3_banim_mid.gap5"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_005_6533B0.bin");
u8 frontier_df3_banim_mid_006_654DFC[] __attribute__((section(".data.frontier_df3_banim_mid.gap6"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_006_654DFC.4bpp.lz");
u8 frontier_df3_banim_mid_007_656EA8[] __attribute__((section(".data.frontier_df3_banim_mid.gap7"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_007_656EA8.gbapal");
u8 frontier_df3_banim_mid_008_657A78[] __attribute__((section(".data.frontier_df3_banim_mid.gap8"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008_657A78.bin");
u8 frontier_df3_banim_mid_009_6587E0[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009_6587E0.bin");
