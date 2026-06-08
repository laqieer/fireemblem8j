	.section .rodata.dat_worldmap_gmapunit_p1655, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08ac0af8 (US 0x08a3d2c0, shift -0xFFF7C7C8); incbin baserom.gba
	.global gCharacterEndingDefeatLut
gCharacterEndingDefeatLut:
	.incbin "baserom.gba", 0xAC0AF8, 0x88
	.global gSoloEndingBattleDispConf
gSoloEndingBattleDispConf:
	.incbin "baserom.gba", 0xAC0B80, 0x10
