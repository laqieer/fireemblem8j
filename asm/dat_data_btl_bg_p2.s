	.section .rodata.dat_data_btl_bg_p2, "a", %progbits
@ src/data/data_btl_bg.o: region-different content at JP 0x087b5a80; extracted via gbagfx -mindist 2
	.global btl_bg_6_palette
btl_bg_6_palette:
	.incbin "graphics/btl_bg/btl_bg_6.gbapal.lz"
	.global btl_bg_6_map
btl_bg_6_map:
	.incbin "graphics/btl_bg/btl_bg_6.fetsa3.bin.lz"
	.global btl_bg_7_tiles
btl_bg_7_tiles:
	.incbin "graphics/btl_bg/btl_bg_7.feimg3.bin.lz"
	.global btl_bg_7_palette
btl_bg_7_palette:
	.incbin "graphics/btl_bg/btl_bg_7.gbapal.lz"
	.global btl_bg_7_map
btl_bg_7_map:
	.incbin "graphics/btl_bg/btl_bg_7.fetsa3.bin.lz"
