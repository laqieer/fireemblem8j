	.section .rodata.dat_worldmap_gmapunit_p1582, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a93408 (US 0x08a176bc, shift -0xFFF842B4); incbin baserom.gba
	.global gTSA_GoalBox_TwoLines
gTSA_GoalBox_TwoLines:
	.incbin "baserom.gba", 0xA93408, 0x88
	.global gTSA_GoalBox_OneLine
gTSA_GoalBox_OneLine:
	.incbin "baserom.gba", 0xA93490, 0x5C
