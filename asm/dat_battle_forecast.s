	.section .rodata.dat_battle_forecast, "a", %progbits
	.align 2
@ src/data/ui/battle_forecast.o: region-same content at JP 0x085c8d58 (US 0x085a0838, shift -0x-28520); incbin baserom.gba
	.global gBattleForecast_0
gBattleForecast_0:
	.incbin "baserom.gba", 0x5C8D58, 0xB8
	.global gBattleForecast_1
gBattleForecast_1:
	.incbin "baserom.gba", 0x5C8E10, 0xB8
	.global gTSA_BattleForecastStandard
gTSA_BattleForecastStandard:
	.incbin "baserom.gba", 0x5C8EC8, 0x144
	.global gTSA_BattleForecastExtended
gTSA_BattleForecastExtended:
	.incbin "baserom.gba", 0x5C900C, 0x194
	.global gBattleForecast_x2x4Gfx
gBattleForecast_x2x4Gfx:
	.incbin "baserom.gba", 0x5C91A0, 0xAC
	.global gBattleForecast_x2x4Pal
gBattleForecast_x2x4Pal:
	.incbin "baserom.gba", 0x5C924C, 0x20
	.global gBattleForecast_2
gBattleForecast_2:
	.incbin "baserom.gba", 0x5C926C, 0x154
