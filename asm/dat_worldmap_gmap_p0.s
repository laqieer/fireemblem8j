	.section .rodata.dat_worldmap_gmap_p0, "a", %progbits
@ src/data/worldmap/worldmap_gmap.o: region-same content at JP 0x08b085f8 (US 0x08a83364, shift -0xFFF7AD6C); incbin baserom.gba
	.global gWorldmapGmap_0
gWorldmapGmap_0:
	.incbin "data/residual/gWorldmapGmap_0.bin"
	.global gWorldmapGmap_1
gWorldmapGmap_1:
	.incbin "data/residual/gWorldmapGmap_1.bin"
	.global gWorldmapGmap_2
gWorldmapGmap_2:
	.incbin "data/residual/gWorldmapGmap_2.bin"
	.global gWorldmapGmap_3
gWorldmapGmap_3:
	.incbin "data/residual/gWorldmapGmap_3.bin"
	.global Img_GmapNodes
Img_GmapNodes:
	.incbin "graphics/misc_gfx2/Img_GmapNodes.bin.lz"
	.global Img_GmapCastleNodes
Img_GmapCastleNodes:
	.incbin "graphics/misc_gfx2/Img_GmapCastleNodes.bin.lz"
