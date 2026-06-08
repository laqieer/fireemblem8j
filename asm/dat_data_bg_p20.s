	.section .rodata.dat_data_bg_p20, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0896da8c (US 0x0890e7e8, shift -0xFFFA0D5C); incbin baserom.gba
	.global bg_Grass_Plains_map
bg_Grass_Plains_map:
	.incbin "baserom.gba", 0x96DA8C, 0x4B4
	.global bg_Grass_Plains_palette
bg_Grass_Plains_palette:
	.incbin "baserom.gba", 0x96DF40, 0x100
