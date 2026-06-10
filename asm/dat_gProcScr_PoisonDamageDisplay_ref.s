	.section .rodata.dat_gProcScr_PoisonDamageDisplay_ref, "a", %progbits
@ gProcScr_PoisonDamageDisplay: region-different data, JP 0x085c6890; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gProcScr_PoisonDamageDisplay
gProcScr_PoisonDamageDisplay:
	.incbin "data/residual/gProcScr_PoisonDamageDisplay.bin"
