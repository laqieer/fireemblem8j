	.section .rodata.dat_gUnitActionMenuItems_ref, "a", %progbits
@ gUnitActionMenuItems: region-different data, JP 0x085c4f14; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gUnitActionMenuItems
gUnitActionMenuItems:
	.incbin "baserom.gba", 0x5C4F14, 0x438
