#include "global.h"

/* Migrated from asm/dat_gMPlayTable_ref.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_gMPlayTable_ref") u8 gMPlayTable[] = INCBIN_U8("data/sound/gMPlayTable.bin");
