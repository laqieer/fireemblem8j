	.section .rodata.dat_data_bg_p23, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08977d10 (US 0x08914cb8, shift -0xFFF9CFA8); incbin baserom.gba
	.global bg_Stream_map
bg_Stream_map:
	.incbin "baserom.gba", 0x977D10, 0x4B4
	.global bg_Stream_palette
bg_Stream_palette:
	.incbin "baserom.gba", 0x9781C4, 0x100
