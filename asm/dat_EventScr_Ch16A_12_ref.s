	.section .rodata.dat_EventScr_Ch16A_12_ref, "a", %progbits
@ EventScr_Ch16A_12: region-different data, JP 0x08a68f3c read from funcmap-aligned code literal (US 0x089f6e50); incbin baserom.gba
	.global EventScr_Ch16A_12
EventScr_Ch16A_12:
	.incbin "baserom.gba", 0xA68F3C, 0x4CC
