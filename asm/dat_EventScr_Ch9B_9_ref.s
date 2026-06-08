	.section .rodata.dat_EventScr_Ch9B_9_ref, "a", %progbits
@ EventScr_Ch9B_9: region-different data, JP 0x08a6c88c read from funcmap-aligned code literal (US 0x089fa7ac); incbin baserom.gba
	.global EventScr_Ch9B_9
EventScr_Ch9B_9:
	.incbin "baserom.gba", 0xA6C88C, 0x40
