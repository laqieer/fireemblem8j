	.section .rodata.dat_worldmap_gmapunit_p1125, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x0885fde2 (US 0x0880b88a, shift -0xFFFABAA8); incbin baserom.gba
	.global TerrainTable_MovCost_ArmorNormal
TerrainTable_MovCost_ArmorNormal:
	.incbin "baserom.gba", 0x85FDE2, 0x41
	.global TerrainTable_MovCost_FighterNormal
TerrainTable_MovCost_FighterNormal:
	.incbin "baserom.gba", 0x85FE23, 0x41
	.global TerrainTable_MovCost_BerserkerNormal
TerrainTable_MovCost_BerserkerNormal:
	.incbin "baserom.gba", 0x85FE64, 0x41
	.global TerrainTable_MovCost_BrigandNormal
TerrainTable_MovCost_BrigandNormal:
	.incbin "baserom.gba", 0x85FEA5, 0x41
	.global TerrainTable_MovCost_PirateNormal
TerrainTable_MovCost_PirateNormal:
	.incbin "baserom.gba", 0x85FEE6, 0x41
