	.section .rodata.dat_data_bg_p13, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0895b51c (US 0x088fd8d8, shift -0xFFFA23BC); incbin baserom.gba
	.global bg_Gate_palette
bg_Gate_palette:
	.incbin "data/residual/bg_Gate_palette.bin"
