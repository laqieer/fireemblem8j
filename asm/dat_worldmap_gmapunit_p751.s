	.section .rodata.dat_worldmap_gmapunit_p751, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085e3170 (US 0x085b8f90, shift -0xFFFD5E20); incbin baserom.gba
	.global gLegacyUiFrameDPalette
gLegacyUiFrameDPalette:
	.incbin "data/residual/gLegacyUiFrameDPalette.bin"
	.global gUiBarPaletteD
gUiBarPaletteD:
	.incbin "data/residual/gUiBarPaletteD.bin"
	.global gUnkUiFrameImage
gUnkUiFrameImage:
	.incbin "data/residual/gUnkUiFrameImage.bin"
	.global gUnkUiFramePalettes
gUnkUiFramePalettes:
	.incbin "data/residual/gUnkUiFramePalettes.bin"
	.global Img_SysGrayBox
Img_SysGrayBox:
	.incbin "graphics/gmapunit/Img_SysGrayBox.bin.lz"
