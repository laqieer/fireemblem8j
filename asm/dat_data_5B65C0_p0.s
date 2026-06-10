	.section .rodata.dat_data_5B65C0_p0, "a", %progbits
@ src/data/data_5B65C0.o: region-same content at JP 0x085e07a0 (US 0x085b65c0, shift -0xFFFD5E20); incbin baserom.gba
	.global gUiFrameImage
gUiFrameImage:
	.incbin "data/residual/gUiFrameImage.bin"
	.global gUiFramePaletteA
gUiFramePaletteA:
	.incbin "data/residual/gUiFramePaletteA.bin"
	.global gUiFramePaletteB
gUiFramePaletteB:
	.incbin "data/residual/gUiFramePaletteB.bin"
	.global gUiFramePaletteC
gUiFramePaletteC:
	.incbin "data/residual/gUiFramePaletteC.bin"
	.global gUiFramePaletteD
gUiFramePaletteD:
	.incbin "data/residual/gUiFramePaletteD.bin"
