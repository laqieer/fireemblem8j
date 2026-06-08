	.section .rodata.dat_gMonsterItemTable_ref, "a", %progbits
@ gMonsterItemTable: region-different data, JP 0x0892661c read from funcmap-aligned code literal (US 0x088d21c8); incbin baserom.gba
	.global gMonsterItemTable
gMonsterItemTable:
	.incbin "baserom.gba", 0x92661C, 0xFF
