#include "global.h"

/* Migrated from asm/dat_data_banim_p178.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p178") u16 Img_GleipnirSprites_Comet[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/006A2874_Img_GleipnirSprites_Comet.4bpp.lz");
SECTION(".rodata.dat_data_banim_p178") u16 Pal_GleipnirSprites_Comet[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/006A2CE8_Pal_GleipnirSprites_Comet.gbapal");
__asm__(
"	.section .rodata.dat_data_banim_p178, \"a\", %progbits\n"
"	.global AnimSprite_EfxDarkGradoOBJ02piece_R_1\n"
"AnimSprite_EfxDarkGradoOBJ02piece_R_1:\n"
"	.short 0x0001, 0xFFFF, 0x0080, 0x0000, 0x0000, 0x0080\n"
"	.short 0x0300, 0x8000, 0x0000, -32, -32, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p178, \"a\", %progbits\n"
"	.global AnimSprite_EfxDarkGradoOBJ02piece_R_2\n"
"AnimSprite_EfxDarkGradoOBJ02piece_R_2:\n"
"	.short 0x0001, 0xFFFF, 0x0080, 0x0000, 0x0000, 0x0080\n"
"	.short 0x0300, 0x8000, 0x0004, -32, -32, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p178, \"a\", %progbits\n"
"	.global AnimSprite_EfxDarkGradoOBJ02piece_R_3\n"
"AnimSprite_EfxDarkGradoOBJ02piece_R_3:\n"
"	.short 0x0001, 0xFFFF, 0x0080, 0x0000, 0x0000, 0x0080\n"
"	.short 0x0300, 0x8000, 0x0008, -32, -32, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
