#include "global.h"

/* Migrated from asm/dat_data_bg_p30.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p30") u8 bg_Fort_Sunset_map[] = INCBIN_U8("data/residual/bg_Fort_Sunset_map.bin");
SECTION(".rodata.dat_data_bg_p30") u8 bg_Fort_Sunset_palette[] = INCBIN_U8("data/residual/bg_Fort_Sunset_palette.bin");
