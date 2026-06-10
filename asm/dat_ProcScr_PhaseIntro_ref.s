	.section .rodata.dat_ProcScr_PhaseIntro_ref, "a", %progbits
@ ProcScr_PhaseIntro: region-different data, JP 0x085c3400; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_PhaseIntro
ProcScr_PhaseIntro:
	.incbin "data/residual/ProcScr_PhaseIntro.bin"
