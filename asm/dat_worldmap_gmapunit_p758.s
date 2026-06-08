	.section .rodata.dat_worldmap_gmapunit_p758, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085e52f8 (US 0x085bb0c8, shift -0xFFFD5DD0); incbin baserom.gba
	.global Img_LvupApfx
Img_LvupApfx:
	.incbin "baserom.gba", 0x5E52F8, 0x214
	.global Pal_LvupApfx
Pal_LvupApfx:
	.incbin "baserom.gba", 0x5E550C, 0x20
	.global gEfxlvupfx_0
gEfxlvupfx_0:
	.incbin "baserom.gba", 0x5E552C, 0xDA4
