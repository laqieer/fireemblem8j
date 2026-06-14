#include "global.h"

/* Migrated from asm/data_08A64FA0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 EventScr_Ch7_1[] __attribute__((section(".data.residue.08A64FA0"))) = INCBIN_U8("data/residual/data_08A64FA0.bin", 0, 40);
u8 EventScr_Ch7_2[] __attribute__((section(".data.residue.08A64FC8"))) = INCBIN_U8("data/residual/data_08A64FA0.bin", 40, 40);
u8 EventScr_Ch7_3[] __attribute__((section(".data.residue.08A64FF0"))) = INCBIN_U8("data/residual/data_08A64FA0.bin", 80, 124);
