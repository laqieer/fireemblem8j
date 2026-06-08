	.section .rodata.dat_data_bg_p26, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089863dc (US 0x08922e28, shift -0xFFF9CA4C); incbin baserom.gba
	.global bg_Town_palette
bg_Town_palette:
	.incbin "baserom.gba", 0x9863DC, 0x100
