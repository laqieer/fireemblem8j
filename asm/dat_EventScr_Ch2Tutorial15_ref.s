	.section .rodata.dat_EventScr_Ch2Tutorial15_ref, "a", %progbits
@ EventScr_Ch2Tutorial15: region-different data, JP 0x08a62f48 read from funcmap-aligned code literal (US 0x089f0e14); incbin baserom.gba
	.global EventScr_Ch2Tutorial15
EventScr_Ch2Tutorial15:
	.incbin "baserom.gba", 0xA62F48, 0x5C
