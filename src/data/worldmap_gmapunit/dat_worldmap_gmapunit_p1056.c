#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1056.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1056") u8 AnimSprite_Tri_13[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_13.4bpp");
__asm__(
"	.section .rodata.dat_worldmap_gmapunit_p1056, \"a\", %progbits\n"
"	.global AnimSprite_Tri_14\n"
"AnimSprite_Tri_14:\n"
"	.short 0x4000, 0x4000, 0x0039, -30, 4, 0\n"
"	.short 0x4000, 0x8000, 0x0013, -36, -12, 0\n"
"	.short 0x0000, 0x4000, 0x0017, -4, -12, 0\n"
"	.short 0x4000, 0x8000, 0x000F, -35, -28, 0\n"
"	.short 0x4000, 0x0000, 0x0019, -3, -20, 0\n"
"	.short 0x0000, 0x0000, 0x001B, -43, -14, 0\n"
"	.short 0x4000, 0x0000, 0x002D, -59, -12, 0\n"
"	.short 0x0000, 0x0000, 0x000D, -67, -13, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
