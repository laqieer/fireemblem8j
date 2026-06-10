	.section .rodata.dat_data_btl_bg_p16, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087e1810 (US 0x0878d2b8, shift -0xFFFABAA8); incbin baserom.gba
	.global btl_bg_66_palette
btl_bg_66_palette:
	.incbin "data/residual/btl_bg_66_palette.bin"
	.global btl_bg_67_palette
btl_bg_67_palette:
	.incbin "data/residual/btl_bg_67_palette.bin"
	.global btl_bg_68_palette
btl_bg_68_palette:
	.incbin "data/residual/btl_bg_68_palette.bin"
