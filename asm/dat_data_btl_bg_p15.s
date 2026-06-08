	.section .rodata.dat_data_btl_bg_p15, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087e15d4 (US 0x0878d07c, shift -0xFFFABAA8); incbin baserom.gba
	.global btl_bg_63_palette
btl_bg_63_palette:
	.incbin "baserom.gba", 0x7E15D4, 0x144
