	.section .rodata.dat_data_btl_bg_p3, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087b8100 (US 0x08767bcc, shift -0xFFFAFACC); incbin baserom.gba
	.global btl_bg_8_palette
btl_bg_8_palette:
	.incbin "baserom.gba", 0x7B8100, 0xC0
	.global btl_bg_8_map
btl_bg_8_map:
	.incbin "baserom.gba", 0x7B81C0, 0x1F8
