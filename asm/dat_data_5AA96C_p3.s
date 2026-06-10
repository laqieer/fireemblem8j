	.section .rodata.dat_data_5AA96C_p3, "a", %progbits
@ src/data/data_5AA96C.o: region-same content at JP 0x085d8068 (US 0x085addc8, shift -0xFFFD5D60); incbin baserom.gba
	.global Pal_LinkArenaPlacementRanks
Pal_LinkArenaPlacementRanks:
	.incbin "graphics/misc_gfx2/Pal_LinkArenaPlacementRanks.gbapal"
	.global gUnkData_10
gUnkData_10:
	.incbin "baserom.gba", 0x5D8088, 0x20
	.global Pal_LinkArenaActiveBannerFx
Pal_LinkArenaActiveBannerFx:
	.incbin "graphics/misc_gfx2/Pal_LinkArenaActiveBannerFx.gbapal"
	.global gUnkData_11
gUnkData_11:
	.incbin "baserom.gba", 0x5D80C8, 0x20
	.global gUnkData_12
gUnkData_12:
	.incbin "baserom.gba", 0x5D80E8, 0x20
	.global Pal_UnkData_0
Pal_UnkData_0:
	.incbin "graphics/misc_gfx2/Pal_UnkData_0.gbapal"
	.global gUnkData_13
gUnkData_13:
	.incbin "baserom.gba", 0x5D8128, 0xB8
	.global gUnkData_14
gUnkData_14:
	.incbin "baserom.gba", 0x5D81E0, 0x250
	.global Tsa_UnkData_0
Tsa_UnkData_0:
	.incbin "graphics/misc_gfx2/Tsa_UnkData_0.bin"
	.global Tsa_SioResultRankings
Tsa_SioResultRankings:
	.incbin "graphics/misc_gfx2/Tsa_SioResultRankings.bin"
	.global gUnkData_15
gUnkData_15:
	.incbin "baserom.gba", 0x5D8A18, 0x74
