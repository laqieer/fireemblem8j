	.section .rodata.dat_data_bg_p4, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089363f0 (US 0x088e13d4, shift -0xFFFAAFE4); incbin baserom.gba
	.global bg_Village_Sunset_palette
bg_Village_Sunset_palette:
	.incbin "baserom.gba", 0x9363F0, 0x100
