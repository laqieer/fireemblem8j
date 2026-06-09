	.section .rodata.dat_gChapterDataTable_ref, "a", %progbits
@ gChapterDataTable: region-different data, JP 0x08904e1c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gChapterDataTable
gChapterDataTable:
	.incbin "baserom.gba", 0x904E1C, 0x2DAC
