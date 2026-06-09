	.section .rodata.dat_ProcScr_SpellAssocRestore_ref, "a", %progbits
@ ProcScr_SpellAssocRestore: region-different data, JP 0x08a155cc; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_SpellAssocRestore
ProcScr_SpellAssocRestore:
	.incbin "baserom.gba", 0xA155CC, 0x88
