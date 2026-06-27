#include "global.h"

/* Migrated from asm/dat_data_bg_p14.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p14") u8 bg_Garden_palette[] = INCBIN_U8("graphics/reuse/bg_Garden_palette.4bpp");
SECTION(".rodata.dat_data_bg_p14") u8 bg_Garden_Flashback_palette[] = INCBIN_U8("graphics/reuse/bg_Garden_Flashback_palette.4bpp");
