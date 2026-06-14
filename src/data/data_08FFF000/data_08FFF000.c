#include "global.h"

/* Migrated from asm/data_08FFF000.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 data_08FFF000[] __attribute__((section(".data.residue.08FFF000"))) = INCBIN_U8("data/residual/data_08FFF000.bin");
