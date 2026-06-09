	.section .rodata.dat_gProcScr_PhaseIntroText_ref, "a", %progbits
@ gProcScr_PhaseIntroText: region-different data, JP 0x085c3378; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gProcScr_PhaseIntroText
gProcScr_PhaseIntroText:
	.incbin "baserom.gba", 0x5C3378, 0x48
