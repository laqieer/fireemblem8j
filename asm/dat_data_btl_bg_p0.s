	.section .rodata.dat_data_btl_bg_p0, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087ab004 (US 0x0875aad0, shift -0xFFFAFACC); incbin baserom.gba
	.global btl_bg_0_tiles
btl_bg_0_tiles:
	.incbin "baserom.gba", 0x7AB004, 0x24E4
	.global btl_bg_0_palette
btl_bg_0_palette:
	.incbin "baserom.gba", 0x7AD4E8, 0xD0
	.global btl_bg_0_map
btl_bg_0_map:
	.incbin "baserom.gba", 0x7AD5B8, 0x344
	.global btl_bg_1_tiles
btl_bg_1_tiles:
	.incbin "baserom.gba", 0x7AD8FC, 0x1168
