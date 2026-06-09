	.section .rodata.dat_ProcScr_SpellAssocBarrier_ref, "a", %progbits
@ ProcScr_SpellAssocBarrier: region-different data, JP 0x08a15814; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_SpellAssocBarrier
ProcScr_SpellAssocBarrier:
	.incbin "baserom.gba", 0xA15814, 0x88
