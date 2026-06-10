	.section .rodata.dat_worldmap_minimap_p3, "a", %progbits
@ src/data/worldmap/worldmap_minimap.o: region-same content at JP 0x08b1e9b8 (US 0x08a99140, shift -0xFFF7A788); incbin baserom.gba
	.global Img_EventGmap
Img_EventGmap:
	.incbin "graphics/misc_gfx2/Img_EventGmap.bin.lz"
	.global Tsa_EventGmap
Tsa_EventGmap:
	.incbin "graphics/misc_gfx2/Tsa_EventGmap.bin.lz"
	.global Pal_EventGmap
Pal_EventGmap:
	.incbin "graphics/misc_gfx2/Pal_EventGmap.gbapal"
	.global gImg_WorldmapMinimap_0
gImg_WorldmapMinimap_0:
	.incbin "graphics/misc_gfx2/gImg_WorldmapMinimap_0.bin.lz"
	.global gPal_WorldmapMinimap_0
gPal_WorldmapMinimap_0:
	.incbin "graphics/misc_gfx2/gPal_WorldmapMinimap_0.gbapal"
	.global gTsa_WorldmapMinimap_0
gTsa_WorldmapMinimap_0:
	.incbin "data/residual/gTsa_WorldmapMinimap_0.bin"
