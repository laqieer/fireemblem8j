	.section .rodata.dat_data_btl_bg_p3, "a", %progbits
@ src/data/data_btl_bg.o: region-same content at JP 0x087b8100 (US 0x08767bcc, shift -0xFFFAFACC); incbin baserom.gba
	.global btl_bg_8_palette
btl_bg_8_palette:
	.incbin "data/residual/btl_bg_8_palette.bin"
	.global btl_bg_8_map
btl_bg_8_map:
	.incbin "data/residual/btl_bg_8_map.bin"
