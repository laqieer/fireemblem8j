#include "global.h"

/* Migrated from asm/data_085C6770.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 sProcScr_StatusHealEffect_OverlayBg[] __attribute__((section(".data.residue.085C6770"))) = INCBIN_U8("data/residual/data_085C6770.bin", 0, 24);
u8 sProcScr_StatusHealEffect_BlendedSprite[] __attribute__((section(".data.residue.085C6788"))) = INCBIN_U8("data/residual/data_085C6770.bin", 24, 32);
u8 sProcScr_StatusHealEffect_BlendAnim[] __attribute__((section(".data.residue.085C67A8"))) = INCBIN_U8("data/residual/data_085C6770.bin", 56, 48);
u8 sProcScr_StatusHealEffect_PalAnim[] __attribute__((section(".data.residue.085C67D8"))) = INCBIN_U8("data/residual/data_085C6770.bin", 104, 32);
u8 sProcScr_StatusHealEffect[] __attribute__((section(".data.residue.085C67F8"))) = INCBIN_U8("data/residual/data_085C6770.bin", 136, 56);
