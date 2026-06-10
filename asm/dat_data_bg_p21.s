	.section .rodata.dat_data_bg_p21, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089715e4 (US 0x08912060, shift -0xFFFA0A7C); incbin baserom.gba
	.global bg_Plain_2_map
bg_Plain_2_map:
	.incbin "data/residual/bg_Plain_2_map.bin"
	.global bg_Plain_2_palette
bg_Plain_2_palette:
	.incbin "data/residual/bg_Plain_2_palette.bin"
