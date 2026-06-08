	.section .rodata.dat_EventScr_Ch8_10_ref, "a", %progbits
@ EventScr_Ch8_10: region-different data, JP 0x08a653b4 read from funcmap-aligned code literal (US 0x089f3280); incbin baserom.gba
	.global EventScr_Ch8_10
EventScr_Ch8_10:
	.incbin "baserom.gba", 0xA653B4, 0x150
