	.section .rodata.dat_data_bg_p28, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08994d84 (US 0x089296c4, shift -0xFFF94940); incbin baserom.gba
	.global bg_Interior_Black_palette
bg_Interior_Black_palette:
	.incbin "baserom.gba", 0x994D84, 0x100
