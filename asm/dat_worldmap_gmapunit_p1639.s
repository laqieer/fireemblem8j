	.section .rodata.dat_worldmap_gmapunit_p1639, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08aaf350 (US 0x08a2e5ec, shift -0xFFF7F29C); incbin baserom.gba
	.global Img_MenuStatus_0
Img_MenuStatus_0:
	.incbin "graphics/gmapunit/Img_MenuStatus_0.bin.lz"
	.global gMenuStatus_0
gMenuStatus_0:
	.incbin "baserom.gba", 0xAAF5F4, 0x60
	.global Pal_MenuStatus_0
Pal_MenuStatus_0:
	.incbin "graphics/gmapunit/Pal_MenuStatus_0.gbapal"
	.global Img_SysBlackBox
Img_SysBlackBox:
	.incbin "graphics/gmapunit/Img_SysBlackBox.bin.lz"
