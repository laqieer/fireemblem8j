	.section .rodata.dat_data_5B65C0_p0, "a", %progbits
@ src/data/data_5B65C0.o: region-same content at JP 0x085e07a0 (US 0x085b65c0, shift -0xFFFD5E20); incbin baserom.gba
	.global gUiFrameImage
gUiFrameImage:
	.incbin "baserom.gba", 0x5E07A0, 0x5F4
	.global gUiFramePaletteA
gUiFramePaletteA:
	.incbin "baserom.gba", 0x5E0D94, 0x20
	.global gUiFramePaletteB
gUiFramePaletteB:
	.incbin "baserom.gba", 0x5E0DB4, 0x20
	.global gUiFramePaletteC
gUiFramePaletteC:
	.incbin "baserom.gba", 0x5E0DD4, 0x20
	.global gUiFramePaletteD
gUiFramePaletteD:
	.incbin "baserom.gba", 0x5E0DF4, 0xA0
