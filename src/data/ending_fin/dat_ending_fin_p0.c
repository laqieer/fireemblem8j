#include "global.h"

/* Migrated from asm/dat_ending_fin_p0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_ending_fin_p0") u16 Pal_FinScreen[] = INCBIN_U16("graphics/misc_gfx2/Pal_FinScreen.gbapal");
SECTION(".rodata.dat_ending_fin_p0") u8 Img_FinScreen[] = INCBIN_U8("graphics/misc_gfx2/Img_FinScreen.bin.lz");
