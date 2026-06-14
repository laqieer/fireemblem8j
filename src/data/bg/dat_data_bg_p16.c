#include "global.h"

/* Migrated from asm/dat_data_bg_p16.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p16") u8 bg_Cell_map[] = INCBIN_U8("data/residual/bg_Cell_map.bin");
SECTION(".rodata.dat_data_bg_p16") u8 bg_Cell_palette[] = INCBIN_U8("data/residual/bg_Cell_palette.bin");
