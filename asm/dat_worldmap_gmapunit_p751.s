	.section .rodata.dat_worldmap_gmapunit_p751, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085e3170 (US 0x085b8f90, shift -0xFFFD5E20); incbin baserom.gba
	.global gLegacyUiFrameDPalette
gLegacyUiFrameDPalette:
	.incbin "baserom.gba", 0x5E3170, 0x20
	.global gUiBarPaletteD
gUiBarPaletteD:
	.incbin "baserom.gba", 0x5E3190, 0x40
	.global gUnkUiFrameImage
gUnkUiFrameImage:
	.incbin "baserom.gba", 0x5E31D0, 0x254
	.global gUnkUiFramePalettes
gUnkUiFramePalettes:
	.incbin "baserom.gba", 0x5E3424, 0x80
	.global Img_SysGrayBox
Img_SysGrayBox:
	.incbin "baserom.gba", 0x5E34A4, 0x90
