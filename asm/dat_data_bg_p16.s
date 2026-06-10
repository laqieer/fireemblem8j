	.section .rodata.dat_data_bg_p16, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08965f54 (US 0x0890792c, shift -0xFFFA19D8); incbin baserom.gba
	.global bg_Cell_map
bg_Cell_map:
	.incbin "data/residual/bg_Cell_map.bin"
	.global bg_Cell_palette
bg_Cell_palette:
	.incbin "data/residual/bg_Cell_palette.bin"
