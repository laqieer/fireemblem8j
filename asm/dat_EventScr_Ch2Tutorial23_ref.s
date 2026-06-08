	.section .rodata.dat_EventScr_Ch2Tutorial23_ref, "a", %progbits
@ EventScr_Ch2Tutorial23: region-different data, JP 0x08a62c9c read from funcmap-aligned code literal (US 0x089f0b68); incbin baserom.gba
	.global EventScr_Ch2Tutorial23
EventScr_Ch2Tutorial23:
	.incbin "baserom.gba", 0xA62C9C, 0x78
