#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p946.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"	.section .rodata.dat_worldmap_gmapunit_p946, \"a\", %progbits\n"
"	.global AnimSprite_EfxHammarneOBJ_35\n"
"AnimSprite_EfxHammarneOBJ_35:\n"
"	.short 0x0000, 0x1000, 0x001B, 0, 7, 0\n"
"	.short 0x0000, 0x1000, 0x001B, 4, 3, 0\n"
"	.short 0x0000, 0x1000, 0x001B, -15, -18, 0\n"
"	.short 0x0000, 0x1000, 0x001B, -19, -14, 0\n"
"	.short 0x0000, 0x1000, 0x001B, -23, -10, 0\n"
"	.short 0x0000, 0x1000, 0x001B, -26, -5, 0\n"
"	.short 0x0000, 0x1000, 0x001A, -28, 0, 0\n"
"	.short 0x0000, 0x1000, 0x001A, -29, 6, 0\n"
"	.short 0x0000, 0x1000, 0x001B, -28, 12, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
SECTION(".rodata.dat_worldmap_gmapunit_p946") u8 AnimSprite_EfxHammarneOBJ_36[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxHammarneOBJ_36.4bpp");
