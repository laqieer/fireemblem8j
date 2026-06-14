#include "global.h"

/* Migrated from asm/dat_trig_rodata.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_trig_rodata") u8 gSinLookup[] = INCBIN_U8("data/residual/gSinLookup.bin");
