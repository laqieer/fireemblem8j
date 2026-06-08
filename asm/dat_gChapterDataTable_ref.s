	.section .rodata.dat_gChapterDataTable_ref, "a", %progbits
@ gChapterDataTable: region-different data, JP 0x08904e1c read from funcmap-aligned code literal (US 0x088b0890); incbin baserom.gba
	.global gChapterDataTable
gChapterDataTable:
	.incbin "baserom.gba", 0x904E1C, 0x2DAC
