#include "global.h"

/* Migrated from asm/dat_data_banim_p159.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p159") u16 Pal_BerserkBg[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/0068C338_Pal_BerserkBg.gbapal");
SECTION(".rodata.dat_data_banim_p159") u16 Img_BerserkSprites_A[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/0068C358_Img_BerserkSprites_A.4bpp.lz");
SECTION(".rodata.dat_data_banim_p159") u16 Img_BerserkSprites_B[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/0068C7F0_Img_BerserkSprites_B.4bpp.lz");
SECTION(".rodata.dat_data_banim_p159") u16 Pal_BerserkSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/0068CC10_Pal_BerserkSprites.gbapal");
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_1\n"
"AnimSprite_EfxBerserk1_1:\n"
"	.short 0x0000, 0x4000, 0x0000, -40, -14, 0\n"
"	.short 0x0000, 0x0000, 0x0040, -24, -14, 0\n"
"	.short 0x0000, 0x0000, 0x0060, -48, -6, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_2\n"
"AnimSprite_EfxBerserk1_2:\n"
"	.short 0x0000, 0x8000, 0x0002, -44, -11, 0\n"
"	.short 0x8000, 0x0000, 0x0046, -12, 5, 0\n"
"	.short 0x8000, 0x0000, 0x0006, -4, 5, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_3\n"
"AnimSprite_EfxBerserk1_3:\n"
"	.short 0x0000, 0x8000, 0x0007, -47, -13, 0\n"
"	.short 0x4000, 0x8000, 0x004B, -15, 3, 0\n"
"	.short 0x0000, 0x4000, 0x004F, 17, 3, 0\n"
"	.short 0x4000, 0x8000, 0x000B, 17, -13, 0\n"
"	.short 0x0000, 0x0000, 0x000F, -13, 19, 0\n"
"	.short 0x0000, 0x0000, 0x002F, 1, 19, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_4[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_4.4bpp");
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_5\n"
"AnimSprite_EfxBerserk1_5:\n"
"	.short 0x0000, 0x4000, 0x0000, -40, -22, 0\n"
"	.short 0x0000, 0x0000, 0x0040, -24, -22, 0\n"
"	.short 0x0000, 0x0000, 0x0060, -48, -14, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_6\n"
"AnimSprite_EfxBerserk1_6:\n"
"	.short 0x0000, 0x8000, 0x0002, -44, -19, 0\n"
"	.short 0x8000, 0x0000, 0x0046, -12, -3, 0\n"
"	.short 0x8000, 0x0000, 0x0006, -4, -3, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_7\n"
"AnimSprite_EfxBerserk1_7:\n"
"	.short 0x0000, 0x8000, 0x0007, -47, -21, 0\n"
"	.short 0x4000, 0x8000, 0x004B, -15, -5, 0\n"
"	.short 0x0000, 0x4000, 0x004F, 17, -5, 0\n"
"	.short 0x4000, 0x8000, 0x000B, 17, -21, 0\n"
"	.short 0x0000, 0x0000, 0x000F, -13, 11, 0\n"
"	.short 0x0000, 0x0000, 0x002F, 1, 11, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_8[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_8.4bpp");
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_9\n"
"AnimSprite_EfxBerserk1_9:\n"
"	.short 0x0000, 0x4000, 0x0000, -40, -30, 0\n"
"	.short 0x0000, 0x0000, 0x0040, -24, -30, 0\n"
"	.short 0x0000, 0x0000, 0x0060, -48, -22, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_10\n"
"AnimSprite_EfxBerserk1_10:\n"
"	.short 0x0000, 0x8000, 0x0002, -44, -27, 0\n"
"	.short 0x8000, 0x0000, 0x0046, -12, -11, 0\n"
"	.short 0x8000, 0x0000, 0x0006, -4, -11, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_11\n"
"AnimSprite_EfxBerserk1_11:\n"
"	.short 0x0000, 0x8000, 0x0007, -47, -29, 0\n"
"	.short 0x4000, 0x8000, 0x004B, -15, -13, 0\n"
"	.short 0x0000, 0x4000, 0x004F, 17, -13, 0\n"
"	.short 0x4000, 0x8000, 0x000B, 17, -29, 0\n"
"	.short 0x0000, 0x0000, 0x000F, -13, 3, 0\n"
"	.short 0x0000, 0x0000, 0x002F, 1, 3, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_12[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_12.4bpp");
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_13\n"
"AnimSprite_EfxBerserk1_13:\n"
"	.short 0x0000, 0x4000, 0x0000, -40, -38, 0\n"
"	.short 0x0000, 0x0000, 0x0040, -24, -38, 0\n"
"	.short 0x0000, 0x0000, 0x0060, -48, -30, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_14\n"
"AnimSprite_EfxBerserk1_14:\n"
"	.short 0x0000, 0x8000, 0x0002, -44, -35, 0\n"
"	.short 0x8000, 0x0000, 0x0046, -12, -19, 0\n"
"	.short 0x8000, 0x0000, 0x0006, -4, -19, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_15\n"
"AnimSprite_EfxBerserk1_15:\n"
"	.short 0x0000, 0x8000, 0x0007, -47, -37, 0\n"
"	.short 0x4000, 0x8000, 0x004B, -15, -21, 0\n"
"	.short 0x0000, 0x4000, 0x004F, 17, -21, 0\n"
"	.short 0x4000, 0x8000, 0x000B, 17, -37, 0\n"
"	.short 0x0000, 0x0000, 0x000F, -13, -5, 0\n"
"	.short 0x0000, 0x0000, 0x002F, 1, -5, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_16[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_16.4bpp");
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_17\n"
"AnimSprite_EfxBerserk1_17:\n"
"	.short 0x0000, 0x4000, 0x0000, -40, -46, 0\n"
"	.short 0x0000, 0x0000, 0x0040, -24, -46, 0\n"
"	.short 0x0000, 0x0000, 0x0060, -48, -38, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_18\n"
"AnimSprite_EfxBerserk1_18:\n"
"	.short 0x0000, 0x8000, 0x0002, -44, -43, 0\n"
"	.short 0x8000, 0x0000, 0x0046, -12, -27, 0\n"
"	.short 0x8000, 0x0000, 0x0006, -4, -27, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p159, \"a\", %progbits\n"
"	.global AnimSprite_EfxBerserk1_19\n"
"AnimSprite_EfxBerserk1_19:\n"
"	.short 0x0000, 0x8000, 0x0007, -47, -45, 0\n"
"	.short 0x4000, 0x8000, 0x004B, -15, -29, 0\n"
"	.short 0x0000, 0x4000, 0x004F, 17, -29, 0\n"
"	.short 0x4000, 0x8000, 0x000B, 17, -45, 0\n"
"	.short 0x0000, 0x0000, 0x000F, -13, -13, 0\n"
"	.short 0x0000, 0x0000, 0x002F, 1, -13, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_20[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_20.4bpp");
