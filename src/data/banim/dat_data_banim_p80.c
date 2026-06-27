#include "global.h"

/* Migrated from asm/dat_data_banim_p80.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p80") u16 Img_FimbulvetrBg_Tornado_A[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/006110E0_Img_FimbulvetrBg_Tornado_A.4bpp.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Img_FimbulvetrBg_Tornado_B[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/006122E8_Img_FimbulvetrBg_Tornado_B.4bpp.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Img_FimbulvetrBg_Tornado_C[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00613444_Img_FimbulvetrBg_Tornado_C.4bpp.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Img_FimbulvetrBg_Tornado_D[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/006144C8_Img_FimbulvetrBg_Tornado_D.4bpp.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Img_FimbulvetrBg_Tornado_E[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00615908_Img_FimbulvetrBg_Tornado_E.4bpp.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Img_FimbulvetrBg_Tornado_F[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00616CC0_Img_FimbulvetrBg_Tornado_F.4bpp.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Pal_FimbulvetrBg_Tornado[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00616CC0_Img_FimbulvetrBg_Tornado_F.gbapal");
SECTION(".rodata.dat_data_banim_p80") u16 Tsa_FimbulvetrBg_Tornado_A[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00617F24_Tsa_FimbulvetrBg_Tornado_A.map.bin.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Tsa_FimbulvetrBg_Tornado_B[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00618110_Tsa_FimbulvetrBg_Tornado_B.map.bin.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Tsa_FimbulvetrBg_Tornado_C[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/006182E8_Tsa_FimbulvetrBg_Tornado_C.map.bin.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Tsa_FimbulvetrBg_Tornado_D[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/006184B0_Tsa_FimbulvetrBg_Tornado_D.map.bin.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Tsa_FimbulvetrBg_Tornado_E[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/006186E4_Tsa_FimbulvetrBg_Tornado_E.map.bin.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Tsa_FimbulvetrBg_Tornado_F[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0061892C_Tsa_FimbulvetrBg_Tornado_F.map.bin.lz");
SECTION(".rodata.dat_data_banim_p80") u16 Img_FimbulvetrSprites_Snow[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00618BBC_Img_FimbulvetrSprites_Snow.4bpp.lz");
__asm__(
"	.section .rodata.dat_data_banim_p80, \"a\", %progbits\n"
"	.global AnimSprite_FimbulvetrOBJ_1\n"
"AnimSprite_FimbulvetrOBJ_1:\n"
"	.short 0x0000, 0x4000, 0x0000, -45, -15, 0\n"
"	.short 0x0000, 0x4000, 0x0002, -35, -15, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -30, -18, 0\n"
"	.short 0x0000, 0x6000, 0x0006, -27, -20, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -51, -18, 0\n"
"	.short 0x0000, 0x4000, 0x0002, -49, -28, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -35, -17, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -37, -13, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -33, -26, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p80, \"a\", %progbits\n"
"	.global AnimSprite_FimbulvetrOBJ_2\n"
"AnimSprite_FimbulvetrOBJ_2:\n"
"	.short 0x0000, 0x4000, 0x0000, -48, -24, 0\n"
"	.short 0x0000, 0x4000, 0x0002, -24, -16, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -48, -8, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -24, -32, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -56, -48, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -8, -40, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -64, -32, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -40, -40, 0\n"
"	.short 0x0000, 0x6000, 0x0006, -8, -24, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -32, -24, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -64, -16, 0\n"
"	.short 0x0000, 0x4000, 0x0002, -56, -40, 0\n"
"	.short 0x0000, 0x5000, 0x0000, -32, -56, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -35, -30, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -38, -23, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -22, -24, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -44, -44, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -30, -37, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -12, -31, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -55, -25, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p80, \"a\", %progbits\n"
"	.global AnimSprite_FimbulvetrOBJ_3\n"
"AnimSprite_FimbulvetrOBJ_3:\n"
"	.short 0x0002, 0xFFFF, 0xFF81, 0x00DD, 0xFF23, 0xFF81\n"
"	.short 0x0002, 0xFFFF, 0x00FC, 0x002C, 0xFFD4, 0x00FC\n"
"	.short 0x0100, 0x4000, 0x0000, -58, -33, 0\n"
"	.short 0x0000, 0x4000, 0x0002, -11, -17, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -58, -9, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -13, -44, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -73, -73, 0\n"
"	.short 0x0000, 0x0000, 0x0005, 8, -55, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -83, -48, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -39, -59, 0\n"
"	.short 0x0000, 0x6000, 0x0006, 17, -29, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -25, -27, 0\n"
"	.short 0x0000, 0x5000, 0x0006, -81, -19, 0\n"
"	.short 0x0000, 0x4000, 0x0002, -69, -51, 0\n"
"	.short 0x0100, 0x4200, 0x0000, -15, -85, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -33, -39, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -39, -29, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -11, -30, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -47, -63, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -17, -59, 0\n"
"	.short 0x0000, 0x0000, 0x0005, 2, -40, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -70, -33, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p80, \"a\", %progbits\n"
"	.global AnimSprite_FimbulvetrOBJ_4\n"
"AnimSprite_FimbulvetrOBJ_4:\n"
"	.short 0x0004, 0xFFFF, 0xFF5C, 0x00C4, 0xFF3C, 0xFF5C\n"
"	.short 0x0004, 0xFFFF, 0x007F, 0xFF22, 0x00DE, 0x007F\n"
"	.short 0x0004, 0xFFFF, 0x0000, 0x00FF, 0xFF01, 0x0000\n"
"	.short 0x0004, 0xFFFF, 0x00F0, 0x0057, 0xFFA9, 0x00F0\n"
"	.short 0x0100, 0x4000, 0x0000, -60, -37, 0\n"
"	.short 0x0100, 0x4200, 0x0002, 0, -18, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -66, -11, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -7, -49, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -77, -80, 0\n"
"	.short 0x0000, 0x0000, 0x0005, 18, -60, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -89, -52, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -38, -69, 0\n"
"	.short 0x0000, 0x6000, 0x0006, 24, -33, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -21, -30, 0\n"
"	.short 0x0000, 0x5000, 0x0006, -90, -22, 0\n"
"	.short 0x0100, 0x4400, 0x0002, -73, -56, 0\n"
"	.short 0x0100, 0x4600, 0x0000, -7, -93, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -33, -44, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -39, -32, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -1, -34, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -51, -72, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -11, -66, 0\n"
"	.short 0x0000, 0x0000, 0x0005, 11, -44, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -77, -35, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p80, \"a\", %progbits\n"
"	.global AnimSprite_FimbulvetrOBJ_5\n"
"AnimSprite_FimbulvetrOBJ_5:\n"
"	.short 0x0004, 0xFFFF, 0xFF3D, 0x00A4, 0xFF5C, 0xFF3D\n"
"	.short 0x0004, 0xFFFF, 0x00A4, 0xFF3C, 0x00C4, 0x00A4\n"
"	.short 0x0004, 0xFFFF, 0x002C, 0x00FC, 0xFF04, 0x002C\n"
"	.short 0x0004, 0xFFFF, 0x00DD, 0x007F, 0xFF81, 0x00DD\n"
"	.short 0x0100, 0x4000, 0x0000, -66, -41, 0\n"
"	.short 0x0100, 0x4200, 0x0002, 8, -20, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -72, -12, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -3, -52, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -80, -86, 0\n"
"	.short 0x0000, 0x0000, 0x0005, 25, -64, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -95, -53, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -38, -76, 0\n"
"	.short 0x0000, 0x6000, 0x0006, 30, -35, 0\n"
"	.short 0x0000, 0x4000, 0x0006, -15, -36, 0\n"
"	.short 0x0000, 0x5000, 0x0006, -96, -23, 0\n"
"	.short 0x0100, 0x4400, 0x0002, -81, -64, 0\n"
"	.short 0x0100, 0x4600, 0x0000, 1, -99, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -32, -48, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -41, -36, 0\n"
"	.short 0x0000, 0x0000, 0x0004, 5, -37, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -55, -79, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -7, -71, 0\n"
"	.short 0x0000, 0x0000, 0x0005, 18, -47, 0\n"
"	.short 0x0000, 0x0000, 0x0005, -81, -37, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
