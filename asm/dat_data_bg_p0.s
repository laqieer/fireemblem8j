	.section .rodata.dat_data_bg_p0, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0892aa3c (US 0x088d61d8, shift -0xFFFAB79C); incbin baserom.gba
	.global bg_House_palette
bg_House_palette:
	.incbin "baserom.gba", 0x92AA3C, 0x100
