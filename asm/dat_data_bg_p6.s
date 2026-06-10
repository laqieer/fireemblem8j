	.section .rodata.dat_data_bg_p6, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08941264 (US 0x088e81ac, shift -0xFFFA6F48); incbin baserom.gba
	.global bg_Port_map
bg_Port_map:
	.incbin "data/residual/bg_Port_map.bin"
	.global bg_Port_palette
bg_Port_palette:
	.incbin "data/residual/bg_Port_palette.bin"
