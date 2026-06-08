	.section .rodata.dat_worldmap_gmapunit_p1579, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a92514 (US 0x08a167c8, shift -0xFFF842B4); incbin baserom.gba
	.global gGfx_PlayerInterfaceFontTiles
gGfx_PlayerInterfaceFontTiles:
	.incbin "baserom.gba", 0xA92514, 0x5A4
	.global gGfx_PlayerInterfaceNumbers
gGfx_PlayerInterfaceNumbers:
	.incbin "baserom.gba", 0xA92AB8, 0x80
