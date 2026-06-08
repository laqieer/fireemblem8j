	.section .rodata.dat_EventScr_Ch2Tutorial18_ref, "a", %progbits
@ EventScr_Ch2Tutorial18: region-different data, JP 0x08a63008 read from funcmap-aligned code literal (US 0x089f0ed4); incbin baserom.gba
	.global EventScr_Ch2Tutorial18
EventScr_Ch2Tutorial18:
	.incbin "baserom.gba", 0xA63008, 0x80
