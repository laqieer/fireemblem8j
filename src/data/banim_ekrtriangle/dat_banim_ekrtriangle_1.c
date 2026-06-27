#include "global.h"

/* Migrated from asm/dat_banim_ekrtriangle_1.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_banim_ekrtriangle_1") u8 AnimSprite_Tri_6[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_6.4bpp");
SECTION(".rodata.dat_banim_ekrtriangle_1") u8 AnimSprite_Tri_7[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_7.4bpp");
SECTION(".rodata.dat_banim_ekrtriangle_1") u8 AnimSprite_Tri_8[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_8.4bpp");
__asm__(
"	.section .rodata.dat_banim_ekrtriangle_1, \"a\", %progbits\n"
"	.global AnimSprite_Tri_9\n"
"AnimSprite_Tri_9:\n"
"	.short 0x0000, 0x4000, 0x0051, 74, -8, 0\n"
"	.short 0x8000, 0x0000, 0x0053, 90, -8, 0\n"
"	.short 0x0000, 0x0000, 0x0050, 76, -16, 0\n"
"	.short 0x0000, 0x4000, 0x0054, 84, -24, 0\n"
"	.short 0x0000, 0x0000, 0x0070, 66, 0, 0\n"
"	.short 0x4000, 0x4000, 0x007B, 60, 8, 0\n"
"	.short 0x4000, 0x8000, 0x0040, 43, 24, 0\n"
"	.short 0x8000, 0x0000, 0x0044, 75, 24, 0\n"
"	.short 0x4000, 0x8000, 0x0045, 36, 8, 0\n"
"	.short 0x4000, 0x8000, 0x0049, 44, -8, 0\n"
"	.short 0x4000, 0x0000, 0x004D, 68, 16, 0\n"
"	.short 0x4000, 0x0000, 0x006D, 76, -13, 0\n"
"	.short 0x0000, 0x0000, 0x004F, 36, -1, 0\n"
"	.short 0x0000, 0x4000, 0x0056, 39, -32, 0\n"
"	.short 0x0000, 0x4000, 0x0058, 39, -16, 0\n"
"	.short 0x8000, 0x0000, 0x005A, 55, -16, 0\n"
"	.short 0x4000, 0x0000, 0x005B, 47, 0, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
