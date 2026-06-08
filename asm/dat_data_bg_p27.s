	.section .rodata.dat_data_bg_p27, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0898a360 (US 0x0892659c, shift -0xFFF9C23C); incbin baserom.gba
	.global bg_Castle_Back_palette
bg_Castle_Back_palette:
	.incbin "baserom.gba", 0x98A360, 0x100
