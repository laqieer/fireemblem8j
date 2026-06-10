	.section .rodata.dat_data_btl_bg_p2, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087b5a80 (US 0x0876554c, shift -0xFFFAFACC); incbin baserom.gba
	.global btl_bg_6_palette
btl_bg_6_palette:
	.incbin "data/residual/btl_bg_6_palette.bin"
	.global btl_bg_6_map
btl_bg_6_map:
	.incbin "data/residual/btl_bg_6_map.bin"
	.global btl_bg_7_tiles
btl_bg_7_tiles:
	.incbin "data/residual/btl_bg_7_tiles.bin"
	.global btl_bg_7_palette
btl_bg_7_palette:
	.incbin "data/residual/btl_bg_7_palette.bin"
	.global btl_bg_7_map
btl_bg_7_map:
	.incbin "data/residual/btl_bg_7_map.bin"
