	.section .rodata.dat_data_btl_bg_p13, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087cf8b8 (US 0x0877b360, shift -0xFFFABAA8); incbin baserom.gba
	.global btl_bg_52_tiles
btl_bg_52_tiles:
	.incbin "baserom.gba", 0x7CF8B8, 0x12CC
	.global btl_bg_52_palette
btl_bg_52_palette:
	.incbin "baserom.gba", 0x7D0B84, 0xA8
	.global btl_bg_52_map
btl_bg_52_map:
	.incbin "baserom.gba", 0x7D0C2C, 0x2BC
	.global btl_bg_53_palette
btl_bg_53_palette:
	.incbin "baserom.gba", 0x7D0EE8, 0x100
	.global btl_bg_54_palette
btl_bg_54_palette:
	.incbin "baserom.gba", 0x7D0FE8, 0xFC
	.global btl_bg_59_tiles
btl_bg_59_tiles:
	.incbin "baserom.gba", 0x7D10E4, 0x2850
	.global btl_bg_59_palette
btl_bg_59_palette:
	.incbin "baserom.gba", 0x7D3934, 0x50
