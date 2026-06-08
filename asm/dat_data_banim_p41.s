	.section .rodata.dat_data_banim_p41, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x0861b0d0 (US 0x085ee4f8, shift -0xFFFD3428); incbin baserom.gba
	.global Img_EfxMagfcastBG
Img_EfxMagfcastBG:
	.incbin "baserom.gba", 0x61B0D0, 0xD54
	.global Pal_EfxMagfcastBG
Pal_EfxMagfcastBG:
	.incbin "baserom.gba", 0x61BE24, 0x20
