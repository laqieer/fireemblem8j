	.section .rodata.dat_gMPlayTable_ref, "a", %progbits
@ gMPlayTable: region-different data, JP 0x082140b4 read from funcmap-aligned code literal (US 0x08224404); incbin baserom.gba
	.global gMPlayTable
gMPlayTable:
	.incbin "baserom.gba", 0x2140B4, 0x6C
