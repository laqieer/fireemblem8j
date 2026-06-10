	.section .rodata.dat_data_banim_p228, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x08760304 (US 0x08731348, shift -0xFFFD1044); incbin baserom.gba
	.global Pal_Banim_8
Pal_Banim_8:
	.incbin "graphics/banim/_us/banim/assets/pal/00731348_Pal_08731348.gbapal"
	.global Img_GespenstBg4
Img_GespenstBg4:
	.incbin "graphics/banim/_us/banim/assets/img/007313C8_Img_GespenstBg4.4bpp.lz"
	.global Pal_GespenstBg4
Pal_GespenstBg4:
	.incbin "graphics/banim/_us/banim/assets/pal/00732228_Pal_GespenstBg4.gbapal"
	.global Tsa_GespenstBg4
Tsa_GespenstBg4:
	.incbin "graphics/banim/_us/banim/assets/tsa/00732368_Tsa_GespenstBg4.map.bin.lz"
