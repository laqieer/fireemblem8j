	.section .rodata.dat_data_bg_p33, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089a8714 (US 0x0893c930, shift -0xFFF9421C); incbin baserom.gba
	.global bg_Burning_Castle_palette
bg_Burning_Castle_palette:
	.incbin "baserom.gba", 0x9A8714, 0x100
