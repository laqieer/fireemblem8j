	.section .rodata.dat_worldmap_gmapunit_p1580, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a930d8 (US 0x08a1738c, shift -0xFFF842B4); incbin baserom.gba
	.global gPal_PlayerInterface_Blue
gPal_PlayerInterface_Blue:
	.incbin "graphics/gmapunit/gPal_PlayerInterface_Blue.gbapal"
	.global gPal_PlayerInterface_Red
gPal_PlayerInterface_Red:
	.incbin "graphics/gmapunit/gPal_PlayerInterface_Red.gbapal"
	.global gPal_PlayerInterface_Green
gPal_PlayerInterface_Green:
	.incbin "graphics/gmapunit/gPal_PlayerInterface_Green.gbapal"
	.global gTSA_UnitInfoWindow
gTSA_UnitInfoWindow:
	.incbin "baserom.gba", 0xA93138, 0x40
	.global gTSA_TerrainBox
gTSA_TerrainBox:
	.incbin "baserom.gba", 0xA93178, 0x58
	.global gTSA_MinimugBox
gTSA_MinimugBox:
	.incbin "baserom.gba", 0xA931D0, 0x130
	.global gUnkData_50
gUnkData_50:
	.incbin "baserom.gba", 0xA93300, 0x14
	.global gUnkData_51
gUnkData_51:
	.incbin "baserom.gba", 0xA93314, 0x14
	.global gUnkData_52
gUnkData_52:
	.incbin "baserom.gba", 0xA93328, 0x14
	.global gUnkData_53
gUnkData_53:
	.incbin "baserom.gba", 0xA9333C, 0x14
	.global gUnkData_54
gUnkData_54:
	.incbin "baserom.gba", 0xA93350, 0x38
	.global gUnkData_55
gUnkData_55:
	.incbin "baserom.gba", 0xA93388, 0x14
	.global gUnkData_56
gUnkData_56:
	.incbin "baserom.gba", 0xA9339C, 0x14
	.global gUnkData_57
gUnkData_57:
	.incbin "baserom.gba", 0xA933B0, 0x14
	.global gUnkData_58
gUnkData_58:
	.incbin "baserom.gba", 0xA933C4, 0x14
	.global Tsa_TerrainMapUi_Labels
Tsa_TerrainMapUi_Labels:
	.incbin "graphics/gmapunit/Tsa_TerrainMapUi_Labels.bin"
