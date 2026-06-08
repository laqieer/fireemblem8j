	.section .rodata.dat_worldmap_node_data_gf, "a", %progbits
@ src/worldmap_node_data.o: REGION-DIFFERENT asset, JP 0x081f5c6c..0x081f611c (US 0x08205fa0, shift -0x10334); boundary pinned by region-same neighbours; incbin baserom.gba
	.global gWMNodeIconData
gWMNodeIconData:
	.incbin "baserom.gba", 0x1F5C6C, 0x110
	.global gWMNodeData
gWMNodeData:
	.incbin "baserom.gba", 0x1F5D7C, 0x3A0
