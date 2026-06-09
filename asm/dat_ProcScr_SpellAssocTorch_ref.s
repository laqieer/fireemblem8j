	.section .rodata.dat_ProcScr_SpellAssocTorch_ref, "a", %progbits
@ ProcScr_SpellAssocTorch: region-different data, JP 0x08a1527c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_SpellAssocTorch
ProcScr_SpellAssocTorch:
	.incbin "baserom.gba", 0xA1527C, 0x48
