	.section .rodata.dat_gProcScr_StatusDecayDisplay_ref, "a", %progbits
@ gProcScr_StatusDecayDisplay: region-different data, JP 0x085c6960; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gProcScr_StatusDecayDisplay
gProcScr_StatusDecayDisplay:
	.incbin "baserom.gba", 0x5C6960, 0x58
