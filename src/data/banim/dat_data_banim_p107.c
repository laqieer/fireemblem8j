#include "global.h"

/* Migrated from asm/dat_data_banim_p107.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg_19[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645AC8_Tsa_08645AC8.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg_20[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645B64_Tsa_08645B64.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg2_0[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645C00_Tsa_08645C00.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg2_1[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645C9C_Tsa_08645C9C.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg2_2[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645D38_Tsa_08645D38.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Img_DivineSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00645DD8_Img_DivineSprites.4bpp.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Pal_DivineSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/00645F44_Pal_DivineSprites.gbapal");
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_1\n"
"AnimSprite_EfxDevineOBJ_1:\n"
"	.short 0x4000, 0x4000, 0x0023, 0, -34, 0\n"
"	.short 0x4000, 0x5000, 0x0023, -32, -34, 0\n"
"	.short 0x4000, 0x0000, 0x0027, 32, -34, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 32, -42, 0\n"
"	.short 0x4000, 0x1000, 0x0027, -48, -34, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -48, -42, 0\n"
"	.short 0x4000, 0x0000, 0x0004, 16, -50, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 32, -50, 0\n"
"	.short 0x4000, 0x1000, 0x0004, -32, -50, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -40, -50, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_2\n"
"AnimSprite_EfxDevineOBJ_2:\n"
"	.short 0x4000, 0x4000, 0x0023, -2, -36, 0\n"
"	.short 0x4000, 0x5000, 0x0023, -30, -36, 0\n"
"	.short 0x4000, 0x0000, 0x0027, 30, -36, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 30, -44, 0\n"
"	.short 0x4000, 0x1000, 0x0027, -46, -36, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -46, -44, 0\n"
"	.short 0x4000, 0x0000, 0x0004, 14, -52, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 30, -52, 0\n"
"	.short 0x4000, 0x1000, 0x0004, -30, -52, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -38, -52, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_3\n"
"AnimSprite_EfxDevineOBJ_3:\n"
"	.short 0x4000, 0x4000, 0x0024, 0, -40, 0\n"
"	.short 0x4000, 0x5000, 0x0024, -32, -40, 0\n"
"	.short 0x0000, 0x0000, 0x0028, 32, -40, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 24, -48, 0\n"
"	.short 0x0000, 0x1000, 0x0028, -40, -40, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -40, -48, 0\n"
"	.short 0x4000, 0x0000, 0x0005, 16, -56, 0\n"
"	.short 0x4000, 0x1000, 0x0005, -32, -56, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_4\n"
"AnimSprite_EfxDevineOBJ_4:\n"
"	.short 0x4000, 0x4000, 0x0024, -4, -44, 0\n"
"	.short 0x4000, 0x5000, 0x0024, -28, -44, 0\n"
"	.short 0x0000, 0x0000, 0x0028, 28, -44, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 20, -52, 0\n"
"	.short 0x0000, 0x1000, 0x0028, -36, -44, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -36, -52, 0\n"
"	.short 0x4000, 0x0000, 0x0005, 12, -60, 0\n"
"	.short 0x4000, 0x1000, 0x0005, -28, -60, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_5\n"
"AnimSprite_EfxDevineOBJ_5:\n"
"	.short 0x4000, 0x5000, 0x0025, -32, -52, 0\n"
"	.short 0x4000, 0x4000, 0x0025, 0, -52, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -32, -60, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -24, -67, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 16, -60, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 16, -67, 0\n"
"	.short 0x0000, 0x0000, 0x0005, 8, -67, 0\n"
"	.short 0x0000, 0x1000, 0x0005, -16, -67, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_6\n"
"AnimSprite_EfxDevineOBJ_6:\n"
"	.short 0x4000, 0x5000, 0x0025, -28, -60, 0\n"
"	.short 0x4000, 0x4000, 0x0025, -4, -60, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -28, -68, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -20, -75, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 12, -68, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 12, -75, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_7\n"
"AnimSprite_EfxDevineOBJ_7:\n"
"	.short 0x4000, 0x0000, 0x0026, 0, -65, 0\n"
"	.short 0x4000, 0x1000, 0x0026, -16, -65, 0\n"
"	.short 0x0000, 0x0000, 0x0028, 16, -65, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 8, -73, 0\n"
"	.short 0x0000, 0x1000, 0x0028, -24, -65, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -24, -73, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 8, -81, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -16, -81, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_8\n"
"AnimSprite_EfxDevineOBJ_8:\n"
"	.short 0x0000, 0x4000, 0x0007, -2, -25, 0\n"
"	.short 0x0000, 0x5000, 0x0007, -14, -25, 0\n"
"	.short 0x4000, 0x0000, 0x0026, -4, -69, 0\n"
"	.short 0x4000, 0x1000, 0x0026, -12, -69, 0\n"
"	.short 0x0000, 0x0000, 0x0028, 12, -69, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 4, -77, 0\n"
"	.short 0x0000, 0x1000, 0x0028, -20, -69, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -20, -77, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_9\n"
"AnimSprite_EfxDevineOBJ_9:\n"
"	.short 0x0000, 0x4000, 0x0007, 0, -29, 0\n"
"	.short 0x0000, 0x5000, 0x0007, -16, -29, 0\n"
"	.short 0x0000, 0x4000, 0x0007, 0, -83, 0\n"
"	.short 0x0000, 0x5000, 0x0007, -16, -83, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_10\n"
"AnimSprite_EfxDevineOBJ_10:\n"
"	.short 0x0000, 0x4000, 0x0007, -2, -88, 0\n"
"	.short 0x0000, 0x5000, 0x0007, -14, -88, 0\n"
"	.short 0x4000, 0x0000, 0x0026, 0, -25, 0\n"
"	.short 0x4000, 0x1000, 0x0026, -16, -25, 0\n"
"	.short 0x0000, 0x0000, 0x0028, 16, -25, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 8, -33, 0\n"
"	.short 0x0000, 0x1000, 0x0028, -24, -25, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -24, -33, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 8, -41, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -16, -41, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_11\n"
"AnimSprite_EfxDevineOBJ_11:\n"
"	.short 0x4000, 0x5000, 0x0025, -32, -31, 0\n"
"	.short 0x4000, 0x4000, 0x0025, 0, -31, 0\n"
"	.short 0x4000, 0x4000, 0x0043, -16, -96, 0\n"
"	.short 0x4000, 0x0000, 0x0064, -16, -88, 0\n"
"	.short 0x0000, 0x0000, 0x0066, 0, -88, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -32, -39, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -24, -46, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 16, -39, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 16, -46, 0\n"
"	.short 0x0000, 0x0000, 0x0005, 8, -46, 0\n"
"	.short 0x0000, 0x1000, 0x0005, -16, -46, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_12\n"
"AnimSprite_EfxDevineOBJ_12:\n"
"	.short 0x4000, 0x0000, 0x0026, 0, -36, 0\n"
"	.short 0x4000, 0x1000, 0x0026, -16, -36, 0\n"
"	.short 0x0000, 0x0000, 0x0028, 16, -36, 0\n"
"	.short 0x4000, 0x0000, 0x0007, 8, -44, 0\n"
"	.short 0x0000, 0x1000, 0x0028, -24, -36, 0\n"
"	.short 0x4000, 0x1000, 0x0007, -24, -44, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 8, -52, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -16, -52, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_13\n"
"AnimSprite_EfxDevineOBJ_13:\n"
"	.short 0x0000, 0x4000, 0x0007, 0, -47, 0\n"
"	.short 0x0000, 0x5000, 0x0007, -16, -47, 0\n"
"	.short 0x0000, 0x0000, 0x0006, 0, -55, 0\n"
"	.short 0x0000, 0x1000, 0x0006, -8, -55, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p107, \"a\", %progbits\n"
"	.global AnimSprite_EfxDevineOBJ_14\n"
"AnimSprite_EfxDevineOBJ_14:\n"
"	.short 0x0000, 0x4000, 0x0007, -2, -51, 0\n"
"	.short 0x0000, 0x5000, 0x0007, -14, -51, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
