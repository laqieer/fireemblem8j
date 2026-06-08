	.section .rodata.dat_gMonsterItemWeightsTable_ref, "a", %progbits
@ gMonsterItemWeightsTable: region-different data, JP 0x0892671b read from funcmap-aligned code literal (US 0x088d22c7); incbin baserom.gba
	.global gMonsterItemWeightsTable
gMonsterItemWeightsTable:
	.incbin "baserom.gba", 0x92671B, 0x139
