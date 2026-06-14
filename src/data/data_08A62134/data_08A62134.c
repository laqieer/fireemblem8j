#include "global.h"

/* Migrated from asm/data_08A62134.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 EventScr_Ch1Tut_TradeSelectGalliamEnd[] __attribute__((section(".data.residue.08A62134"))) = INCBIN_U8("data/residual/data_08A62134.bin", 0, 52);
u8 EventScr_Ch1Tut_AfterTrade[] __attribute__((section(".data.residue.08A62168"))) = INCBIN_U8("data/residual/data_08A62134.bin", 52, 48);
u8 EventScr_Ch1Tut_PostTradeAndItemUseAction[] __attribute__((section(".data.residue.08A62198"))) = INCBIN_U8("data/residual/data_08A62134.bin", 100, 48);
u8 EventScr_Ch1Tut_GuideMsgSeize[] __attribute__((section(".data.residue.08A621C8"))) = INCBIN_U8("data/residual/data_08A62134.bin", 148, 44);
