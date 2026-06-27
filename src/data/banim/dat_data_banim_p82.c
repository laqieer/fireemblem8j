#include "global.h"

/* Migrated from asm/dat_data_banim_p82.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p82") u8 AnimSprite_FimbulvetrOBJ_25[] = INCBIN_U8("graphics/reuse/AnimSprite_FimbulvetrOBJ_25.4bpp");
SECTION(".rodata.dat_data_banim_p82") u8 AnimSprite_FimbulvetrOBJ_26[] = INCBIN_U8("graphics/reuse/AnimSprite_FimbulvetrOBJ_26.4bpp");
SECTION(".rodata.dat_data_banim_p82") u8 AnimSprite_FimbulvetrOBJ_27[] = INCBIN_U8("graphics/reuse/AnimSprite_FimbulvetrOBJ_27.4bpp");
__asm__(
"	.section .rodata.dat_data_banim_p82, \"a\", %progbits\n"
"	.global AnimSprite_FimbulvetrOBJ_28\n"
"AnimSprite_FimbulvetrOBJ_28:\n"
"	.short 0x0004, 0xFFFF, 0xFF80, 0xFF23, 0x00DD, 0xFF80\n"
"	.short 0x0004, 0xFFFF, 0x00FB, 0xFFD3, 0x002D, 0x00FB\n"
"	.short 0x0004, 0xFFFF, 0xFF10, 0x0057, 0xFFA9, 0xFF10\n"
"	.short 0x0004, 0xFFFF, 0xFF5C, 0xFF3D, 0x00C3, 0xFF5C\n"
"	.short 0x0000, 0x0000, 0x0004, -98, 29, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -106, -64, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -48, -19, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -56, 7, 0\n"
"	.short 0x0000, 0x0000, 0x0004, 28, 2, 0\n"
"	.short 0x0000, 0x0000, 0x0004, -79, -56, 0\n"
"	.short 0x0100, 0x4000, 0x0008, 26, -79, 0\n"
"	.short 0x0000, 0x0000, 0x000D, 51, -32, 0\n"
"	.short 0x0000, 0x0000, 0x000D, 22, -19, 0\n"
"	.short 0x0000, 0x0000, 0x000D, 14, -52, 0\n"
"	.short 0x0000, 0x0000, 0x000D, 51, -32, 0\n"
"	.short 0x0000, 0x0000, 0x000D, 44, -10, 0\n"
"	.short 0x0000, 0x0000, 0x000D, -107, 4, 0\n"
"	.short 0x0100, 0x4200, 0x0008, -92, -2, 0\n"
"	.short 0x0100, 0x4400, 0x000A, 34, 20, 0\n"
"	.short 0x0000, 0x4000, 0x000E, -60, -54, 0\n"
"	.short 0x0000, 0x4000, 0x000E, 3, 9, 0\n"
"	.short 0x0000, 0x6000, 0x000E, 56, 3, 0\n"
"	.short 0x0000, 0x5000, 0x000E, -122, 17, 0\n"
"	.short 0x0100, 0x4600, 0x000A, -106, -29, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
