	.section .rodata.dat_ProcScr_SpellAssocWarp_ref, "a", %progbits
@ ProcScr_SpellAssocWarp: region-different data, JP 0x08a1589c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_SpellAssocWarp
ProcScr_SpellAssocWarp:
	.incbin "baserom.gba", 0xA1589C, 0xE8
