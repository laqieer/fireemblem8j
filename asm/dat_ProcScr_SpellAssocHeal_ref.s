	.section .rodata.dat_ProcScr_SpellAssocHeal_ref, "a", %progbits
@ ProcScr_SpellAssocHeal: region-different data, JP 0x08a150dc; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_SpellAssocHeal
ProcScr_SpellAssocHeal:
	.incbin "baserom.gba", 0xA150DC, 0x68
