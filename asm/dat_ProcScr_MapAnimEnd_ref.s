	.section .rodata.dat_ProcScr_MapAnimEnd_ref, "a", %progbits
@ ProcScr_MapAnimEnd: region-different data, JP 0x08a13c38; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_MapAnimEnd
ProcScr_MapAnimEnd:
	.incbin "baserom.gba", 0xA13C38, 0x98
