	.section .rodata.dat_data_bg_p11, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08954c50 (US 0x088f9a4c, shift -0xFFFA4DFC); incbin baserom.gba
	.global bg_Throne_Normal_palette
bg_Throne_Normal_palette:
	.incbin "baserom.gba", 0x954C50, 0x100
	.global bg_Throne_Flashback_palette
bg_Throne_Flashback_palette:
	.incbin "baserom.gba", 0x954D50, 0x100
