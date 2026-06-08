	.section .rodata.dat_EventScr_Ch21A_8_ref, "a", %progbits
@ EventScr_Ch21A_8: region-different data, JP 0x08a6b224 read from funcmap-aligned code literal (US 0x089f9144); incbin baserom.gba
	.global EventScr_Ch21A_8
EventScr_Ch21A_8:
	.incbin "baserom.gba", 0xA6B224, 0x15C
