	.section .rodata.dat_EventScr_Ch15B_21_ref, "a", %progbits
@ EventScr_Ch15B_21: region-different data, JP 0x08a6ed74 read from funcmap-aligned code literal (US 0x089fccb8); incbin baserom.gba
	.global EventScr_Ch15B_21
EventScr_Ch15B_21:
	.incbin "baserom.gba", 0xA6ED74, 0x44
