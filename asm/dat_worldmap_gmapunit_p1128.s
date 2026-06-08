	.section .rodata.dat_worldmap_gmapunit_p1128, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x088609d1 (US 0x0880c479, shift -0xFFFABAA8); incbin baserom.gba
	.global TerrainTable_Avo_Common
TerrainTable_Avo_Common:
	.incbin "baserom.gba", 0x8609D1, 0x41
	.global TerrainTable_Def_Common
TerrainTable_Def_Common:
	.incbin "baserom.gba", 0x860A12, 0x41
