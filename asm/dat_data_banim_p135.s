	.section .rodata.dat_data_banim_p135, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x086a66dc (US 0x08679b04, shift -0xFFFD3428); incbin baserom.gba
	.global Img_Banim_8
Img_Banim_8:
	.incbin "baserom.gba", 0x6A66DC, 0x62C
	.global Img_Banim_9
Img_Banim_9:
	.incbin "baserom.gba", 0x6A6D08, 0x6F8
	.global Img_Banim_10
Img_Banim_10:
	.incbin "baserom.gba", 0x6A7400, 0x620
	.global Img_Banim_11
Img_Banim_11:
	.incbin "baserom.gba", 0x6A7A20, 0x75C
	.global Pal_MapAnimRestore
Pal_MapAnimRestore:
	.incbin "baserom.gba", 0x6A817C, 0x20
