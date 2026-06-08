	.section .rodata.dat_const_data_chapter_maps_p4, "a", %progbits
@ src/data/const_data_chapter_maps.o: region-same content at JP 0x0819e32c (US 0x081ae970, shift -0x10644); incbin baserom.gba
	.global MapPalette3
MapPalette3:
	.incbin "baserom.gba", 0x19E32C, 0x140
	.global MapPalette2
MapPalette2:
	.incbin "baserom.gba", 0x19E46C, 0x140
	.global MapPalette1
MapPalette1:
	.incbin "baserom.gba", 0x19E5AC, 0x140
