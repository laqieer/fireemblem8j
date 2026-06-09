	.section .rodata.dat_EventScr_SkirmishRetreat_ref, "a", %progbits
@ EventScr_SkirmishRetreat: region-different data, JP 0x085b9e3c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global EventScr_SkirmishRetreat
EventScr_SkirmishRetreat:
	.incbin "baserom.gba", 0x5B9E3C, 0x60
