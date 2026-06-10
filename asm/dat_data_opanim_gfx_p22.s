	.section .rodata.dat_data_opanim_gfx_p22, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b89af8 (US 0x08af0130, shift -0xFFF66638); EXTRACTED to graphics/opanim/ (committed PNG/.pal/.map.bin source)
	.global Pal_OpAnimFaceCaellach
Pal_OpAnimFaceCaellach:
	.incbin "graphics/opanim/OpAnimFaceCaellach.gbapal"
	.global Img_OpAnimFaceLyon
Img_OpAnimFaceLyon:
	.incbin "graphics/opanim/OpAnimFaceLyon.4bpp.lz"
	.global Img_OpAnimFaceLyonShadow
Img_OpAnimFaceLyonShadow:
	.incbin "graphics/opanim/OpAnimFaceLyonShadow.4bpp.lz"
