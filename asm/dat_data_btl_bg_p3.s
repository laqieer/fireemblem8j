	.section .rodata.dat_data_btl_bg_p3, "a", %progbits
@ src/data/data_btl_bg.o: region-different content at JP 0x087b8100; extracted via gbagfx -mindist 2
	.global btl_bg_8_palette
btl_bg_8_palette:
	.incbin "graphics/btl_bg/btl_bg_8.gbapal.lz"
	.global btl_bg_8_map
btl_bg_8_map:
	.incbin "graphics/btl_bg/btl_bg_8.fetsa3.bin.lz"
