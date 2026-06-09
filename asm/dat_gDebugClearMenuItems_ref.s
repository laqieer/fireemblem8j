	.section .rodata.dat_gDebugClearMenuItems_ref, "a", %progbits
@ gDebugClearMenuItems: region-different data, JP 0x085c4320; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gDebugClearMenuItems
gDebugClearMenuItems:
	.incbin "baserom.gba", 0x5C4320, 0xD8
