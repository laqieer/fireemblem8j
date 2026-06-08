	.section .rodata.dat_worldmap_skirmish, "a", %progbits
@ src/data/worldmap/worldmap_skirmish.o: region-same content at JP 0x08b26938 (US 0x08aa114c, shift -0x-857EC); incbin baserom.gba
	.global Img_WorldMapPlaceDot
Img_WorldMapPlaceDot:
	.incbin "baserom.gba", 0xB26938, 0x44
	.global Pal_WmPlaceDot_Highlight
Pal_WmPlaceDot_Highlight:
	.incbin "baserom.gba", 0xB2697C, 0x20
	.global Pal_WmPlaceDot_Standard
Pal_WmPlaceDot_Standard:
	.incbin "baserom.gba", 0xB2699C, 0x20
	.global gWorldmapSkirmish_0
gWorldmapSkirmish_0:
	.incbin "baserom.gba", 0xB269BC, 0xB0
