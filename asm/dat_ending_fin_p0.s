	.section .rodata.dat_ending_fin_p0, "a", %progbits
@ src/data/ending/ending_fin.o: region-same content at JP 0x08ac4c88 (US 0x08a405b4, shift -0xFFF7B92C); incbin baserom.gba
	.global Pal_FinScreen
Pal_FinScreen:
	.incbin "graphics/misc_gfx2/Pal_FinScreen.gbapal"
	.global Img_FinScreen
Img_FinScreen:
	.incbin "graphics/misc_gfx2/Img_FinScreen.bin.lz"
