#include "global.h"

/* Migrated from asm/dat_gGameOptions_ref.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_gGameOptions_ref") u8 gGameOptions[] = INCBIN_U8("data/residual/gGameOptions.bin");
