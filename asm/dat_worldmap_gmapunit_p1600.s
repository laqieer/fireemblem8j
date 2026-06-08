	.section .rodata.dat_worldmap_gmapunit_p1600, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a97720 (US 0x08a1ac88, shift -0xFFF83568); incbin baserom.gba
	.global gUnkData_66
gUnkData_66:
	.incbin "baserom.gba", 0xA97720, 0x450
	.global Img_SysBrownBox
Img_SysBrownBox:
	.incbin "baserom.gba", 0xA97B70, 0x7C
