	.section .rodata.dat_data_opanim_gfx_p5, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b72370 (US 0x08ad89a8, shift -0xFFF66638); EXTRACTED to graphics/opanim/ (committed PNG/.pal/.map.bin source)
	.global Pal_OpAnimSaleh
Pal_OpAnimSaleh:
	.incbin "graphics/opanim/OpAnimSaleh.gbapal"
	.global Img_OpAnimTethys
Img_OpAnimTethys:
	.incbin "graphics/opanim/OpAnimTethys.4bpp.lz"
	.global Img_OpAnimTethys2
Img_OpAnimTethys2:
	.incbin "graphics/opanim/OpAnimTethys2.4bpp.lz"
	.global Tsa_OpAnimTethys
Tsa_OpAnimTethys:
	.incbin "graphics/opanim/OpAnimTethys.map.bin.lz"
