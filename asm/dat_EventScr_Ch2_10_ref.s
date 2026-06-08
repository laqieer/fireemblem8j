	.section .rodata.dat_EventScr_Ch2_10_ref, "a", %progbits
@ EventScr_Ch2_10: region-different data, JP 0x08a632ec read from funcmap-aligned code literal (US 0x089f11b8); incbin baserom.gba
	.global EventScr_Ch2_10
EventScr_Ch2_10:
	.incbin "baserom.gba", 0xA632EC, 0x48
