	.section .rodata.dat_worldmap_gmapunit_p1621, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a9cb04 (US 0x08a1fbd8, shift -0xFFF830D4); incbin baserom.gba
	.global gGfx_MinimapTiles
gGfx_MinimapTiles:
	.incbin "baserom.gba", 0xA9CB04, 0x3D8
	.global gPal_MinimapTiles
gPal_MinimapTiles:
	.incbin "baserom.gba", 0xA9CEDC, 0x20
	.global gPal_Minimap_0
gPal_Minimap_0:
	.incbin "baserom.gba", 0xA9CEFC, 0x80
