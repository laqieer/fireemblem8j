	.section .rodata.dat_data_bg_p34, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089adc34 (US 0x0893f688, shift -0xFFF91A54); incbin baserom.gba
	.global bg_Stone_Chamber_palette
bg_Stone_Chamber_palette:
	.incbin "data/residual/bg_Stone_Chamber_palette.bin"
	.global bg_Stone_Flashback_palette
bg_Stone_Flashback_palette:
	.incbin "data/residual/bg_Stone_Flashback_palette.bin"
