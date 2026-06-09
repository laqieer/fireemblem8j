	.section .rodata.dat_gDebugContinueMenuItems_ref, "a", %progbits
@ gDebugContinueMenuItems: region-different data, JP 0x085c4464; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gDebugContinueMenuItems
gDebugContinueMenuItems:
	.incbin "baserom.gba", 0x5C4464, 0xB4
