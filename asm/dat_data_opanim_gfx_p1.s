	.section .rodata.dat_data_opanim_gfx_p1, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b5b654 (US 0x08ac1c8c, shift -0xFFF66638); EXTRACTED to graphics/opanim/ except 8 FE-format (.feimg/.fetsa) symbol(s) still incbin baserom.gba (need FETSATOOL)
	.global Pal_OpAnimEphraimBlur
Pal_OpAnimEphraimBlur:
	.incbin "graphics/opanim/OpAnimEphraim.gbapal"
	.global Img_OpAnimEirika
Img_OpAnimEirika:
	.incbin "baserom.gba", 0xB5B7B4, 0xD38
	.global Tsa_OpAnimEirika
Tsa_OpAnimEirika:
	.incbin "baserom.gba", 0xB5C4EC, 0x190
	.global Img_OpAnimEirikaBlur1
Img_OpAnimEirikaBlur1:
	.incbin "baserom.gba", 0xB5C67C, 0xD78
	.global Tsa_OpAnimEirikaBlur1
Tsa_OpAnimEirikaBlur1:
	.incbin "baserom.gba", 0xB5D3F4, 0x19C
	.global Img_OpAnimEirikaBlur2
Img_OpAnimEirikaBlur2:
	.incbin "baserom.gba", 0xB5D590, 0xB98
	.global Tsa_OpAnimEirikaBlur2
Tsa_OpAnimEirikaBlur2:
	.incbin "baserom.gba", 0xB5E128, 0x1C8
	.global Img_OpAnimEirikaBlur3
Img_OpAnimEirikaBlur3:
	.incbin "baserom.gba", 0xB5E2F0, 0xAF8
	.global Tsa_OpAnimEirikaBlur3
Tsa_OpAnimEirikaBlur3:
	.incbin "baserom.gba", 0xB5EDE8, 0x1F4
	.global Img_OpAnimEirikaClose1
Img_OpAnimEirikaClose1:
	.incbin "graphics/opanim/OpAnimEirikaClose1.4bpp.lz"
	.global Img_OpAnimEirikaClose2
Img_OpAnimEirikaClose2:
	.incbin "graphics/opanim/OpAnimEirikaClose2.4bpp.lz"
	.global Tsa_OpAnimEirikaClose1
Tsa_OpAnimEirikaClose1:
	.incbin "graphics/opanim/OpAnimEirikaClose1.map.bin.lz"
	.global Tsa_OpAnimEirikaClose2
Tsa_OpAnimEirikaClose2:
	.incbin "graphics/opanim/OpAnimEirikaClose2.map.bin.lz"
	.global Pal_OpAnimEirikaBlur
Pal_OpAnimEirikaBlur:
	.incbin "graphics/opanim/OpAnimEirika.gbapal"
	.global Img_OpAnimJoshua
Img_OpAnimJoshua:
	.incbin "graphics/opanim/OpAnimJoshua.4bpp.lz"
	.global Img_OpAnimJoshua2
Img_OpAnimJoshua2:
	.incbin "graphics/opanim/OpAnimJoshua2.4bpp.lz"
	.global Tsa_OpAnimJoshua
Tsa_OpAnimJoshua:
	.incbin "graphics/opanim/OpAnimJoshua.map.bin.lz"
