	.section .rodata.dat_data_btl_bg_p16, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087e1810 (US 0x0878d2b8, shift -0xFFFABAA8); incbin baserom.gba
	.global btl_bg_66_palette
btl_bg_66_palette:
	.incbin "baserom.gba", 0x7E1810, 0x100
	.global btl_bg_67_palette
btl_bg_67_palette:
	.incbin "baserom.gba", 0x7E1910, 0xF8
	.global btl_bg_68_palette
btl_bg_68_palette:
	.incbin "baserom.gba", 0x7E1A08, 0x50
