	.section .rodata.dat_EventScr_Ch2Tutorial22_ref, "a", %progbits
@ EventScr_Ch2Tutorial22: region-different data, JP 0x08a62c44 read from funcmap-aligned code literal (US 0x089f0b10); incbin baserom.gba
	.global EventScr_Ch2Tutorial22
EventScr_Ch2Tutorial22:
	.incbin "baserom.gba", 0xA62C44, 0x58
