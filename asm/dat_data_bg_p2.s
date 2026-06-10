	.section .rodata.dat_data_bg_p2, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089323b0 (US 0x088dd8f4, shift -0xFFFAB544); incbin baserom.gba
	.global bg_Normal_Village_map
bg_Normal_Village_map:
	.incbin "data/residual/bg_Normal_Village_map.bin"
	.global bg_Normal_Village_palette
bg_Normal_Village_palette:
	.incbin "data/residual/bg_Normal_Village_palette.bin"
