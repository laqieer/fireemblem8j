	.section .rodata.dat_const_data_chapter_maps_p9, "a", %progbits
@ src/data/const_data_chapter_maps.o: region-same content at JP 0x081a6930 (US 0x081b6f78, shift -0x10648); incbin baserom.gba
	.global Ch5XMap
Ch5XMap:
	.incbin "baserom.gba", 0x1A6930, 0x1E4
	.global Ch4Map
Ch4Map:
	.incbin "baserom.gba", 0x1A6B14, 0x178
	.global Ch3Map
Ch3Map:
	.incbin "baserom.gba", 0x1A6C8C, 0x168
	.global Ch2Map
Ch2Map:
	.incbin "baserom.gba", 0x1A6DF4, 0x194
	.global Ch1Map
Ch1Map:
	.incbin "baserom.gba", 0x1A6F88, 0x124
	.global PrologueMap
PrologueMap:
	.incbin "baserom.gba", 0x1A70AC, 0x134
