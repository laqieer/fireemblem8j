	.section .rodata.dat_EventScr_Ch8_0_ref, "a", %progbits
@ EventScr_Ch8_0: region-different data, JP 0x08a65258 read from funcmap-aligned code literal (US 0x089f3124); incbin baserom.gba
	.global EventScr_Ch8_0
EventScr_Ch8_0:
	.incbin "baserom.gba", 0xA65258, 0x68
