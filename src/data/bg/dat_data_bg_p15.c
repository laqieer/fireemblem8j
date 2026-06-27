#include "global.h"

/* Migrated from asm/dat_data_bg_p15.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p15") u8 bg_Manse_Back_palette[] = INCBIN_U8("graphics/reuse/bg_Manse_Back_palette.4bpp");
SECTION(".rodata.dat_data_bg_p15") u8 bg_Manse_Flashback_palette[] = INCBIN_U8("graphics/reuse/bg_Manse_Flashback_palette.4bpp");
