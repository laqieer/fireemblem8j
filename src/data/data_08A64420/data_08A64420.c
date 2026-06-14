#include "global.h"

/* Migrated from asm/data_08A64420.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 EventScr_Ch5_6[] __attribute__((section(".data.residue.08A64420"))) = INCBIN_U8("data/residual/data_08A64420.bin", 0, 24);
u8 EventScr_Ch5_7[] __attribute__((section(".data.residue.08A64438"))) = INCBIN_U8("data/residual/data_08A64420.bin", 24, 24);
u8 EventScr_Ch5_8[] __attribute__((section(".data.residue.08A64450"))) = INCBIN_U8("data/residual/data_08A64420.bin", 48, 36);
u8 EventScr_Ch5_9[] __attribute__((section(".data.residue.08A64474"))) = INCBIN_U8("data/residual/data_08A64420.bin", 84, 32);
