	.section .rodata.dat_worldmap_gmapunit_p1606, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a9aa9c (US 0x08a1db80, shift -0xFFF830E4); incbin baserom.gba
	.global gUnkData_80
gUnkData_80:
	.incbin "baserom.gba", 0xA9AA9C, 0x9C
	.global gTsa_SupportSubScreen
gTsa_SupportSubScreen:
	.incbin "baserom.gba", 0xA9AB38, 0xF0
