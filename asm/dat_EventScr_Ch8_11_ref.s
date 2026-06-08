	.section .rodata.dat_EventScr_Ch8_11_ref, "a", %progbits
@ EventScr_Ch8_11: region-different data, JP 0x08a65d68 read from funcmap-aligned code literal (US 0x089f3c34); incbin baserom.gba
	.global EventScr_Ch8_11
EventScr_Ch8_11:
	.incbin "baserom.gba", 0xA65D68, 0x184
