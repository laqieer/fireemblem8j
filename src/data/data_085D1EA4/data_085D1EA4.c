#include "global.h"

/* Migrated from asm/data_085D1EA4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* First 24 B (0x5D1EA4-0x5D1EBC) carved as cp_decide.o(.data) sDecideFuncList; tail kept here. */
u8 data_085D1EBC[] __attribute__((section(".data.residue.085D1EBC"))) = INCBIN_U8("data/residual/data_085D1EA4.bin", 24, 80);
