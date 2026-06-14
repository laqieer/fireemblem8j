#include "global.h"

/* Migrated from asm/dat_impure_data_ref.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_impure_data_ref") u8 impure_data[] = INCBIN_U8("data/residual/impure_data.bin");
