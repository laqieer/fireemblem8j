	.section .rodata.dat_ProcScr_SpellAssocRecover_ref, "a", %progbits
@ ProcScr_SpellAssocRecover: region-different data, JP 0x08a151ac; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_SpellAssocRecover
ProcScr_SpellAssocRecover:
	.incbin "baserom.gba", 0xA151AC, 0x68
