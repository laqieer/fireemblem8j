	.section .rodata.dat_data_opanim_gfx_p23, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b8a7d0 (US 0x08af0e08, shift -0xFFF66638); incbin baserom.gba
	.global Img_OpAnimFaceVigarde
Img_OpAnimFaceVigarde:
	.incbin "baserom.gba", 0xB8A7D0, 0x8C4
	.global Img_OpAnimFaceVigardeShadow
Img_OpAnimFaceVigardeShadow:
	.incbin "baserom.gba", 0xB8B094, 0x3FC
