	.section .rodata.dat_data_bg_p30, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08998e80 (US 0x0892d5e4, shift -0xFFF94764); incbin baserom.gba
	.global bg_Fort_Sunset_map
bg_Fort_Sunset_map:
	.incbin "baserom.gba", 0x998E80, 0x4B4
	.global bg_Fort_Sunset_palette
bg_Fort_Sunset_palette:
	.incbin "baserom.gba", 0x999334, 0x100
