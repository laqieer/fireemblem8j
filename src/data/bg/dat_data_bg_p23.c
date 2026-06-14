#include "global.h"

/* Migrated from asm/dat_data_bg_p23.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p23") u8 bg_Stream_map[] = INCBIN_U8("data/residual/bg_Stream_map.bin");
SECTION(".rodata.dat_data_bg_p23") u8 bg_Stream_palette[] = INCBIN_U8("data/residual/bg_Stream_palette.bin");
