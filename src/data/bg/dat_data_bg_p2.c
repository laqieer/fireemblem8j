#include "global.h"

/* Migrated from asm/dat_data_bg_p2.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_bg_p2") u8 bg_Normal_Village_map[] = INCBIN_U8("data/residual/bg_Normal_Village_map.bin");
SECTION(".rodata.dat_data_bg_p2") u8 bg_Normal_Village_palette[] = INCBIN_U8("data/residual/bg_Normal_Village_palette.bin");
