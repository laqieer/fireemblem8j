	.section .rodata.dat_data_opanim_gfx_p24, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b8b4b0 (US 0x08af1ae8, shift -0xFFF66638); incbin baserom.gba
	.global Img_OpAnimSplitLine
Img_OpAnimSplitLine:
	.incbin "baserom.gba", 0xB8B4B0, 0x30
	.global Pal_OpAnimSplitLine
Pal_OpAnimSplitLine:
	.incbin "baserom.gba", 0xB8B4E0, 0x20
	.global Img_opanim_unk1
Img_opanim_unk1:
	.incbin "baserom.gba", 0xB8B500, 0x478
	.global Pal_opanim_unk1
Pal_opanim_unk1:
	.incbin "baserom.gba", 0xB8B978, 0x20
