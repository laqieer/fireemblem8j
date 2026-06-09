	.section .rodata.dat_gStealItemMenuItems_ref, "a", %progbits
@ gStealItemMenuItems: region-different data, JP 0x085c4758; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gStealItemMenuItems
gStealItemMenuItems:
	.incbin "baserom.gba", 0x5C4758, 0xD8
