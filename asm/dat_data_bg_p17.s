	.section .rodata.dat_data_bg_p17, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08968710 (US 0x08909c64, shift -0xFFFA1554); incbin baserom.gba
	.global bg_Plain_1_map
bg_Plain_1_map:
	.incbin "data/residual/bg_Plain_1_map.bin"
	.global bg_Plain_1_palette
bg_Plain_1_palette:
	.incbin "data/residual/bg_Plain_1_palette.bin"
	.global bg_Plain_1_Sunset_palette
bg_Plain_1_Sunset_palette:
	.incbin "data/residual/bg_Plain_1_Sunset_palette.bin"
