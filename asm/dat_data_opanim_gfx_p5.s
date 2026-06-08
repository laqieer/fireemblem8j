	.section .rodata.dat_data_opanim_gfx_p5, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b72370 (US 0x08ad89a8, shift -0xFFF66638); incbin baserom.gba
	.global Pal_OpAnimSaleh
Pal_OpAnimSaleh:
	.incbin "baserom.gba", 0xB72370, 0x160
	.global Img_OpAnimTethys
Img_OpAnimTethys:
	.incbin "baserom.gba", 0xB724D0, 0x1814
	.global Img_OpAnimTethys2
Img_OpAnimTethys2:
	.incbin "baserom.gba", 0xB73CE4, 0x14E8
	.global Tsa_OpAnimTethys
Tsa_OpAnimTethys:
	.incbin "baserom.gba", 0xB751CC, 0x408
