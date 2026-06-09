	.section .rodata.dat_Ch19EphraimEventData_ref, "a", %progbits
@ Ch19EphraimEventData: region-different data, JP 0x08a5d464 read from funcmap-aligned code literal (US 0x089eb21c); incbin baserom.gba
	.global Ch19EphraimEventData
Ch19EphraimEventData:
	.incbin "baserom.gba", 0xA5D464, 0x50
