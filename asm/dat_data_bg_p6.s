	.section .rodata.dat_data_bg_p6, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08941264 (US 0x088e81ac, shift -0xFFFA6F48); incbin baserom.gba
	.global bg_Port_map
bg_Port_map:
	.incbin "baserom.gba", 0x941264, 0x4B4
	.global bg_Port_palette
bg_Port_palette:
	.incbin "baserom.gba", 0x941718, 0x100
