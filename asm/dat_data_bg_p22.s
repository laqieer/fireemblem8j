	.section .rodata.dat_data_bg_p22, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08971c98 (US 0x08912614, shift -0xFFFA097C); incbin baserom.gba
	.global bg_Plain_2_Fog_palette
bg_Plain_2_Fog_palette:
	.incbin "data/residual/bg_Plain_2_Fog_palette.bin"
	.global bg_Plain_2_Sunset_palette
bg_Plain_2_Sunset_palette:
	.incbin "data/residual/bg_Plain_2_Sunset_palette.bin"
	.global bg_Plain_2_Night_palette
bg_Plain_2_Night_palette:
	.incbin "data/residual/bg_Plain_2_Night_palette.bin"
