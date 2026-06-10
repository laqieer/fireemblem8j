	.section .rodata.dat_data_btl_bg_p0, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087ab004 (US 0x0875aad0, shift -0xFFFAFACC); incbin baserom.gba
	.global btl_bg_0_tiles
btl_bg_0_tiles:
	.incbin "data/residual/btl_bg_0_tiles.bin"
	.global btl_bg_0_palette
btl_bg_0_palette:
	.incbin "data/residual/btl_bg_0_palette.bin"
	.global btl_bg_0_map
btl_bg_0_map:
	.incbin "data/residual/btl_bg_0_map.bin"
	.global btl_bg_1_tiles
btl_bg_1_tiles:
	.incbin "data/residual/btl_bg_1_tiles.bin"
