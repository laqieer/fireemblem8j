	.section .rodata.dat_gChapterDataAssetTable_ref, "a", %progbits
@ gChapterDataAssetTable: region-different data, JP 0x08907bc8; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gChapterDataAssetTable
gChapterDataAssetTable:
	.incbin "data/residual/gChapterDataAssetTable.bin"
