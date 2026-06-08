	.section .rodata.dat_data_btl_bg_p14, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087d3d2c (US 0x0877f7d4, shift -0xFFFABAA8); incbin baserom.gba
	.global btl_bg_55_tiles
btl_bg_55_tiles:
	.incbin "baserom.gba", 0x7D3D2C, 0x25C0
	.global btl_bg_55_palette
btl_bg_55_palette:
	.incbin "baserom.gba", 0x7D62EC, 0x110
	.global btl_bg_55_map
btl_bg_55_map:
	.incbin "baserom.gba", 0x7D63FC, 0x380
	.global btl_bg_56_tiles
btl_bg_56_tiles:
	.incbin "baserom.gba", 0x7D677C, 0x2628
	.global btl_bg_56_palette
btl_bg_56_palette:
	.incbin "baserom.gba", 0x7D8DA4, 0xC0
	.global btl_bg_56_map
btl_bg_56_map:
	.incbin "baserom.gba", 0x7D8E64, 0x30C
	.global btl_bg_57_tiles
btl_bg_57_tiles:
	.incbin "baserom.gba", 0x7D9170, 0x2640
	.global btl_bg_57_palette
btl_bg_57_palette:
	.incbin "baserom.gba", 0x7DB7B0, 0x108
	.global btl_bg_57_map
btl_bg_57_map:
	.incbin "baserom.gba", 0x7DB8B8, 0x328
	.global btl_bg_58_tiles
btl_bg_58_tiles:
	.incbin "baserom.gba", 0x7DBBE0, 0x26A8
	.global btl_bg_58_palette
btl_bg_58_palette:
	.incbin "baserom.gba", 0x7DE288, 0x10C
	.global btl_bg_58_map
btl_bg_58_map:
	.incbin "baserom.gba", 0x7DE394, 0x318
	.global btl_bg_60_tiles
btl_bg_60_tiles:
	.incbin "baserom.gba", 0x7DE6AC, 0x290C
	.global btl_bg_60_palette
btl_bg_60_palette:
	.incbin "baserom.gba", 0x7E0FB8, 0xC8
	.global btl_bg_60_map
btl_bg_60_map:
	.incbin "baserom.gba", 0x7E1080, 0x324
