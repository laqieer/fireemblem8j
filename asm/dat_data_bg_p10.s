	.section .rodata.dat_data_bg_p10, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08950b0c (US 0x088f5fa8, shift -0xFFFA549C); incbin baserom.gba
	.global bg_Grado_Chamber_palette
bg_Grado_Chamber_palette:
	.incbin "data/residual/bg_Grado_Chamber_palette.bin"
	.global bg_Grado_Chamber_Flashback_palette
bg_Grado_Chamber_Flashback_palette:
	.incbin "data/residual/bg_Grado_Chamber_Flashback_palette.bin"
