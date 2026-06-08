	.section .rodata.dat_data_opanim_gfx_p3, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b6be7c (US 0x08ad24b4, shift -0xFFF66638); incbin baserom.gba
	.global Pal_OpAnimSeth
Pal_OpAnimSeth:
	.incbin "baserom.gba", 0xB6BE7C, 0x160
	.global Img_OpAnimMyrrh
Img_OpAnimMyrrh:
	.incbin "baserom.gba", 0xB6BFDC, 0x1C28
	.global Img_OpAnimMyrrh2
Img_OpAnimMyrrh2:
	.incbin "baserom.gba", 0xB6DC04, 0xE58
	.global Tsa_OpAnimMyrrh
Tsa_OpAnimMyrrh:
	.incbin "baserom.gba", 0xB6EA5C, 0x3A8
