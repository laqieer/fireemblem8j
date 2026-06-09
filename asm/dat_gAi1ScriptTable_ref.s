	.section .rodata.dat_gAi1ScriptTable_ref, "a", %progbits
@ gAi1ScriptTable: region-different data, JP 0x085d308c read from funcmap-aligned code literal (US 0x085a9184); incbin baserom.gba
	.global gAi1ScriptTable
gAi1ScriptTable:
	.incbin "baserom.gba", 0x5D308C, 0x54
