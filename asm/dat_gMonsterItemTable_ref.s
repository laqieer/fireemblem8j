	.section .rodata.dat_gMonsterItemTable_ref, "a", %progbits
@ gMonsterItemTable: region-different data, JP 0x0892661c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gMonsterItemTable
gMonsterItemTable:
	.incbin "baserom.gba", 0x92661C, 0xFF
