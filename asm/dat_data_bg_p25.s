	.section .rodata.dat_data_bg_p25, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089820c4 (US 0x0891ee88, shift -0xFFF9CDC4); incbin baserom.gba
	.global bg_Forest_palette
bg_Forest_palette:
	.incbin "baserom.gba", 0x9820C4, 0x100
