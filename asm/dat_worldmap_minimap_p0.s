	.section .rodata.dat_worldmap_minimap_p0, "a", %progbits
@ src/data/worldmap/worldmap_minimap.o: region-same content at JP 0x08b1e49c (US 0x08a98bf8, shift -0xFFF7A75C); incbin baserom.gba
	.global gWorldmapMinimap_1
gWorldmapMinimap_1:
	.incbin "baserom.gba", 0xB1E49C, 0x104
	.global gWorldmapMinimap_2
gWorldmapMinimap_2:
	.incbin "baserom.gba", 0xB1E5A0, 0x5C
