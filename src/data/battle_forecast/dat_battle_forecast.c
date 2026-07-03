#include "global.h"

/* Migrated from asm/dat_battle_forecast.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_battle_forecast") u8 gBattleForecast_0[] = INCBIN_U8("graphics/battle_forecast/gBattleForecast_0.tsa.bin");
SECTION(".rodata.dat_battle_forecast") u8 gBattleForecast_1[] = INCBIN_U8("graphics/battle_forecast/gBattleForecast_1.tsa.bin");
SECTION(".rodata.dat_battle_forecast") u16 gTSA_BattleForecastStandard[] = INCBIN_U16("graphics/battle_forecast/gTSA_BattleForecastStandard.tsa.bin");
SECTION(".rodata.dat_battle_forecast") u16 gTSA_BattleForecastExtended[] = INCBIN_U16("graphics/battle_forecast/gTSA_BattleForecastExtended.tsa.bin");
SECTION(".rodata.dat_battle_forecast") u16 gBattleForecast_x2x4Gfx[] = INCBIN_U16("graphics/reuse/gBattleForecast_x2x4Gfx.4bpp.lz");
SECTION(".rodata.dat_battle_forecast") u16 gBattleForecast_x2x4Pal[] = INCBIN_U16("graphics/battle_forecast/gBattleForecast_x2x4Pal.gbapal");
SECTION(".rodata.dat_battle_forecast") u8 gBattleForecast_2[] = INCBIN_U8("graphics/battle_forecast/gBattleForecast_2.tsa.bin");
