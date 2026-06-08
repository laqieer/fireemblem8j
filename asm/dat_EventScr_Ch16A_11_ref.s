	.section .rodata.dat_EventScr_Ch16A_11_ref, "a", %progbits
@ EventScr_Ch16A_11: region-different data, JP 0x08a68b78 read from funcmap-aligned code literal (US 0x089f6a8c); incbin baserom.gba
	.global EventScr_Ch16A_11
EventScr_Ch16A_11:
	.incbin "baserom.gba", 0xA68B78, 0x3B4
