	.section .rodata.dat_gMonsterItemsByClassIndex_ref, "a", %progbits
@ gMonsterItemsByClassIndex: region-different data, JP 0x08926854 read from funcmap-aligned code literal (US 0x088d2440); incbin baserom.gba
	.global gMonsterItemsByClassIndex
gMonsterItemsByClassIndex:
	.incbin "baserom.gba", 0x926854, 0x2C0
