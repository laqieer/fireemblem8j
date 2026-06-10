	.section .rodata.dat_gMonsterItemWeightsTable_ref, "a", %progbits
@ gMonsterItemWeightsTable: region-different data, JP 0x0892671b; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gMonsterItemWeightsTable
gMonsterItemWeightsTable:
	.incbin "data/residual/gMonsterItemWeightsTable.bin"
