	.section .rodata.dat_EventScr_Ch2Tutorial11_ref, "a", %progbits
@ EventScr_Ch2Tutorial11: region-different data, JP 0x08a62e00 read from funcmap-aligned code literal (US 0x089f0ccc); incbin baserom.gba
	.global EventScr_Ch2Tutorial11
EventScr_Ch2Tutorial11:
	.incbin "baserom.gba", 0xA62E00, 0x7C
