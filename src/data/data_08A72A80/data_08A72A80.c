#include "global.h"

/* Migrated from asm/data_08A72A80.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 gProcScr_SSBgOffsetCtrl[] __attribute__((section(".data.residue.08A72A80"))) = INCBIN_U8("data/residual/data_08A72A80.bin", 0, 16);
u8 gProcScr_StatScreen[] __attribute__((section(".data.residue.08A72A90"))) = INCBIN_U8("data/residual/data_08A72A80.bin", 16, 192);
u8 gProcScr_HelpBox[] __attribute__((section(".data.residue.08A72B50"))) = INCBIN_U8("data/residual/data_08A72A80.bin", 208, 56);
u8 gProcScr_HelpBoxMoveCtrl[] __attribute__((section(".data.residue.08A72B88"))) = INCBIN_U8("data/residual/data_08A72A80.bin", 264, 48);
