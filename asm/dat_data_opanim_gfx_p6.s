	.section .rodata.dat_data_opanim_gfx_p6, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b756e0 (US 0x08adbd18, shift -0xFFF66638); incbin baserom.gba
	.global Pal_OpAnimTethys
Pal_OpAnimTethys:
	.incbin "baserom.gba", 0xB756E0, 0x160
	.global Pal_OpanimGfx_0
Pal_OpanimGfx_0:
	.incbin "baserom.gba", 0xB75840, 0x20
