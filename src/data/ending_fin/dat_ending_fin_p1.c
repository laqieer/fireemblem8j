#include "global.h"

/* Migrated from asm/dat_ending_fin_p1.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_ending_fin_p1") u16 Pal_FinScreen_1[] = INCBIN_U16("graphics/misc_gfx2/Pal_FinScreen_1.gbapal");
SECTION(".rodata.dat_ending_fin_p1") u8 Tsa_EndingFin[] = INCBIN_U8("graphics/misc_gfx2/Tsa_EndingFin.bin");
