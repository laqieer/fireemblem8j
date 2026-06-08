	.section .rodata.dat_gChapterDataAssetTable_ref, "a", %progbits
@ gChapterDataAssetTable: region-different data, JP 0x08907bc8 read from funcmap-aligned code literal (US 0x088b363c); incbin baserom.gba
	.global gChapterDataAssetTable
gChapterDataAssetTable:
	.incbin "baserom.gba", 0x907BC8, 0x3B0
