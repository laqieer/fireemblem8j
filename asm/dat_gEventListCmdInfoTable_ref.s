	.section .rodata.dat_gEventListCmdInfoTable_ref, "a", %progbits
@ gEventListCmdInfoTable: region-different data, JP 0x08a5a618 read from funcmap-aligned code literal (US 0x089e84f4); incbin baserom.gba
	.global gEventListCmdInfoTable
gEventListCmdInfoTable:
	.incbin "baserom.gba", 0xA5A618, 0x88
