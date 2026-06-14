#include "global.h"

/* Migrated from asm/data_08A61B60.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 EventScr_Ch1_Turn1Player[] __attribute__((section(".data.residue.08A61B60"))) = INCBIN_U8("data/residual/data_08A61B60.bin", 0, 24);
u8 EventScr_Ch1_Turn1Enemy[] __attribute__((section(".data.residue.08A61B78"))) = INCBIN_U8("data/residual/data_08A61B60.bin", 24, 40);
