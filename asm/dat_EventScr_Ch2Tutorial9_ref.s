	.section .rodata.dat_EventScr_Ch2Tutorial9_ref, "a", %progbits
@ EventScr_Ch2Tutorial9: region-different data, JP 0x08a62bd4 read from funcmap-aligned code literal (US 0x089f0aa0); incbin baserom.gba
	.global EventScr_Ch2Tutorial9
EventScr_Ch2Tutorial9:
	.incbin "baserom.gba", 0xA62BD4, 0x60
