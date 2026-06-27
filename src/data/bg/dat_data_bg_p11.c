#include "global.h"

/* Migrated from asm/dat_data_bg_p11.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p11") u8 bg_Throne_Normal_palette[] = INCBIN_U8("graphics/reuse/bg_Throne_Normal_palette.gbapal");
SECTION(".rodata.dat_data_bg_p11") u8 bg_Throne_Flashback_palette[] = INCBIN_U8("graphics/reuse/bg_Throne_Flashback_palette.4bpp");
