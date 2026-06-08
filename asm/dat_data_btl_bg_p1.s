	.section .rodata.dat_data_btl_bg_p1, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087aeb08 (US 0x0875e5d4, shift -0xFFFAFACC); incbin baserom.gba
	.global btl_bg_1_map
btl_bg_1_map:
	.incbin "baserom.gba", 0x7AEB08, 0x32C
	.global btl_bg_2_tiles
btl_bg_2_tiles:
	.incbin "baserom.gba", 0x7AEE34, 0xDF8
	.global btl_bg_2_palette
btl_bg_2_palette:
	.incbin "baserom.gba", 0x7AFC2C, 0xEC
	.global btl_bg_2_map
btl_bg_2_map:
	.incbin "baserom.gba", 0x7AFD18, 0x1B8
	.global btl_bg_3_tiles
btl_bg_3_tiles:
	.incbin "baserom.gba", 0x7AFED0, 0x16E8
	.global btl_bg_3_palette
btl_bg_3_palette:
	.incbin "baserom.gba", 0x7B15B8, 0x134
	.global btl_bg_3_map
btl_bg_3_map:
	.incbin "baserom.gba", 0x7B16EC, 0x2B0
	.global btl_bg_4_tiles
btl_bg_4_tiles:
	.incbin "baserom.gba", 0x7B199C, 0x10E8
	.global btl_bg_4_palette
btl_bg_4_palette:
	.incbin "baserom.gba", 0x7B2A84, 0xE8
	.global btl_bg_4_map
btl_bg_4_map:
	.incbin "baserom.gba", 0x7B2B6C, 0x23C
	.global btl_bg_5_tiles
btl_bg_5_tiles:
	.incbin "baserom.gba", 0x7B2DA8, 0x1034
	.global btl_bg_5_palette
btl_bg_5_palette:
	.incbin "baserom.gba", 0x7B3DDC, 0x104
	.global btl_bg_5_map
btl_bg_5_map:
	.incbin "baserom.gba", 0x7B3EE0, 0x1C8
