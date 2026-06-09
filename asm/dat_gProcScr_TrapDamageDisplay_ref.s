	.section .rodata.dat_gProcScr_TrapDamageDisplay_ref, "a", %progbits
@ gProcScr_TrapDamageDisplay: region-different data, JP 0x085c69b8; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gProcScr_TrapDamageDisplay
gProcScr_TrapDamageDisplay:
	.incbin "baserom.gba", 0x5C69B8, 0x68
