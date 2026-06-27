#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p762.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"	.section .rodata.dat_worldmap_gmapunit_p762, \"a\", %progbits\n"
"	.global AnimSprite_EkrMainMini_L_Far\n"
"AnimSprite_EkrMainMini_L_Far:\n"
"	.short 0x4000, 0x8000, 0x0000, -48, 8, 0\n"
"	.short 0x4000, 0x8000, 0x0004, -16, 8, 0\n"
"	.short 0x4000, 0x8000, 0x0008, 16, 8, 0\n"
"	.short 0x8000, 0x0000, 0x000C, 48, 8, 0\n"
"	.short 0x4000, 0x8000, 0x000D, -48, -8, 0\n"
"	.short 0x4000, 0x8000, 0x0011, -16, -8, 0\n"
"	.short 0x4000, 0x8000, 0x0015, 16, -8, 0\n"
"	.short 0x4000, 0x4000, 0x0019, -48, -16, 0\n"
"	.short 0x4000, 0x0000, 0x001D, -16, -16, 0\n"
"	.short 0x4000, 0x4000, 0x0039, 0, -16, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
