	.section .rodata.dat_worldmap_gmapunit_p1549, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a60960 (US 0x089ee828, shift -0xFFF8DEC8); incbin baserom.gba
	.global EventScr_ConfigHardModeLoadUnitHard
EventScr_ConfigHardModeLoadUnitHard:
	.incbin "baserom.gba", 0xA60960, 0x24
	.global EventScr_9EE84C
EventScr_9EE84C:
	.incbin "baserom.gba", 0xA60984, 0xA4
