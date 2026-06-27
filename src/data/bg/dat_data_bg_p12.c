#include "global.h"

/* Migrated from asm/dat_data_bg_p12.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p12") u8 bg_Castle_Bright_palette[] = INCBIN_U8("graphics/reuse/bg_Castle_Bright_palette.gbapal");
SECTION(".rodata.dat_data_bg_p12") u8 bg_Castle_Dark_palette[] = INCBIN_U8("graphics/reuse/bg_Castle_Dark_palette.4bpp");
