	.section .rodata.dat_EventScr_Ch16A_9_ref, "a", %progbits
@ EventScr_Ch16A_9: region-different data, JP 0x08a69688 read from funcmap-aligned code literal (US 0x089f75a4); incbin baserom.gba
	.global EventScr_Ch16A_9
EventScr_Ch16A_9:
	.incbin "baserom.gba", 0xA69688, 0x4C
