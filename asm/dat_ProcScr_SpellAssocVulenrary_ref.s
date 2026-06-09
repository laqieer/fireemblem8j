	.section .rodata.dat_ProcScr_SpellAssocVulenrary_ref, "a", %progbits
@ ProcScr_SpellAssocVulenrary: region-different data, JP 0x08a15084; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_SpellAssocVulenrary
ProcScr_SpellAssocVulenrary:
	.incbin "baserom.gba", 0xA15084, 0x58
