	.section .rodata.dat_data_bg_p22, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08971c98 (US 0x08912614, shift -0xFFFA097C); incbin baserom.gba
	.global bg_Plain_2_Fog_palette
bg_Plain_2_Fog_palette:
	.incbin "baserom.gba", 0x971C98, 0x100
	.global bg_Plain_2_Sunset_palette
bg_Plain_2_Sunset_palette:
	.incbin "baserom.gba", 0x971D98, 0x100
	.global bg_Plain_2_Night_palette
bg_Plain_2_Night_palette:
	.incbin "baserom.gba", 0x971E98, 0x100
