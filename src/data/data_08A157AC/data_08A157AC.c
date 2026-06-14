#include "global.h"

/* Migrated from asm/data_08A157AC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 ProcScr_EggDmgMapEffect2[] __attribute__((section(".data.residue.08A157AC"))) = INCBIN_U8("data/residual/data_08A157AC.bin", 0, 48);
u8 ProcScr_CritAtkMapEffect[] __attribute__((section(".data.residue.08A157DC"))) = INCBIN_U8("data/residual/data_08A157AC.bin", 48, 56);
