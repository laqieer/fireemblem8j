	.section .rodata.dat_EventScr_Ch2Tutorial21_ref, "a", %progbits
@ EventScr_Ch2Tutorial21: region-different data, JP 0x08a630d8 read from funcmap-aligned code literal (US 0x089f0fa4); incbin baserom.gba
	.global EventScr_Ch2Tutorial21
EventScr_Ch2Tutorial21:
	.incbin "baserom.gba", 0xA630D8, 0x48
