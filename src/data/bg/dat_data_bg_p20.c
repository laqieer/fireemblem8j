#include "global.h"

/* Migrated from asm/dat_data_bg_p20.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p20") u8 bg_Grass_Plains_map[] = INCBIN_U8("data/residual/bg_Grass_Plains_map.bin");
SECTION(".rodata.dat_data_bg_p20") u8 bg_Grass_Plains_palette[] = INCBIN_U8("data/residual/bg_Grass_Plains_palette.bin");
