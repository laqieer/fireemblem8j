	.section .rodata.dat_PopupScr_WpnBroken_ref, "a", %progbits
@ PopupScr_WpnBroken: region-different data, JP 0x085ba1b4; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global PopupScr_WpnBroken
PopupScr_WpnBroken:
	.incbin "baserom.gba", 0x5BA1B4, 0x40
