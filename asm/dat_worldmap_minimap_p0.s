	.section .rodata.dat_worldmap_minimap_p0, "a", %progbits
@ src/data/worldmap/worldmap_minimap.o: region-same content at JP 0x08b1e49c (US 0x08a98bf8, shift -0xFFF7A75C); incbin baserom.gba
	.global gWorldmapMinimap_1
gWorldmapMinimap_1:
	.incbin "data/residual/gWorldmapMinimap_1.bin"
	.global gWorldmapMinimap_2
gWorldmapMinimap_2:
	.incbin "data/residual/gWorldmapMinimap_2.bin"
