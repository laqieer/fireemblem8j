	.section .rodata.dat_EventScr_Ch2Tutorial4_ref, "a", %progbits
@ EventScr_Ch2Tutorial4: region-different data, JP 0x08a62a44 read from funcmap-aligned code literal (US 0x089f0910); incbin baserom.gba
	.global EventScr_Ch2Tutorial4
EventScr_Ch2Tutorial4:
	.incbin "baserom.gba", 0xA62A44, 0x5C
