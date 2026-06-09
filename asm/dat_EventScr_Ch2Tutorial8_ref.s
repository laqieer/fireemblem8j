	.section .rodata.dat_EventScr_Ch2Tutorial8_ref, "a", %progbits
@ EventScr_Ch2Tutorial8: region-different data, JP 0x08a62b5c read from funcmap-aligned code literal (US 0x089f0a28); incbin baserom.gba
	.global EventScr_Ch2Tutorial8
EventScr_Ch2Tutorial8:
	.incbin "baserom.gba", 0xA62B5C, 0x78
