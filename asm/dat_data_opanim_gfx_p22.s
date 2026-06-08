	.section .rodata.dat_data_opanim_gfx_p22, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b89af8 (US 0x08af0130, shift -0xFFF66638); incbin baserom.gba
	.global Pal_OpAnimFaceCaellach
Pal_OpAnimFaceCaellach:
	.incbin "baserom.gba", 0xB89AF8, 0x20
	.global Img_OpAnimFaceLyon
Img_OpAnimFaceLyon:
	.incbin "baserom.gba", 0xB89B18, 0x894
	.global Img_OpAnimFaceLyonShadow
Img_OpAnimFaceLyonShadow:
	.incbin "baserom.gba", 0xB8A3AC, 0x404
