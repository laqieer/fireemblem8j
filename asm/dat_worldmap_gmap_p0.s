	.section .rodata.dat_worldmap_gmap_p0, "a", %progbits
@ src/data/worldmap/worldmap_gmap.o: region-same content at JP 0x08b085f8 (US 0x08a83364, shift -0xFFF7AD6C); incbin baserom.gba
	.global gWorldmapGmap_0
gWorldmapGmap_0:
	.incbin "baserom.gba", 0xB085F8, 0x12C00
	.global gWorldmapGmap_1
gWorldmapGmap_1:
	.incbin "baserom.gba", 0xB1B1F8, 0x80
	.global gWorldmapGmap_2
gWorldmapGmap_2:
	.incbin "baserom.gba", 0xB1B278, 0x80
	.global gWorldmapGmap_3
gWorldmapGmap_3:
	.incbin "baserom.gba", 0xB1B2F8, 0x2A4
	.global Img_GmapNodes
Img_GmapNodes:
	.incbin "graphics/misc_gfx2/Img_GmapNodes.bin.lz"
	.global Img_GmapCastleNodes
Img_GmapCastleNodes:
	.incbin "graphics/misc_gfx2/Img_GmapCastleNodes.bin.lz"
