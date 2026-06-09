	.section .rodata.dat_Ch5EventData_ref, "a", %progbits
@ Ch5EventData: region-different data, JP 0x08a5ad78 read from funcmap-aligned code literal (US 0x089e8c54); incbin baserom.gba
	.global Ch5EventData
Ch5EventData:
	.incbin "baserom.gba", 0xA5AD78, 0x50
