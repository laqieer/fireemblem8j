	.section .rodata.dat_data_banim_p208, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x0872c1c4 (US 0x086ff5ec, shift -0xFFFD3428); incbin baserom.gba
	.global Img_NaglfarSprites_B
Img_NaglfarSprites_B:
	.incbin "baserom.gba", 0x72C1C4, 0x750
	.global Pal_NaglfarSprites_B
Pal_NaglfarSprites_B:
	.incbin "baserom.gba", 0x72C914, 0x20
