	.section .rodata.dat_data_bg_p32, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089a3110 (US 0x089375e8, shift -0xFFF944D8); incbin baserom.gba
	.global bg_Passage_palette
bg_Passage_palette:
	.incbin "baserom.gba", 0x9A3110, 0x100
