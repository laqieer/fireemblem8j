	.section .rodata.dat_const_data_chapter_maps_p4, "a", %progbits
@ src/data/const_data_chapter_maps.o: region-same content at JP 0x0819e32c (US 0x081ae970, shift -0x10644); incbin baserom.gba
	.global MapPalette3
MapPalette3:
	.incbin "graphics/map/MapPalette3.gbapal"
	.global MapPalette2
MapPalette2:
	.incbin "graphics/map/MapPalette2.gbapal"
	.global MapPalette1
MapPalette1:
	.incbin "graphics/map/MapPalette1.gbapal"
