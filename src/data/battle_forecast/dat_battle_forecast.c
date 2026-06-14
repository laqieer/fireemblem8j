#include "global.h"

/* Migrated from asm/dat_battle_forecast.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_battle_forecast") u8 gBattleForecast_0[] = INCBIN_U8("data/residual/gBattleForecast_0.bin");
SECTION(".rodata.dat_battle_forecast") u8 gBattleForecast_1[] = INCBIN_U8("data/residual/gBattleForecast_1.bin");
SECTION(".rodata.dat_battle_forecast") u16 gTSA_BattleForecastStandard[] = INCBIN_U16("data/residual/gTSA_BattleForecastStandard.bin");
SECTION(".rodata.dat_battle_forecast") u16 gTSA_BattleForecastExtended[] = INCBIN_U16("data/residual/gTSA_BattleForecastExtended.bin");
SECTION(".rodata.dat_battle_forecast") u16 gBattleForecast_x2x4Gfx[] = INCBIN_U16("data/residual/gBattleForecast_x2x4Gfx.bin");
SECTION(".rodata.dat_battle_forecast") u16 gBattleForecast_x2x4Pal[] = INCBIN_U16("data/residual/gBattleForecast_x2x4Pal.bin");
SECTION(".rodata.dat_battle_forecast") u8 gBattleForecast_2[] = INCBIN_U8("data/residual/gBattleForecast_2.bin");
