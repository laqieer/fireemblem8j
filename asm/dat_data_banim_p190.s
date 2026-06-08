	.section .rodata.dat_data_banim_p190, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x086e2604 (US 0x086b5a2c, shift -0xFFFD3428); incbin baserom.gba
	.global Pal_efxGorgonBGFinish
Pal_efxGorgonBGFinish:
	.incbin "baserom.gba", 0x6E2604, 0x20
	.global Img_efxCrimsonEyeBG
Img_efxCrimsonEyeBG:
	.incbin "baserom.gba", 0x6E2624, 0x460
