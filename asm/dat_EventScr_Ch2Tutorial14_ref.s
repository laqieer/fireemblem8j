	.section .rodata.dat_EventScr_Ch2Tutorial14_ref, "a", %progbits
@ EventScr_Ch2Tutorial14: region-different data, JP 0x08a62eec read from funcmap-aligned code literal (US 0x089f0db8); incbin baserom.gba
	.global EventScr_Ch2Tutorial14
EventScr_Ch2Tutorial14:
	.incbin "baserom.gba", 0xA62EEC, 0x5C
