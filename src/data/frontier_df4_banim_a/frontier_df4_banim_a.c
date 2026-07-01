#include "global.h"
#include "anime.h"

/* Migrated from asm/frontier_df4_banim_a.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df4_banim_a_000_5E0E94[] __attribute__((section(".data.frontier_df4_banim_a.gap0"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_000_5E0E94.bin");
u8 frontier_df4_banim_a_001_5E37CC[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_001_5E37CC.bin", 0x0, 0x18);
u8 data_085E37E4[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_001_5E37CC.bin", 0x18, 0x28);
u8 data_085E380C[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_001_5E37CC.bin", 0x40, 0x60);
u8 data_085E386C[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_001_5E37CC.bin", 0xA0, 0x240);
u8 frontier_df4_banim_a_002_5E3AD4[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_002_5E3AD4.bin", 0x0, 0xA0);
u8 data_085E3B74[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_002_5E3AD4.bin", 0xA0, 0x50);
u8 data_085E3BC4[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_002_5E3AD4.bin", 0xF0, 0x28);
u8 data_085E3BEC[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_002_5E3AD4.bin", 0x118, 0x28);
u8 data_085E3C14[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_002_5E3AD4.bin", 0x140, 0x28);
u8 data_085E3C3C[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_002_5E3AD4.bin", 0x168, 0x44C);
u8 frontier_df4_banim_a_003_5E4570[] __attribute__((section(".data.frontier_df4_banim_a.gap3"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_003_5E4570.4bpp.lz");
u8 frontier_df4_banim_a_004_5E4E84[] __attribute__((section(".data.frontier_df4_banim_a.gap4"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_004_5E4E84.4bpp.lz");
u8 frontier_df4_banim_a_005_5EA510[] __attribute__((section(".data.frontier_df4_banim_a.gap5"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_005_5EA510.4bpp.lz");
u8 frontier_df4_banim_a_006_5EBF04[] __attribute__((section(".data.frontier_df4_banim_a.gap6"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_006_5EBF04.4bpp.lz");
struct AnimSpriteData frontier_df4_banim_a_007_5F1C3C[] __attribute__((section(".data.frontier_df4_banim_a.gap7"))) =
{
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -17 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -18 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -17 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -18 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -17 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -17 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -16 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -17 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -18 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -17 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -16 } } },
    ANIM_SPRITE_END,
};
u8 frontier_df4_banim_a_008_5FE7D8[] __attribute__((section(".data.frontier_df4_banim_a.gap8"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_008_5FE7D8.bin");
u8 frontier_df4_banim_a_009_5FF000[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x0, 0x1C0);
u8 data_085FF1C0[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x1C0, 0x78);
u8 data_085FF238[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x238, 0x38);
u8 data_085FF270[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x270, 0x98);
u8 data_085FF308[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x308, 0x200);
u8 data_085FF508[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x508, 0x18);
u8 data_085FF520[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x520, 0x18);
u8 data_085FF538[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x538, 0x20);
u8 data_085FF558[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x558, 0x98);
u8 data_085FF5F0[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x5F0, 0x38);
u8 data_085FF628[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_009_5FF000.bin", 0x628, 0x140);
u8 frontier_df4_banim_a_010_5FF7C8[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_010_5FF7C8.bin", 0x0, 0x128);
u8 data_085FF8F0[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_010_5FF7C8.bin", 0x128, 0x228);
u8 frontier_df4_banim_a_011_5FFBA0[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_011_5FFBA0.bin", 0x0, 0x9F4);
u8 data_08600594[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_011_5FFBA0.bin", 0x9F4, 0x1A8);
u8 frontier_df4_banim_a_012_600754[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_012_600754.bin", 0x0, 0x664);
u8 data_08600DB8[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_012_600754.bin", 0x664, 0x248);
u8 data_08601000[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_012_600754.bin", 0x8AC, 0x108);
u8 data_08601108[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_012_600754.bin", 0x9B4, 0x1C0);
u8 frontier_df4_banim_a_013_601630[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x0, 0xD0);
u8 data_08601700[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0xD0, 0x48);
u8 data_08601748[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x118, 0x60);
u8 data_086017A8[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x178, 0x18);
u8 data_086017C0[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x190, 0x1B8);
u8 data_08601978[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x348, 0x48);
u8 data_086019C0[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x390, 0x20);
u8 data_086019E0[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x3B0, 0x18);
u8 data_086019F8[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x3C8, 0x48);
u8 data_08601A40[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x410, 0x128);
u8 data_08601B68[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x538, 0x30);
u8 data_08601B98[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x568, 0xD0);
u8 data_08601C68[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x638, 0x38);
u8 data_08601CA0[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_013_601630.bin", 0x670, 0x20);
/* frontier_df4_banim_a_014_601CD8: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_banim_a.gap14, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_014_601CD8\n"
"frontier_df4_banim_a_014_601CD8:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0x3, 0x00000003, efxIvaldi_Loop_Main + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xF, 0x00000003, efxIvaldiBG2_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Tsa_IvaldiBg1_0, Tsa_IvaldiBg1_1, Tsa_IvaldiBg1_2, Tsa_IvaldiBg1_3, Tsa_IvaldiBg1_4, Tsa_IvaldiBg1_5\n"
"	.4byte Tsa_IvaldiBg1_6, Tsa_IvaldiBg1_7, Tsa_IvaldiBg1_8, Tsa_IvaldiBg1_9, Tsa_IvaldiBg1_10, Tsa_IvaldiBg1_11\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0x4F, 0x00000003, sub_8067EA4 + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Tsa_IvaldiBg2_0, Tsa_IvaldiBg2_1, Tsa_IvaldiBg2_2, Tsa_IvaldiBg2_3, Tsa_IvaldiBg2_4, 0x00000001\n"
"	.4byte frontier_df4_misc_lo_009_0E37C5 + 0x7B, 0x00000003, sub_8067F68 + 0x1, 0x00000000, 0x00000000, Tsa_IvaldiBg3_0\n"
"	.4byte Tsa_IvaldiBg3_1, Tsa_IvaldiBg3_2, Tsa_IvaldiBg3_3, Tsa_IvaldiBg3_4, Tsa_IvaldiBg3_5, Tsa_IvaldiBg3_6\n"
"	.4byte Tsa_IvaldiBg3_7, Tsa_IvaldiBg3_8, Tsa_IvaldiBg3_9, Tsa_IvaldiBg3_10, Img_IvaldiBg3_0, Img_IvaldiBg3_1\n"
"	.4byte Img_IvaldiBg3_2, Img_IvaldiBg3_3, Img_IvaldiBg3_4, Img_IvaldiBg3_5, Img_IvaldiBg3_6, Img_IvaldiBg3_7\n"
"	.4byte Img_IvaldiBg3_8, Img_IvaldiBg3_9, Img_IvaldiBg3_10, Pal_IvaldiBg3_0, Pal_IvaldiBg3_1, Pal_IvaldiBg3_2\n"
"	.4byte Pal_IvaldiBg3_3, Pal_IvaldiBg3_4, Pal_IvaldiBg3_5, Pal_IvaldiBg3_6, Pal_IvaldiBg3_7, Pal_IvaldiBg3_8\n"
"	.4byte Pal_IvaldiBg3_9, Pal_IvaldiBg3_10, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xB7, 0x00000003, efxIvaldiBG4_Loop + 0x1\n"
"	.4byte 0x00000000, 0x00000000, Tsa_IvaldiBg4, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xCB, 0x00000003\n"
"	.4byte efxIvaldiOBJFall_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xDF, 0x00000003\n"
"	.4byte efxIvaldiOBJSideWash_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xF7, 0x00000003\n"
"	.4byte efxIvaldiOBJUprise_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0x10B, 0x00000003\n"
"	.4byte efxIvaldiOBJ1_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009aa_0E3910, 0x00000003\n"
"	.4byte efxIvaldiOBJ2_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009ab_0E3928, 0x00000003\n"
"	.4byte sub_8068850 + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x10, 0x00000003\n"
"	.4byte efxMaohFlash_Loop_Main + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x20, 0x00000003\n"
"	.4byte efxIvaldiBG3_Loop + 0x1, 0x00000000, 0x00000000, Tsa_DemonLightBg_Close_1, Tsa_DemonLightBg_Close_2, Tsa_DemonLightBg_Close_3\n"
"	.4byte Tsa_DemonLightBg_Close_4, Tsa_DemonLightBg_Close_5, Tsa_DemonLightBg_Close_6, Tsa_DemonLightBg_Close_7, Tsa_DemonLightBg_Close_8, Tsa_DemonLightBg_Close_9\n"
"	.4byte Tsa_DemonLightBg_Close_10, Tsa_DemonLightBg_Close_11, Tsa_DemonLightBg_Close_12, Tsa_DemonLightBg_Close_13, Tsa_DemonLightBg_Close_14, Tsa_DemonLightBg_Close_15\n"
"	.4byte Tsa_DemonLightBg_Close_16, Tsa_DemonLightBg_Close_17, Tsa_DemonLightBg_Close_18, Tsa_DemonLightBg_Close_19, Tsa_DemonLightBg_Close_20, Tsa_DemonLightBg_Close_21\n"
"	.4byte Tsa_DemonLightBg_Close_22, Tsa_DemonLightBg_Close_23, Tsa_DemonLightBg_Close_24, Tsa_DemonLightBg_Close_25, Tsa_DemonLightBg_Close_26, Tsa_DemonLightBg_Close_27\n"
"	.4byte Tsa_DemonLightBg_Close_28, Tsa_DemonLightBg_Close_29, Tsa_DemonLightBg_Close_30, Tsa_DemonLightBg_Close_31, Tsa_DemonLightBg_Close_32, Img_DemonLightBg_Close_1\n"
"	.4byte Img_DemonLightBg_Close_2, Img_DemonLightBg_Close_3, Img_DemonLightBg_Close_4, Img_DemonLightBg_Close_5, Img_DemonLightBg_Close_6, Img_DemonLightBg_Close_7\n"
"	.4byte Img_DemonLightBg_Close_8, Img_DemonLightBg_Close_9, Img_DemonLightBg_Close_10, Img_DemonLightBg_Close_11, Img_DemonLightBg_Close_12, Img_DemonLightBg_Close_13\n"
"	.4byte Img_DemonLightBg_Close_14, Img_DemonLightBg_Close_15, Img_DemonLightBg_Close_16, Img_DemonLightBg_Close_17, Img_DemonLightBg_Close_18, Img_DemonLightBg_Close_19\n"
"	.4byte Img_DemonLightBg_Close_20, Img_DemonLightBg_Close_21, Img_DemonLightBg_Close_22, Img_DemonLightBg_Close_23, Img_DemonLightBg_Close_24, Img_DemonLightBg_Close_25\n"
"	.4byte Img_DemonLightBg_Close_26, Img_DemonLightBg_Close_27, Img_DemonLightBg_Close_28, Img_DemonLightBg_Close_29, Img_DemonLightBg_Close_30, Img_DemonLightBg_Close_31\n"
"	.4byte Img_DemonLightBg_Close_32, Pal_DemonLightBg_Close_1, Pal_DemonLightBg_Close_2, Pal_DemonLightBg_Close_3, Pal_DemonLightBg_Close_4, Pal_DemonLightBg_Close_5\n"
"	.4byte Pal_DemonLightBg_Close_6, Pal_DemonLightBg_Close_7, Pal_DemonLightBg_Close_8, Pal_DemonLightBg_Close_9, Pal_DemonLightBg_Close_10, Pal_DemonLightBg_Close_11\n"
"	.4byte Pal_DemonLightBg_Close_12, Pal_DemonLightBg_Close_13, Pal_DemonLightBg_Close_14, Pal_DemonLightBg_Close_15, Pal_DemonLightBg_Close_16, Pal_DemonLightBg_Close_17\n"
"	.4byte Pal_DemonLightBg_Close_18, Pal_DemonLightBg_Close_19, Pal_DemonLightBg_Close_20, Pal_DemonLightBg_Close_21, Pal_DemonLightBg_Close_22, Pal_DemonLightBg_Close_23\n"
"	.4byte Pal_DemonLightBg_Close_24, Pal_DemonLightBg_Close_25, Pal_DemonLightBg_Close_26, Pal_DemonLightBg_Close_27, Pal_DemonLightBg_Close_28, Pal_DemonLightBg_Close_29\n"
"	.4byte Pal_DemonLightBg_Close_30, Pal_DemonLightBg_Close_31, Pal_DemonLightBg_Close_32, Tsa_DemonLightBg_Far_1, Tsa_DemonLightBg_Far_2, Tsa_DemonLightBg_Far_3\n"
"	.4byte Tsa_DemonLightBg_Far_4, Tsa_DemonLightBg_Far_5, Tsa_DemonLightBg_Far_6, Tsa_DemonLightBg_Far_7, Tsa_DemonLightBg_Far_8, Tsa_DemonLightBg_Far_9\n"
"	.4byte Tsa_DemonLightBg_Far_10, Tsa_DemonLightBg_Far_11, Tsa_DemonLightBg_Far_12, Tsa_DemonLightBg_Far_13, Tsa_DemonLightBg_Far_14, Tsa_DemonLightBg_Far_15\n"
"	.4byte Tsa_DemonLightBg_Far_16, Tsa_DemonLightBg_Far_17, Tsa_DemonLightBg_Far_18, Tsa_DemonLightBg_Far_19, Tsa_DemonLightBg_Far_20, Tsa_DemonLightBg_Far_21\n"
"	.4byte Tsa_DemonLightBg_Far_22, Tsa_DemonLightBg_Far_23, Tsa_DemonLightBg_Far_24, Tsa_DemonLightBg_Far_25, Tsa_DemonLightBg_Far_26, Tsa_DemonLightBg_Far_27\n"
"	.4byte Tsa_DemonLightBg_Far_28, Tsa_DemonLightBg_Far_29, Tsa_DemonLightBg_Far_30, Tsa_DemonLightBg_Far_31, Tsa_DemonLightBg_Far_32, Img_DemonLightBg_Far_1\n"
"	.4byte Img_DemonLightBg_Far_2, Img_DemonLightBg_Far_3, Img_DemonLightBg_Far_4, Img_DemonLightBg_Far_5, Img_DemonLightBg_Far_6, Img_DemonLightBg_Far_7\n"
"	.4byte Img_DemonLightBg_Far_8, Img_DemonLightBg_Far_9, Img_DemonLightBg_Far_10, Img_DemonLightBg_Far_11, Img_DemonLightBg_Far_12, Img_DemonLightBg_Far_13\n"
"	.4byte Img_DemonLightBg_Far_14, Img_DemonLightBg_Far_15, Img_DemonLightBg_Far_16, Img_DemonLightBg_Far_17, Img_DemonLightBg_Far_18, Img_DemonLightBg_Far_19\n"
"	.4byte Img_DemonLightBg_Far_20, Img_DemonLightBg_Far_21, Img_DemonLightBg_Far_22, Img_DemonLightBg_Far_23, Img_DemonLightBg_Far_24, Img_DemonLightBg_Far_25\n"
"	.4byte Img_DemonLightBg_Far_26, Img_DemonLightBg_Far_27, Img_DemonLightBg_Far_28, Img_DemonLightBg_Far_29, Img_DemonLightBg_Far_30, Img_DemonLightBg_Far_31\n"
"	.4byte Img_DemonLightBg_Far_32, Pal_DemonLightBg_Far_1, Pal_DemonLightBg_Far_2, Pal_DemonLightBg_Far_3, Pal_DemonLightBg_Far_4, Pal_DemonLightBg_Far_5\n"
"	.4byte Pal_DemonLightBg_Far_6, Pal_DemonLightBg_Far_7, Pal_DemonLightBg_Far_8, Pal_DemonLightBg_Far_9, Pal_DemonLightBg_Far_10, Pal_DemonLightBg_Far_11\n"
"	.4byte Pal_DemonLightBg_Far_12, Pal_DemonLightBg_Far_13, Pal_DemonLightBg_Far_14, Pal_DemonLightBg_Far_15, Pal_DemonLightBg_Far_16, Pal_DemonLightBg_Far_17\n"
"	.4byte Pal_DemonLightBg_Far_18, Pal_DemonLightBg_Far_19, Pal_DemonLightBg_Far_20, Pal_DemonLightBg_Far_21, Pal_DemonLightBg_Far_22, Pal_DemonLightBg_Far_23\n"
"	.4byte Pal_DemonLightBg_Far_24, Pal_DemonLightBg_Far_25, Pal_DemonLightBg_Far_26, Pal_DemonLightBg_Far_27, Pal_DemonLightBg_Far_28, Pal_DemonLightBg_Far_29\n"
"	.4byte Pal_DemonLightBg_Far_30, Pal_DemonLightBg_Far_31, Pal_DemonLightBg_Far_32, 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0xB4, 0x00000003\n"
"	.4byte efxMaohFlashBG2_Loop + 0x1, 0x00000000, 0x00000000, Tsa_DemonLightBg_0, Tsa_DemonLightBg_1, Tsa_DemonLightBg_2\n"
"	.4byte Img_DemonLightBg_2, Img_DemonLightBg_3, Img_DemonLightBg_4, Pal_DemonLightBg_0, Pal_DemonLightBg_1, Pal_Ekrdragonfx_2\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0xD4, 0x00000003, efxMaohFlashBG3_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Tsa_DemonLightBg3_Close_0, Tsa_DemonLightBg3_Close_1, Tsa_DemonLightBg3_Close_2, Tsa_DemonLightBg3_Close_3, Tsa_DemonLightBg3_Close_4, Img_DemonLightBg3_Close_0\n"
"	.4byte Img_DemonLightBg3_Close_1, Img_DemonLightBg3_Close_2, Img_DemonLightBg3_Close_3, Img_DemonLightBg3_Close_4, Pal_DemonLightBg3_Close_0, Pal_DemonLightBg3_Close_1\n"
"	.4byte Pal_DemonLightBg3_Close_2, Pal_DemonLightBg3_Close_3, Pal_DemonLightBg3_Close_4, Tsa_DemonLightBg3_Far_0, Tsa_DemonLightBg3_Far_1, Tsa_DemonLightBg3_Far_2\n"
"	.4byte Tsa_DemonLightBg3_Far_3, Tsa_DemonLightBg3_Far_4, Img_DemonLightBg3_Far_0, Img_DemonLightBg3_Far_1, Img_DemonLightBg3_Far_2, Img_DemonLightBg3_Far_3\n"
"	.4byte Img_DemonLightBg3_Far_4, Pal_DemonLightBg3_Far_0, Pal_DemonLightBg3_Far_1, Pal_DemonLightBg3_Far_2, Pal_DemonLightBg3_Far_3, Pal_DemonLightBg3_Far_4\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x10C, 0x00000003, sub_8068E34 + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Tsa_DemonLightBg4_Close_0, Tsa_DemonLightBg4_Close_1, Tsa_DemonLightBg4_Close_2, Tsa_DemonLightBg4_Close_3, Tsa_DemonLightBg4_Close_4, Tsa_DemonLightBg4_Close_5\n"
"	.4byte Tsa_DemonLightBg4_Close_6, Tsa_DemonLightBg4_Close_7, Img_DemonLightBg_0, Img_DemonLightBg4_Close_0, Img_DemonLightBg4_Close_1, Img_DemonLightBg4_Close_2\n"
"	.4byte Img_DemonLightBg4_Close_3, Img_DemonLightBg4_Close_4, Img_DemonLightBg4_Close_5, Img_DemonLightBg4_Close_6, Pal_DemonLightBg4_Close_0, Pal_DemonLightBg4_Close_1\n"
"	.4byte Pal_DemonLightBg4_Close_2, Pal_DemonLightBg4_Close_3, Pal_DemonLightBg4_Close_4, Pal_DemonLightBg4_Close_5, Pal_DemonLightBg4_Close_6, Pal_DemonLightBg4_Close_7\n"
"	.4byte Tsa_DemonLightBg4_Far_0, Tsa_DemonLightBg4_Far_1, Tsa_DemonLightBg4_Far_2, Tsa_DemonLightBg4_Far_3, Tsa_DemonLightBg4_Far_4, Tsa_DemonLightBg4_Far_5\n"
"	.4byte Tsa_DemonLightBg4_Far_6, Tsa_DemonLightBg4_Far_7, Img_DemonLightBg_1, Img_DemonLightBg4_Far_0, Img_DemonLightBg4_Far_1, Img_DemonLightBg4_Far_2\n"
"	.4byte Img_DemonLightBg4_Far_3, Img_DemonLightBg4_Far_4, Img_DemonLightBg4_Far_5, Img_DemonLightBg4_Far_6, Pal_DemonLightBg4_Far_0, Pal_DemonLightBg4_Far_1\n"
"	.4byte Pal_DemonLightBg4_Far_2, Pal_DemonLightBg4_Far_3, Pal_DemonLightBg4_Far_4, Pal_DemonLightBg4_Far_5, Pal_DemonLightBg4_Far_6, Pal_DemonLightBg4_Far_7\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x140, 0x00000003, efxMaohFlashWOUT_Loop_A + 0x1, 0x0020000E, 0x00000000\n"
"	.4byte 0x00000003, efxMaohFlashWOUT_Loop_B + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x154\n"
"	.4byte 0x0004000E, 0x00000000, 0x00000003, efxMaohFlashBGCOL_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x25C, 0x00000003, efxMaohFlashEyeLOBJ2_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009b_0E3BA4, 0x00000003, efxMaohFlashEyeOBJ1_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009c_0E3BC4, 0x00000003, efxMaohFlashEyeFire1OBJ1_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009d_0E3BE0, 0x00000003, efxMaohFlashEyeFire2OBJ1_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009e_0E3C04, 0x00000003, efxMaohFlashThunderOBJ2_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009f_0E3C28, 0x00000003, gap_000695C4 + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009f_0E3C28 + 0x18, 0x00000003, efxMaohFlashEyeROBJ2_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009f_0E3C28 + 0x30, 0x00000003, efxStone_Loop_Main + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009f_0E3C28 + 0x3C, 0x00000003, efxStoneBG_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Img_Banim_14, Img_Stone_0, Img_Stone_1, Img_Stone_2, Img_Stone_3, Img_Stone_4\n"
"	.4byte Img_Stone_5, Img_Stone_6, Img_Stone_7, Img_Stone_8, Img_Stone_9, Img_Stone_10\n"
"	.4byte Img_Stone_11, Img_Stone_12, Img_Stone_13, Img_Stone_14, Img_Stone_15, Img_Stone_16\n"
"	.4byte Img_Stone_17, Tsa_Stone_0, Tsa_Stone_1, Tsa_Stone_2, Tsa_Stone_3, Tsa_Stone_4\n"
"	.4byte Tsa_Stone_5, Tsa_Stone_6, Tsa_Stone_7, Tsa_Stone_8, Tsa_Stone_9, Tsa_Stone_10\n"
"	.4byte Tsa_Stone_11, Tsa_Stone_12, Tsa_Stone_13, Tsa_Stone_14, Tsa_Stone_15, Tsa_Stone_16\n"
"	.4byte Tsa_Stone_17, Tsa_Stone_18, 0x00000001, frontier_df4_misc_lo_009f_0E3C28 + 0x98, 0x00000003, efxStoneOBJ_Loop + 0x1\n"
"	.4byte 0x00000000, 0x00000000\n"
);