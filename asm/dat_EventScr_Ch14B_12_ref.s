	.section .rodata.dat_EventScr_Ch14B_12_ref, "a", %progbits
@ EventScr_Ch14B_12: region-different data, JP 0x08a6e7dc read from funcmap-aligned code literal (US 0x089fc6fc); incbin baserom.gba
	.global EventScr_Ch14B_12
EventScr_Ch14B_12:
	.incbin "baserom.gba", 0xA6E7DC, 0x44
