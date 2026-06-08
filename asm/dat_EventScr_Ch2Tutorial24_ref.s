	.section .rodata.dat_EventScr_Ch2Tutorial24_ref, "a", %progbits
@ EventScr_Ch2Tutorial24: region-different data, JP 0x08a62d14 read from funcmap-aligned code literal (US 0x089f0be0); incbin baserom.gba
	.global EventScr_Ch2Tutorial24
EventScr_Ch2Tutorial24:
	.incbin "baserom.gba", 0xA62D14, 0x60
