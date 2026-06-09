	.section .rodata.dat_gYesNoSelectionMenuItems_ref, "a", %progbits
@ gYesNoSelectionMenuItems: region-different data, JP 0x085c4a28; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gYesNoSelectionMenuItems
gYesNoSelectionMenuItems:
	.incbin "baserom.gba", 0x5C4A28, 0x6C
