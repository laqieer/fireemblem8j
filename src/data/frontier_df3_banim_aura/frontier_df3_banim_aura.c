#include "global.h"
#include "anime.h"

/* Migrated from asm/frontier_df3_banim_aura.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df3_banim_aura_000_7463DC[] __attribute__((section(".data.frontier_df3_banim_aura.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_000_7463DC.bin");
/* frontier_df3_banim_aura_001_74F150: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df3_banim_aura.gap1, \"aw\", %progbits\n"
"	.global frontier_df3_banim_aura_001_74F150\n"
"frontier_df3_banim_aura_001_74F150:\n"
"	.4byte 0x80000000, 0xFF840019, 0x0000FFF4, 0x00000001, 0x00000000, 0x00000000\n"
"	.4byte 0x80008000, 0xFF81001D, 0x0000FFF2, 0x40008000, 0xFF91001F, 0x0000FFF2\n"
"	.4byte 0x00008000, 0xFF990040, 0x0000FFF2, 0x00008000, 0xFF990041, 0x00000002\n"
"	.4byte 0x00000001, 0x00000000, 0x00000000, AnimScr_NaglfarBG4 + 0x2, AnimSpr_NaglfarOBJ_0 + 0x2, AnimSpr_NaglfarOBJ_1 + 0x2\n"
"	.4byte AnimSpr_NaglfarOBJ_2 + 0x2, AnimSpr_NaglfarOBJ_3 + 0x2, AnimSpr_NaglfarOBJ_4 + 0x2, AnimSpr_NaglfarOBJ_5 + 0x2, AnimSpr_NaglfarOBJ_6 + 0x2, AnimSpr_NaglfarOBJ_7 + 0x2\n"
"	.4byte AnimSpr_NaglfarOBJ_8 + 0x2, AnimSpr_NaglfarOBJ_9 + 0x2, AnimSpr_NaglfarOBJ_10 + 0x2, AnimSpr_NaglfarOBJ_11 + 0x2, AnimSpr_NaglfarOBJ_12 + 0x2, AnimSpr_NaglfarOBJ_13 + 0x2\n"
"	.4byte AnimSpr_NaglfarOBJ_14 + 0x2, AnimSpr_NaglfarOBJ_15 + 0x2, AnimSpr_NaglfarOBJ_16 + 0x2, AnimSpr_NaglfarOBJ_17 + 0x2, AnimSpr_NaglfarOBJ_18 + 0x2, AnimSpr_NaglfarOBJ_19 + 0x2\n"
"	.4byte AnimSpr_NaglfarOBJ_20 + 0x2, AnimSpr_NaglfarOBJ_21 + 0x2, AnimSpr_NaglfarOBJ_22 + 0x2, frontier_df3_banim_aura_001_74F150 + 0x2, frontier_df3_banim_aura_001_74F150 + 0x1A, 0x80000000\n"
);
u8 frontier_df3_banim_aura_002_74FD8C[] __attribute__((section(".data.frontier_df3_banim_aura.gap2"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_002_74FD8C.bin");
u8 frontier_df3_banim_aura_003_754840[] __attribute__((section(".data.frontier_df3_banim_aura.gap3"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_003_754840.bin");
u8 frontier_df3_banim_aura_004_7557C4[] __attribute__((section(".data.frontier_df3_banim_aura.gap4"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_004_7557C4.bin");
u8 frontier_df3_banim_aura_005_756454[] __attribute__((section(".data.frontier_df3_banim_aura.gap5"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_005_756454.bin");
u8 frontier_df3_banim_aura_006_756F38[] __attribute__((section(".data.frontier_df3_banim_aura.gap6"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_006_756F38.4bpp.lz");
u8 frontier_df3_banim_aura_007_758E68[] __attribute__((section(".data.frontier_df3_banim_aura.gap7"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_007_758E68.bin");
u8 frontier_df3_banim_aura_008_75CEFC[] __attribute__((section(".data.frontier_df3_banim_aura.gap8"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_008_75CEFC.4bpp.lz");
struct AnimSpriteData frontier_df3_banim_aura_009_75D570[] __attribute__((section(".data.frontier_df3_banim_aura.gap9"))) =
{
    { .header = (u32)(0x0003) | ((u32)0xFFFF << 16), .as = { .affine = { 0x0052, 0x0062, 0xFF9E, 0x0052 } } },
    { .header = (u32)(0x0003) | ((u32)0xFFFF << 16), .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0080 } } },
    { .header = (u32)(0x0003) | ((u32)0xFFFF << 16), .as = { .affine = { 0xFF93, 0xFF7E, 0xFF9E, 0x0052 } } },
    { .header = (u32)(0x0300) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -76, -27 } } },
    { .header = (u32)(0x0300) | ((u32)(0x8200) << 16), .as = { .object = { 0x000C, -33, -54 } } },
    { .header = (u32)(0x0300) | ((u32)(0x8400) << 16), .as = { .object = { 0x0008, 13, -30 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x0003) | ((u32)0xFFFF << 16), .as = { .affine = { 0x0052, 0x0062, 0xFF9E, 0x0052 } } },
    { .header = (u32)(0x0003) | ((u32)0xFFFF << 16), .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0080 } } },
    { .header = (u32)(0x0003) | ((u32)0xFFFF << 16), .as = { .affine = { 0xFF93, 0xFF7E, 0xFF9E, 0x0052 } } },
    { .header = (u32)(0x0300) | ((u32)(0x8000) << 16), .as = { .object = { 0x0000, -76, -27 } } },
    { .header = (u32)(0x0300) | ((u32)(0x8200) << 16), .as = { .object = { 0x000C, -33, -54 } } },
    { .header = (u32)(0x0300) | ((u32)(0x8400) << 16), .as = { .object = { 0x0008, 13, -30 } } },
    ANIM_SPRITE_END,
};
u8 frontier_df3_banim_aura_010_75DE94[] __attribute__((section(".data.frontier_df3_banim_aura.gap10"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_010_75DE94.bin", 0x0, 0x8C);
u8 data_0875DF20[] __attribute__((section(".data.frontier_df3_banim_aura.gap10"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_010_75DE94.bin", 0x8C, 0x1218);
u8 data_0875F138[] __attribute__((section(".data.frontier_df3_banim_aura.gap10"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_010_75DE94.bin", 0x12A4, 0x11CC);
u8 frontier_df3_banim_aura_011_761780[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x0, 0x9F0);
u8 data_08762170[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x9F0, 0x80);
u8 data_087621F0[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0xA70, 0x278);
u8 data_08762468[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0xCE8, 0x7EC);
u8 data_08762C54[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x14D4, 0x680);
u8 data_087632D4[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x1B54, 0x3C);
u8 data_08763310[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x1B90, 0x30C);
u8 data_0876361C[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x1E9C, 0x440);
u8 data_08763A5C[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x22DC, 0x54);
u8 data_08763AB0[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x2330, 0xC);
u8 data_08763ABC[] __attribute__((section(".data.frontier_df3_banim_aura.gap11"))) = INCBIN_U8("graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_011_761780.bin", 0x233C, 0x54);
