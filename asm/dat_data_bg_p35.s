	.section .rodata.dat_data_bg_p35, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089b1928 (US 0x08942fec, shift -0xFFF916C4); incbin baserom.gba
	.global bg_Renais_Chamber_palette
bg_Renais_Chamber_palette:
	.incbin "baserom.gba", 0x9B1928, 0x100
