#include "global.h"

/* Migrated from asm/data_08A66080.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 EventScr_Ch9A_0[] __attribute__((section(".data.residue.08A66080"))) = INCBIN_U8("data/residual/data_08A66080.bin", 0, 40);
u8 EventScr_Ch9A_1[] __attribute__((section(".data.residue.08A660A8"))) = INCBIN_U8("data/residual/data_08A66080.bin", 40, 40);
