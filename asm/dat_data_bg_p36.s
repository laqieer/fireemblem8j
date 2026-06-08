	.section .rodata.dat_data_bg_p36, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089b6300 (US 0x0894784c, shift -0xFFF9154C); incbin baserom.gba
	.global bg_White_Chamber_palette
bg_White_Chamber_palette:
	.incbin "baserom.gba", 0x9B6300, 0x100
