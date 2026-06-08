	.section .rodata.dat_EventScr_Ch2Tutorial5_ref, "a", %progbits
@ EventScr_Ch2Tutorial5: region-different data, JP 0x08a62aa0 read from funcmap-aligned code literal (US 0x089f096c); incbin baserom.gba
	.global EventScr_Ch2Tutorial5
EventScr_Ch2Tutorial5:
	.incbin "baserom.gba", 0xA62AA0, 0x5C
