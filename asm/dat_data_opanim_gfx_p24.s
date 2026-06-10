	.section .rodata.dat_data_opanim_gfx_p24, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b8b4b0 (US 0x08af1ae8, shift -0xFFF66638); EXTRACTED to graphics/opanim/ (committed PNG/.pal/.map.bin source)
	.global Img_OpAnimSplitLine
Img_OpAnimSplitLine:
	.incbin "graphics/opanim/split_line.4bpp.lz"
	.global Pal_OpAnimSplitLine
Pal_OpAnimSplitLine:
	.incbin "graphics/opanim/split_line.gbapal", 0x0, 0x20
	.global Img_opanim_unk1
Img_opanim_unk1:
	.incbin "graphics/opanim/opanim_08AF1B38.4bpp.lz"
	.global Pal_opanim_unk1
Pal_opanim_unk1:
	.incbin "graphics/opanim/opanim_08AF1B38.gbapal", 0x0, 0x20
