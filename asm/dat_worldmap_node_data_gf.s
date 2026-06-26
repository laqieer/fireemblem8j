	.section .rodata.dat_worldmap_node_data_gf, "a", %progbits
@ src/worldmap_node_data.o: gWMNodeData is a REGION-DIFFERENT asset, JP 0x081f5d7c..0x081f611c (US 0x082060b0, shift -0x10334); boundary pinned by region-same neighbours; incbin baserom.gba
@ Sibling table gWMNodeIconData (0x081f5c6c) is region-identical and now lives in real C (src/worldmap_node_data.c).
	.global gWMNodeData
gWMNodeData:
	.incbin "data/residual/gWMNodeData.bin"
