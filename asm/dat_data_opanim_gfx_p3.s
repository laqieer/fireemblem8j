	.section .rodata.dat_data_opanim_gfx_p3, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b6be7c (US 0x08ad24b4, shift -0xFFF66638); EXTRACTED to graphics/opanim/ (committed PNG/.pal/.map.bin source)
	.global Pal_OpAnimSeth
Pal_OpAnimSeth:
	.incbin "graphics/opanim/OpAnimSeth.gbapal"
	.global Img_OpAnimMyrrh
Img_OpAnimMyrrh:
	.incbin "graphics/opanim/OpAnimMyrrh.4bpp.lz"
	.global Img_OpAnimMyrrh2
Img_OpAnimMyrrh2:
	.incbin "graphics/opanim/OpAnimMyrrh2.4bpp.lz"
	.global Tsa_OpAnimMyrrh
Tsa_OpAnimMyrrh:
	.incbin "graphics/opanim/OpAnimMyrrh.map.bin.lz"
