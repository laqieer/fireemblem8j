	.section .rodata.dat_gMonsterItemsByClassIndex_ref, "a", %progbits
@ gMonsterItemsByClassIndex: region-different data, JP 0x08926854; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gMonsterItemsByClassIndex
gMonsterItemsByClassIndex:
	.incbin "baserom.gba", 0x926854, 0x2C0
