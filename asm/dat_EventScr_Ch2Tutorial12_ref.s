	.section .rodata.dat_EventScr_Ch2Tutorial12_ref, "a", %progbits
@ EventScr_Ch2Tutorial12: region-different data, JP 0x08a62e7c read from funcmap-aligned code literal (US 0x089f0d48); incbin baserom.gba
	.global EventScr_Ch2Tutorial12
EventScr_Ch2Tutorial12:
	.incbin "baserom.gba", 0xA62E7C, 0x60
