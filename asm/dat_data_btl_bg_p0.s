	.section .rodata.dat_data_btl_bg_p0, "a", %progbits
@ src/data/data_btl_bg.o: region-different content at JP 0x087ab004; extracted via gbagfx -mindist 2
	.global btl_bg_0_tiles
btl_bg_0_tiles:
	.incbin "graphics/btl_bg/btl_bg_0.feimg3.bin.lz"
	.global btl_bg_0_palette
btl_bg_0_palette:
	.incbin "graphics/btl_bg/btl_bg_0.gbapal.lz"
	.global btl_bg_0_map
btl_bg_0_map:
	.incbin "graphics/btl_bg/btl_bg_0.fetsa3.bin.lz"
	.global btl_bg_1_tiles
btl_bg_1_tiles:
	.incbin "graphics/btl_bg/btl_bg_1.feimg3.bin.lz"
