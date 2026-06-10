	.section .rodata.dat_battle_forecast, "a", %progbits
	.align 2
@ src/data/ui/battle_forecast.o: region-same content at JP 0x085c8d58 (US 0x085a0838, shift -0x-28520); incbin baserom.gba
	.global gBattleForecast_0
gBattleForecast_0:
	.incbin "data/residual/gBattleForecast_0.bin"
	.global gBattleForecast_1
gBattleForecast_1:
	.incbin "data/residual/gBattleForecast_1.bin"
	.global gTSA_BattleForecastStandard
gTSA_BattleForecastStandard:
	.incbin "data/residual/gTSA_BattleForecastStandard.bin"
	.global gTSA_BattleForecastExtended
gTSA_BattleForecastExtended:
	.incbin "data/residual/gTSA_BattleForecastExtended.bin"
	.global gBattleForecast_x2x4Gfx
gBattleForecast_x2x4Gfx:
	.incbin "data/residual/gBattleForecast_x2x4Gfx.bin"
	.global gBattleForecast_x2x4Pal
gBattleForecast_x2x4Pal:
	.incbin "data/residual/gBattleForecast_x2x4Pal.bin"
	.global gBattleForecast_2
gBattleForecast_2:
	.incbin "data/residual/gBattleForecast_2.bin"
