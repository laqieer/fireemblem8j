	.section .rodata.dat_PopupScr_GotItem_ref, "a", %progbits
@ PopupScr_GotItem: region-different data, JP 0x085ba014; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global PopupScr_GotItem
PopupScr_GotItem:
	.incbin "baserom.gba", 0x5BA014, 0x40
