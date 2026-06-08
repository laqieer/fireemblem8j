	.section .rodata.dat_data_btl_bg_p2, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087b5a80 (US 0x0876554c, shift -0xFFFAFACC); incbin baserom.gba
	.global btl_bg_6_palette
btl_bg_6_palette:
	.incbin "baserom.gba", 0x7B5A80, 0x108
	.global btl_bg_6_map
btl_bg_6_map:
	.incbin "baserom.gba", 0x7B5B88, 0x274
	.global btl_bg_7_tiles
btl_bg_7_tiles:
	.incbin "baserom.gba", 0x7B5DFC, 0xE1C
	.global btl_bg_7_palette
btl_bg_7_palette:
	.incbin "baserom.gba", 0x7B6C18, 0xAC
	.global btl_bg_7_map
btl_bg_7_map:
	.incbin "baserom.gba", 0x7B6CC4, 0x18C
