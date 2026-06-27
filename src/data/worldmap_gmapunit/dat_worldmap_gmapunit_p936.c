#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p936.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"	.section .rodata.dat_worldmap_gmapunit_p936, \"a\", %progbits\n"
"	.global AnimSprite_EfxRestOBJ_35\n"
"AnimSprite_EfxRestOBJ_35:\n"
"	.short 0x0000, 0x0000, 0x001B, -8, 7, 0\n"
"	.short 0x0000, 0x0000, 0x001B, -12, 3, 0\n"
"	.short 0x0000, 0x0000, 0x001B, 7, -18, 0\n"
"	.short 0x0000, 0x0000, 0x001B, 11, -14, 0\n"
"	.short 0x0000, 0x0000, 0x001B, 15, -10, 0\n"
"	.short 0x0000, 0x0000, 0x001B, 18, -5, 0\n"
"	.short 0x0000, 0x0000, 0x001A, 20, 0, 0\n"
"	.short 0x0000, 0x0000, 0x001A, 21, 6, 0\n"
"	.short 0x0000, 0x0000, 0x001B, 20, 12, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
SECTION(".rodata.dat_worldmap_gmapunit_p936") u8 AnimSprite_EfxRestOBJ_36[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxRestOBJ_36.4bpp");
