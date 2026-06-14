#include "global.h"

/* Migrated from asm/data_08A625BC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 EventScr_Ch2_Turn1Player[] __attribute__((section(".data.residue.08A625BC"))) = INCBIN_U8("data/residual/data_08A625BC.bin", 0, 24);
u8 EventScr_Ch2_Turn2Player[] __attribute__((section(".data.residue.08A625D4"))) = INCBIN_U8("data/residual/data_08A625BC.bin", 24, 24);
