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
/* frontier_df3_banim_mid_003_651C6C: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df3_banim_mid.gap3, \"aw\", %progbits\n"
"	.global frontier_df3_banim_mid_003_651C6C\n"
"frontier_df3_banim_mid_003_651C6C:\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_69 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_70 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_71 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_72 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_25 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_26 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_27 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_28 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_29 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_30 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_31 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_32 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_33 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_34 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_35 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_36 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_37 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_38 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_39 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_40 + 0x2, frontier_df3_banim_mid_001_6500B0 + 0x5E6, AnimSprite_EfxAlacaliburOBJ_Back_2 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_3 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_4 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_5 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_6 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_7 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_8 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_9 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_10 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_11 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_12 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_13 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_14 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_15 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_16 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_17 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_18 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_19 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_20 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_21 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_22 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_23 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_24 + 0x1, 0x81000000, AnimSprite_EfxAlacaliburOBJ_Back_69 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_70 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_71 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_72 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_25 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_26 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_27 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_28 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_29 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_30 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_31 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_32 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_33 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_34 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_35 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_36 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_37 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_38 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_39 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_40 + 0x1, frontier_df3_banim_mid_002_651204 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_43 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_46 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_47 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_48 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_49 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_50 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_51 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_52 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_53 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_54 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_55 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_56 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_57 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_58 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_59 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_60 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_61 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_62 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_63 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_64 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_65 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_66 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_67 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_68 + 0x1\n"
"	.4byte 0x81000000, 0xFFFF0001, 0xFF80FF23, 0x00DDFF80, 0x80000100, 0xFFA80000\n"
"	.4byte 0x0000FFE0, 0x00000001, 0x00000000, 0x00000000\n"
);
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
