	.section .rodata.dat_data_opanim_gfx_p4, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b6eea4 (US 0x08ad54dc, shift -0xFFF66638); incbin baserom.gba
	.global Pal_OpAnimMyrrh
Pal_OpAnimMyrrh:
	.incbin "baserom.gba", 0xB6EEA4, 0x160
	.global Img_OpAnimSaleh
Img_OpAnimSaleh:
	.incbin "baserom.gba", 0xB6F004, 0x1CC0
	.global Img_OpAnimSaleh2
Img_OpAnimSaleh2:
	.incbin "baserom.gba", 0xB70CC4, 0x121C
	.global Tsa_OpAnimSaleh
Tsa_OpAnimSaleh:
	.incbin "baserom.gba", 0xB71EE0, 0x3BC
