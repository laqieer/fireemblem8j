	.section .rodata.dat_gAi2ScriptTable_ref, "a", %progbits
@ gAi2ScriptTable: region-different data, JP 0x085d3040 read from funcmap-aligned code literal (US 0x085a9138); incbin baserom.gba
	.global gAi2ScriptTable
gAi2ScriptTable:
	.incbin "data/residual/gAi2ScriptTable.bin"
