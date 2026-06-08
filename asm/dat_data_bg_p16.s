	.section .rodata.dat_data_bg_p16, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x08965f54 (US 0x0890792c, shift -0xFFFA19D8); incbin baserom.gba
	.global bg_Cell_map
bg_Cell_map:
	.incbin "baserom.gba", 0x965F54, 0x4B4
	.global bg_Cell_palette
bg_Cell_palette:
	.incbin "baserom.gba", 0x966408, 0x100
