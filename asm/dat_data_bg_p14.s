	.section .rodata.dat_data_bg_p14, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0895fbdc (US 0x08901d54, shift -0xFFFA2178); incbin baserom.gba
	.global bg_Garden_palette
bg_Garden_palette:
	.incbin "data/residual/bg_Garden_palette.bin"
	.global bg_Garden_Flashback_palette
bg_Garden_Flashback_palette:
	.incbin "data/residual/bg_Garden_Flashback_palette.bin"
