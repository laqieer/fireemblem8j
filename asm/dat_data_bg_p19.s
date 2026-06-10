	.section .rodata.dat_data_bg_p19, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0896b7a0 (US 0x0890c7d4, shift -0xFFFA1034); incbin baserom.gba
	.global bg_Grass_Plains_2_map
bg_Grass_Plains_2_map:
	.incbin "data/residual/bg_Grass_Plains_2_map.bin"
	.global bg_Grass_Plains_2_palette
bg_Grass_Plains_2_palette:
	.incbin "data/residual/bg_Grass_Plains_2_palette.bin"
