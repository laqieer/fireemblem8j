	.section .rodata.dat_data_bg_p31, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0899e190 (US 0x08932720, shift -0xFFF94590); incbin baserom.gba
	.global bg_Fort_palette
bg_Fort_palette:
	.incbin "baserom.gba", 0x99E190, 0x100
