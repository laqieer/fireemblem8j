	.section .rodata.dat_data_banim_p228, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x08760304 (US 0x08731348, shift -0xFFFD1044); incbin baserom.gba
	.global Pal_Banim_8
Pal_Banim_8:
	.incbin "baserom.gba", 0x760304, 0x80
	.global Img_GespenstBg4
Img_GespenstBg4:
	.incbin "baserom.gba", 0x760384, 0xE60
	.global Pal_GespenstBg4
Pal_GespenstBg4:
	.incbin "baserom.gba", 0x7611E4, 0x140
	.global Tsa_GespenstBg4
Tsa_GespenstBg4:
	.incbin "baserom.gba", 0x761324, 0x45C
