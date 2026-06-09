	.section .rodata.dat_gDebugChuudanMenuItems_ref, "a", %progbits
@ gDebugChuudanMenuItems: region-different data, JP 0x085c43f8; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gDebugChuudanMenuItems
gDebugChuudanMenuItems:
	.incbin "baserom.gba", 0x5C43F8, 0x48
