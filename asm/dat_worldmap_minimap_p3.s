	.section .rodata.dat_worldmap_minimap_p3, "a", %progbits
@ src/data/worldmap/worldmap_minimap.o: region-same content at JP 0x08b1e9b8 (US 0x08a99140, shift -0xFFF7A788); incbin baserom.gba
	.global Img_EventGmap
Img_EventGmap:
	.incbin "baserom.gba", 0xB1E9B8, 0x4E34
	.global Tsa_EventGmap
Tsa_EventGmap:
	.incbin "baserom.gba", 0xB237EC, 0x550
	.global Pal_EventGmap
Pal_EventGmap:
	.incbin "baserom.gba", 0xB23D3C, 0x80
	.global gImg_WorldmapMinimap_0
gImg_WorldmapMinimap_0:
	.incbin "baserom.gba", 0xB23DBC, 0x78
	.global gPal_WorldmapMinimap_0
gPal_WorldmapMinimap_0:
	.incbin "baserom.gba", 0xB23E34, 0x20
	.global gTsa_WorldmapMinimap_0
gTsa_WorldmapMinimap_0:
	.incbin "baserom.gba", 0xB23E54, 0xAC
