	.section .rodata.dat_data_bg_p8, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x089485c0 (US 0x088eee14, shift -0xFFFA6854); incbin baserom.gba
	.global bg_Fireplace_palette
bg_Fireplace_palette:
	.incbin "baserom.gba", 0x9485C0, 0x100
