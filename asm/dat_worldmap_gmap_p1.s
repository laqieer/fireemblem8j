	.section .rodata.dat_worldmap_gmap_p1, "a", %progbits
@ src/data/worldmap/worldmap_gmap.o: region-same content at JP 0x08b1ccf4 (US 0x08a97a60, shift -0xFFF7AD6C); incbin baserom.gba
	.global gPal_GMapPI_ShopIcons
gPal_GMapPI_ShopIcons:
	.incbin "graphics/misc_gfx2/gPal_GMapPI_ShopIcons.gbapal"
	.global gGfx_GMapPI_ShopIcons
gGfx_GMapPI_ShopIcons:
	.incbin "graphics/misc_gfx2/gGfx_GMapPI_ShopIcons.bin.lz"
	.global gPal_WorldmapGmap_0
gPal_WorldmapGmap_0:
	.incbin "graphics/misc_gfx2/gPal_WorldmapGmap_0.gbapal"
