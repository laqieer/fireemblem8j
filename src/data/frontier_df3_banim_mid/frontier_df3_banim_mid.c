#include "global.h"
#include "anime.h"

/* Migrated from asm/frontier_df3_banim_mid.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df3_banim_mid_000_64D2B4[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000a_64D2B4.map.bin.lz");
u8 frontier_df3_banim_mid_000b_64D3C8[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000b_64D3C8.map.bin.lz");
u8 frontier_df3_banim_mid_000c_64D478[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000c_64D478.map.bin.lz");
u8 frontier_df3_banim_mid_000d_64D580[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000d_64D580.map.bin.lz");
u8 frontier_df3_banim_mid_000e_64D6BC[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000e_64D6BC.map.bin.lz");
u8 frontier_df3_banim_mid_000f_64D830[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000f_64D830.map.bin.lz");
u8 frontier_df3_banim_mid_000g_64D9C8[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000g_64D9C8.map.bin.lz");
u8 frontier_df3_banim_mid_000h_64DB3C[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000h_64DB3C.map.bin.lz");
u8 frontier_df3_banim_mid_000i_64DC48[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000i_64DC48.map.bin.lz");
u8 frontier_df3_banim_mid_000j_64DD1C[] __attribute__((section(".data.frontier_df3_banim_mid.gap0"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000j_64DD1C.map.bin.lz");
u8 frontier_df3_banim_mid_001_6500B0[] __attribute__((section(".data.frontier_df3_banim_mid.gap1"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_001a_6500B0.4bpp.lz");
/* data_08650674: raw non-LZ trailing carve (was part of hybrid JP-LZ blob), byte-exact. */
__asm__(
"\t.section .data.frontier_df3_banim_mid.gap1, \"aw\", %progbits\n"
"\t.global data_08650674\n"
"data_08650674:\n"
"\t.4byte 0x7FFF49B3, 0x7F577FBB, 0x7EAE7F13, 0x7E067E4A, 0x53557DA2, 0x53555355\n"
"\t.4byte 0x53555355, 0x53555355, 0xFFFF0001, 0xFF8000DD, 0x00DD0080, 0x80000100\n"
"\t.4byte 0x00380000, 0x0000FFE0, 0x00000001, 0x00000000, 0x00000000\n"
);
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
"	.4byte AnimSprite_EfxAlacaliburOBJ_Back_39 + 0x2, AnimSprite_EfxAlacaliburOBJ_Back_40 + 0x2, data_08650674 + 0x22, AnimSprite_EfxAlacaliburOBJ_Back_2 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_3 + 0x1, AnimSprite_EfxAlacaliburOBJ_Back_4 + 0x1\n"
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
/* frontier_df3_banim_mid_005_6533B0: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df3_banim_mid.gap5, \"aw\", %progbits\n"
"	.global frontier_df3_banim_mid_005_6533B0\n"
"frontier_df3_banim_mid_005_6533B0:\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_69 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_70 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_71 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_72 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_25 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_26 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_27 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_28 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_29 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_30 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_31 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_32 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_33 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_34 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_35 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_36 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_37 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_38 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_39 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_40 + 0x2, AnimScr_EfxAlacaliburOBJ_RightBack + 0xBA, AnimSprite_EfxAlacaliburOBJ_Front_2 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_3 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_4 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_5 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_6 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_7 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_8 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_9 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_10 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_11 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_12 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_13 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_14 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_15 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_16 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_17 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_18 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_19 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_20 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_21 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_22 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_23 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_24 + 0x1, 0x81000000, AnimSprite_EfxAlacaliburOBJ_Front_69 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_70 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_71 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_72 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_25 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_26 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_27 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_28 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_29 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_30 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_31 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_32 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_33 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_34 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_35 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_36 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_37 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_38 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_39 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_40 + 0x1, frontier_df3_banim_mid_004_652948 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_43 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_46 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_47 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_48 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_49 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_50 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_51 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_52 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_53 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_54 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_55 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_56 + 0x2\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_57 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_58 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_59 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_60 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_61 + 0x2, AnimSprite_EfxAlacaliburOBJ_Front_62 + 0x1\n"
"	.4byte AnimSprite_EfxAlacaliburOBJ_Front_63 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_64 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_65 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_66 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_67 + 0x1, AnimSprite_EfxAlacaliburOBJ_Front_68 + 0x1\n"
"	.4byte 0x81000000, 0x00140010, 0xF0000035, 0xB0014001, 0xE0A00300, 0xBBBB0014\n"
"	.4byte 0x77789A00, 0x450179A8, 0x34686544, 0x36F03222, 0xA70130A7, 0xB8640300\n"
"	.4byte 0x01F04760, 0xAB021A30, 0x11112458, 0x9B030069, 0x11123500, 0x11236800\n"
"	.4byte 0x46A00100, 0x7B000012, 0x001C0035, 0x00BBAA69, 0x0B8532B0, 0x52110000\n"
"	.4byte 0x211100B8, 0x11000095, 0x110A6311, 0x07004211, 0x96311111, 0x05221124\n"
"	.4byte 0x32346874, 0xBB270064, 0x99404700, 0x0078AA00, 0x00569000, 0x46800010\n"
"	.4byte 0x0A350700, 0x36029000, 0x47ABAABA, 0x9920000B, 0x76040080, 0x540000A8\n"
"	.4byte 0x00000B86, 0x00096433, 0x00A74322, 0x96321200, 0x84211200, 0xAA92F090\n"
"	.4byte 0x98DF10AA, 0x0444568A, 0x23468954, 0x0020F022, 0x000A5300, 0x04008603\n"
"	.4byte 0x1BF09643, 0xA00001C0, 0x1112468A, 0x001358A0, 0x358A0011, 0x58000011\n"
"	.4byte 0x9B001354, 0x80170047, 0x88891C10, 0x2100A905, 0xDB000863, 0x14DB0085\n"
"	.4byte 0x00110852, 0xE40012E4, 0x11001135, 0x11247A41, 0x5A680021, 0x9A7F5024\n"
"	.4byte 0x03002E10, 0x68760068, 0x1B010740, 0x7A000095, 0x30AA0A74, 0x14009947\n"
"	.4byte 0x55DF0077, 0x00349400, 0x23000864, 0x23009642, 0x00852208, 0xAB2F0124\n"
"	.4byte 0x01D4A989, 0x904320B3, 0x00688E00, 0x00004536, 0x003347A0, 0x0022358B\n"
"	.4byte 0x32236910, 0xA9AB9D11, 0x681000BA, 0x3F200A87, 0xB0009644, 0x00B8530B\n"
"	.4byte 0xA05B00A0, 0xFF01DE00, 0x009AAB00, 0xA066679B, 0x43450068, 0x3333468A\n"
"	.4byte 0x33004569, 0x55556844, 0x01767876, 0x9999A987, 0x00AA00BA, 0xA9762858\n"
"	.4byte 0x200A5B11, 0x0A986503, 0xBA980010, 0x2347E181, 0x46009053, 0x458B7433\n"
"	.4byte 0x008B9643, 0x8BA86446, 0x9B9A8666, 0x7AA97700, 0x69BB99AB, 0xB00B08B0\n"
"	.4byte 0xE301B868, 0x000BAABA, 0x0B989A00, 0x00977900, 0x02670026, 0x00B75538\n"
"	.4byte 0x653B0203, 0x50F10960, 0xA00A9F01, 0x01877778, 0x44456790, 0xF1335790\n"
"	.4byte 0x9F41A59F, 0x323B0075, 0xBB091075, 0xF0F08D80, 0xF01F1201, 0x6A017001\n"
"	.4byte 0x40211113, 0xB08B0180, 0x00222247, 0x3335017A, 0x4458B000, 0xA8100100\n"
"	.4byte 0x109B1A00, 0x4000741F, 0x00BBB963, 0xAAA753BA, 0xABA75489, 0xA7657805\n"
"	.4byte 0x6B027ABB, 0xC01A019B, 0x131163A0, 0x00A98766, 0x76005556, 0x555567A9\n"
"	.4byte 0x02678A86, 0x9AB07665, 0x8FF08888, 0xB9002F00, 0x00A90300, 0x00031008\n"
"	.4byte 0x602F1201, 0x308BF36A, 0xA9632201, 0x530034AA, 0x54579AA7, 0x027A9A97\n"
"	.4byte 0xA0A08766, 0xB9019788, 0xF810F9A9, 0x01F001F0, 0x018001F0, 0xB51099AB\n"
"	.4byte 0x57039B4D, 0x0700578A, 0x02B00300, 0xF730C03F, 0x77660150, 0x444400B9\n"
"	.4byte 0x04B96520, 0x2235750A, 0x57004221, 0xAB221234, 0xA0223467, 0x12346A02\n"
"	.4byte 0x4467A06F, 0xA00D0065, 0x000A7667, 0xB04F024D, 0x004A7E03, 0x43007E03\n"
"	.4byte 0x0155D703, 0x9900A99F, 0x79A948A9, 0x00AA6997, 0xB0787679, 0x0087657A\n"
"	.4byte 0x86557A10, 0x0085C603, 0x654057A0, 0x12656E00, 0x130B7421, 0x12C702C0\n"
"	.4byte 0x632236CB, 0x0033470A, 0x44690B64, 0x56890B75, 0xA90B860F, 0xF0300278\n"
"	.4byte 0x13019001, 0x01F08033, 0x899899A0, 0xFA655567, 0xCB01CE02, 0x5BB11713\n"
"	.4byte 0x03863D11, 0x0280764F, 0x656678CB, 0x33457887, 0x57805418, 0xCC038B03\n"
"	.4byte 0xE2790000, 0x07119B14, 0x58A06B32, 0x57B00033, 0x8AD30084, 0x240A6421\n"
"	.4byte 0x00223457, 0x34680964, 0x57A00843, 0x64964400, 0x6480AAA8, 0x998904A8\n"
"	.4byte 0x10899867, 0x1AA08701, 0x03668AAA, 0x90A704FE, 0x20004F01, 0xF7032558\n"
"	.4byte DirectSoundData_mon_bgl_attack6_10k + 0x3982, 0x31120048, 0x31136807, 0x240078A6, 0x3687A632, 0x0786A632\n"
"	.4byte 0x75A64357, 0xF2510268, 0xBA43D5A0, 0x10A04700, 0x15930203, 0xF300B003\n"
"	.4byte 0x2F14AAB0, 0x651D10AB, 0x0075CB00, 0x00F69643, 0x22D20003, 0xA012005B\n"
"	.4byte 0x3B140E00, 0x5EE3D47B, 0x00881800, 0xA3016620, 0x20B58545, 0x7F426B12\n"
"	.4byte 0x00600710, 0xBF447003, 0x34D72580, 0x23000953, 0x0000B632, 0x00742113\n"
"	.4byte 0x04521113, 0x31111409, 0x84CE05A6, 0xD004BD25, 0xF0A80547, 0x130130AF\n"
"	.4byte 0x7811A6DA, 0x11246802, 0x01368000, 0x24786957, 0xEB120D00, 0x87258F11\n"
"	.4byte 0x228889A0, 0x4F011198, 0x15531111, 0x0594841B, 0x0046521B, 0x5C009008\n"
"	.4byte 0x23077A00, 0x58000A11, 0xD1313700, 0x00A42315, 0x17058A53, 0xFC056280\n"
"	.4byte 0x003A0731, 0x305605A0, 0x78CF004A, 0x8056FC00, 0x54468502, 0x333500A7\n"
"	.4byte 0x36000095, 0x370A6422, Img_NaglfarBg3_3 + 0x7C2, 0x0300EF21, 0x03683F15, 0x04568AB8\n"
"	.4byte 0x79A09765, 0x68B30255, 0x4F31E455, 0x61035BF4, 0x04006500, 0x23F07666\n"
"	.4byte 0xF30B1167, 0x2401409B, 0x00A85211, 0x86422247, 0x8543347A, 0x860F0283\n"
"	.4byte 0x86668A00, 0x3200F915, 0x303A15E0, 0xAA80009F, 0x090A8888, 0x87778900\n"
"	.4byte 0x55689009, 0x89001F09, 0x10C40356, 0x1157A07B, 0x00971233, 0x00987655\n"
"	.4byte 0xA8876556, 0x87778808, 0x46F20098, 0x5820A000, 0x23060023, 0x33456800\n"
"	.4byte 0x653E0096, 0x909F0790, 0x3C10F705, 0x32220023, 0x54321264, 0x540E3287\n"
"	.4byte 0x03540A97, 0x0003122E, 0x00020A56, 0x79A9888A, 0x00F40566, 0x068AB028\n"
"	.4byte 0xDE034613, 0x01690023, 0x57A02234, 0x039B2223, 0xFF068018, 0x76678A65\n"
"	.4byte 0x015566A8, 0x33338765, 0x00228654, 0x43210040, 0x65320A86, 0x646700B9\n"
"	.4byte 0x47304400, 0xE6140000, 0xA6F20310, 0xF06D73E3, 0x78017012, 0x8E030977\n"
"	.4byte 0xF0D38610, 0x7A013041, 0x77902F03, 0x0727D732, 0x50D722C1, 0xA99AB901\n"
"	.4byte 0x3B000900, 0x108811FF, 0xF045F003, 0x00014001, 0xB08323F7, 0x88AA01AB\n"
"	.4byte 0x34568A66, 0x38FA0733, 0x38012332, 0xEF041AC8, 0x00430A98, 0x43A98654\n"
"	.4byte 0x86AA9876, 0x89C1118F, 0x7A035556, 0x8701EB04, 0x52C0AC00, 0x76015023\n"
"	.4byte 0x4346A00A, 0x700A2075, 0x22359317, 0x00690953, 0xA0842123, 0x00521247\n"
"	.4byte 0x06258021, 0x22236ABB, 0x00B30773, 0x69AAA853, 0xA099A854, 0x89976600\n"
"	.4byte 0x7A988A00, 0xA9A00009, 0xA000A67A, 0x00A0739A, 0x1704598F, 0xA521136A\n"
"	.4byte 0x1114008A, 0x11269894, 0x38008773, 0x58767311, 0x01666312, 0x57632378\n"
"	.4byte 0xF0633587, 0x7F30FBD6, 0xE1110350, 0xEA200CF6, 0x04620288, 0x01F0D287\n"
"	.4byte 0x04880110, 0x026555FB, 0x058E8030, 0x7679008B, 0x7F312F20, 0xAA6801D0\n"
"	.4byte 0x007A9702, 0x67008003, 0x656BD090, Img_DivineBg3_6 + 0xB0, frontier_banim_dracozombie_023_788CC4 + 0xBA1, 0x89A80066\n"
"	.4byte 0x9A09770A, 0x03AC8800, 0x2C008971, 0x2084149A, 0x80346986, 0x00348601\n"
"	.4byte 0xA054567A, 0x97670179, 0x0A9989A0, 0xA7B013A0, 0x06480734, 0x0143A856\n"
"	.4byte 0x225A0868, 0x790000B4, 0x457A7656, 0x36039754, 0x230A7533, 0x31BE2353\n"
"	.4byte 0x6317F29B, 0x4A033600, 0x79A05600, 0xD0677909, 0xBFE34201, 0x67B203AA\n"
"	.4byte 0x00097666, 0x75433455, 0x43334556, 0x362B00BC, 0x6B335FF7, 0xDE04DE19\n"
"	.4byte 0x09A94400, 0x0F055670, 0x80100069, 0xC03E1687, 0xC0300911, 0x64468558\n"
"	.4byte 0x58008559, 0x79756A64, 0x00757076, 0x6580878A, 0x6690A8AA, 0xA0AAAA00\n"
"	.4byte 0x00AA0A77, 0x610A7B78, 0xAB01F087, 0xA0570167, 0xEB025900, 0x4457B011\n"
"	.4byte 0x0032BE0A, 0x1E7B0A6B, 0x53211248, 0x156F1363, 0x003607C3, 0x009B0997\n"
"	.4byte 0x73070064, 0xC702EC32, 0x7A22FF15, 0x223E0534, 0x3B008000, 0x53230069\n"
"	.4byte 0x84335800, 0x543A4690, 0x2A020097, 0x63AB1AF3, 0xAB85CB00, 0x00A84501\n"
"	.4byte 0xE4059ABB, 0x02710078, 0x023444BF, 0x88904406, 0x9989E309, 0xA0D910C0\n"
"	.4byte 0x65433301, 0x00433408, 0x66668754, 0x999A8766, 0x64AF28FD, 0xF073F2B7\n"
"	.4byte 0x260BF417, 0x7731483F, 0xA0247B01, 0x6B211125, 0x48666309, 0xD605D705\n"
"	.4byte 0xE3051331, 0xA673E705, 0x05A60A00, 0x00740AF7, 0xA5A51B2C, 0x010300F0\n"
"	.4byte 0x01634086, 0xB999A032, 0x15896000, 0xA0FB04B5, 0x9B002347, 0x1A445622\n"
"	.4byte 0xAAB000A7, 0x1011EFA9, 0x05009532, 0xA854A0EA, 0xA8790C00, 0xA3039000\n"
"	.4byte 0x46906706, 0x69B02302, 0x0AA02335, 0x05808B43, 0x543457EF, 0x532234A7\n"
"	.4byte 0x0723B828, 0x700C12B7, 0x28B75322, 0x2B0C4300, 0x9B2C0776, 0x770F6668\n"
"	.4byte 0x3B999AAB, 0x2701F041, 0x8001F04F, 0x46800170, 0x568A9975, 0x8A8A0087\n"
"	.4byte 0x8A69A877, 0x581A0A98, 0x731409AA, 0x0480FF17, 0x765F8AD7, 0x0266EF1A\n"
"	.4byte 0x1AEB1AC6, 0x2D1C06AE, 0xD912D53B, 0x018AFE3A, 0xE7058AA5, 0xEAEB0090\n"
"	.4byte 0x77F1BC01, 0x0190F202, 0x3A008097, 0x0065096A, 0xD3085900, 0x3A133348\n"
"	.4byte 0x570300FF, 0x1037211F, 0x17031053, 0x34531177, 0x0C38553C, 0x03004997\n"
"	.4byte 0x702B005A, 0x80540300, 0x0015A31C, 0x03003718, 0x00C54159, 0x004B0784\n"
"	.4byte 0x03009411, 0x48030072, 0x31AF0C41, 0x84B30CA7, 0x117F1200, 0xE3F15112\n"
"	.4byte 0x6B1C7739, 0x7B838B1D, 0x14DAAB1C, 0x768C005B, 0xDF3B3900, 0x58F70780\n"
"	.4byte 0xF3222240, 0x0054346A, 0x96004358, 0xA86457A0, 0x00865690, 0xA9768A8A\n"
"	.4byte 0xA0953269, 0xA9630A02, 0x01960A9A, 0x770A9902, 0x047900A9, 0xC0005708\n"
"	.4byte 0xC800F855, 0x9525DE2B, 0x006A01F0, 0x0D334567, 0x4579AA00, 0x8BF61324\n"
"	.4byte 0x2DB20900, 0x4B005400, 0x1A1F0356, 0x69019A4E, 0x109977FF, 0x13200040\n"
"	.4byte 0xF61310EB, 0x5011F0C9, 0x3200FBEB, 0x01F03A10, 0x8F021EB2, 0x030A0333\n"
"	.4byte 0x21240BB7, 0x030F5900, 0x336F0C26, 0x14413F0F, 0x2F1B0B0E, 0xAB116511\n"
"	.4byte 0x0310B311, 0xC7410660, 0x878A0F12, 0x009A57AA, 0xAA5690A9, 0xA065800A\n"
"	.4byte 0x057A002E, 0xC9007AA7, 0x6525EA02, 0x090A7D99, 0x114F220F, 0x2042256A\n"
"	.4byte 0x740778CC, 0x0009660D, 0x25451180, 0x4B006967, 0x70AB01A8, 0x0B59C706\n"
"	.4byte 0x002136BB, 0x7B046A44, 0x07211137, 0xBB65009E, 0x50542500, 0x063D0087\n"
"	.4byte 0x0E020097, 0xF0E44722, 0x031BE101, 0x012580EB, 0x800012E3, 0x4790D40E\n"
"	.4byte 0x45791123, 0x78320023, 0x9A865455, 0x02999888, 0x00952143, 0x84DF09EA\n"
"	.4byte 0x40DA0F00, 0x79B60E90, 0x36800A75, 0xD3188A09, 0x0A123479, 0xE703A804\n"
"	.4byte 0x56800098, 0x4458A865, 0x34080864, 0x09097533, 0x5322004E, 0x3200A81E\n"
"	.4byte 0x9821841F, 0x016002F2, DirectSoundData_mon_cyc_attack1_13k + 0xC94, 0x07335A00, 0x32024A00, 0x21480006\n"
"	.4byte 0x94EE0205, 0x11390008, 0x72030083, 0x113F4A00, 0xB430F051, 0x05CB80D3\n"
"	.4byte 0xA1FF2667, 0x578020F3, 0x3345CB00, 0x1F556865, 0x0F889875, 0x0FF2D1CF\n"
"	.4byte 0xF02B698E, 0x01008201, 0x0041114A, 0x70EB0F50, 0x90FB0197, 0x25870313\n"
"	.4byte 0x93130300, 0x90368F13, 0x14A01124, 0x0300A4F7, 0xA9527711, 0x00316000\n"
"	.4byte 0xD8012114, 0xF7F08421, 0xAA7FB1B6, 0xE336A76C, 0x048701A0, 0x13245813\n"
"	.4byte 0x11760B11, 0x707C0134, 0x41110213, 0x62111137, 0x90A57202, 0x11098701\n"
"	.4byte 0x42111E01, 0x21079009, 0x84580096, 0x6A00B001, 0x09806400, 0xA9789064\n"
"	.4byte 0xA86669A0, 0x65567A0B, 0x23D01809, 0xCE085006, 0x025613DC, 0xCF048937\n"
"	.4byte 0x3F7635A3, 0x65072222, 0x0A855455, 0x3711E209, 0x0E9C8303, 0x0789A04B\n"
"	.4byte 0x111F0797, 0x41359063, 0x22BE0512, 0x53222468, 0x973B660D, 0x0F730845\n"
"	.4byte 0x323F6026, 0x7712D504, 0xF043F1FF, 0xF001F001, 0xF001F001, 0xF001F001\n"
"	.4byte 0x01F0FF01, 0x01F001F0, 0x01F001F0, 0x01F001F0, 0xF0E001F0, 0xF001F001\n"
"	.4byte 0x00000001\n"
);
u8 frontier_df3_banim_mid_006_654DFC[] __attribute__((section(".data.frontier_df3_banim_mid.gap6"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_006_654DFC.4bpp.lz");
u8 frontier_df3_banim_mid_007_656EA8[] __attribute__((section(".data.frontier_df3_banim_mid.gap7"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_007_656EA8.gbapal");
u8 frontier_df3_banim_mid_008_657A78[] __attribute__((section(".data.frontier_df3_banim_mid.gap8"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008a_657A78.map.bin.lz");
u8 frontier_df3_banim_mid_008b_657B20[] __attribute__((section(".data.frontier_df3_banim_mid.gap8"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008b_657B20.map.bin.lz");
u8 frontier_df3_banim_mid_008c_657BDC[] __attribute__((section(".data.frontier_df3_banim_mid.gap8"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008c_657BDC.map.bin.lz");
u8 frontier_df3_banim_mid_008d_657CB4[] __attribute__((section(".data.frontier_df3_banim_mid.gap8"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008d_657CB4.map.bin.lz");
u8 frontier_df3_banim_mid_008e_657D94[] __attribute__((section(".data.frontier_df3_banim_mid.gap8"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008e_657D94.map.bin.lz");
u8 frontier_df3_banim_mid_009_6587E0[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009a_6587E0.map.bin.lz");
u8 frontier_df3_banim_mid_009b_658880[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009b_658880.map.bin.lz");
u8 frontier_df3_banim_mid_009c_658934[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009c_658934.map.bin.lz");
u8 frontier_df3_banim_mid_009d_6589F0[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009d_6589F0.map.bin.lz");
u8 frontier_df3_banim_mid_009e_658ACC[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009e_658ACC.map.bin.lz");
u8 frontier_df3_banim_mid_009f_658BB4[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009f_658BB4.map.bin.lz");
u8 frontier_df3_banim_mid_009g_658CD8[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009g_658CD8.map.bin.lz");
u8 frontier_df3_banim_mid_009h_658DF8[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009h_658DF8.map.bin.lz");
u8 frontier_df3_banim_mid_009i_658F04[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009i_658F04.map.bin.lz");
u8 frontier_df3_banim_mid_009j_659010[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009j_659010.map.bin.lz");
u8 frontier_df3_banim_mid_009k_65910C[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009k_65910C.map.bin.lz");
u8 frontier_df3_banim_mid_009l_65920C[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009l_65920C.map.bin.lz");
u8 frontier_df3_banim_mid_009m_659308[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009m_659308.map.bin.lz");
u8 frontier_df3_banim_mid_009n_659404[] __attribute__((section(".data.frontier_df3_banim_mid.gap9"))) = INCBIN_U8("graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009n_659404.4bpp.lz");
