#include "global.h"

/* Migrated from asm/gap_000B1030.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 gap_000B1030[] __attribute__((section(".rodata.gap_000B1030"))) = INCBIN_U8("data/residual/gap_000B1030.bin");
