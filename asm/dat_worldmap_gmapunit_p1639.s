	.section .rodata.dat_worldmap_gmapunit_p1639, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08aaf350 (US 0x08a2e5ec, shift -0xFFF7F29C); incbin baserom.gba
	.global Img_MenuStatus_0
Img_MenuStatus_0:
	.incbin "baserom.gba", 0xAAF350, 0x2A4
	.global gMenuStatus_0
gMenuStatus_0:
	.incbin "baserom.gba", 0xAAF5F4, 0x60
	.global Pal_MenuStatus_0
Pal_MenuStatus_0:
	.incbin "baserom.gba", 0xAAF654, 0x60
	.global Img_SysBlackBox
Img_SysBlackBox:
	.incbin "baserom.gba", 0xAAF6B4, 0x24
