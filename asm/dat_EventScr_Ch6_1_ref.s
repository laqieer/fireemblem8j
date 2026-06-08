	.section .rodata.dat_EventScr_Ch6_1_ref, "a", %progbits
@ EventScr_Ch6_1: region-different data, JP 0x08a64bcc read from funcmap-aligned code literal (US 0x089f2a98); incbin baserom.gba
	.global EventScr_Ch6_1
EventScr_Ch6_1:
	.incbin "baserom.gba", 0xA64BCC, 0x4C
