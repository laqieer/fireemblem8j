	.section .rodata.dat_data_opanim_gfx_p4, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b6eea4 (US 0x08ad54dc, shift -0xFFF66638); EXTRACTED to graphics/opanim/ (committed PNG/.pal/.map.bin source)
	.global Pal_OpAnimMyrrh
Pal_OpAnimMyrrh:
	.incbin "graphics/opanim/OpAnimMyrrh.gbapal"
	.global Img_OpAnimSaleh
Img_OpAnimSaleh:
	.incbin "graphics/opanim/OpAnimSaleh.4bpp.lz"
	.global Img_OpAnimSaleh2
Img_OpAnimSaleh2:
	.incbin "graphics/opanim/OpAnimSaleh2.4bpp.lz"
	.global Tsa_OpAnimSaleh
Tsa_OpAnimSaleh:
	.incbin "graphics/opanim/OpAnimSaleh.map.bin.lz"
