	.section .rodata.dat_EventScr_Ch14A_8_ref, "a", %progbits
@ EventScr_Ch14A_8: region-different data, JP 0x08a68418 read from funcmap-aligned code literal (US 0x089f62f0); incbin baserom.gba
	.global EventScr_Ch14A_8
EventScr_Ch14A_8:
	.incbin "baserom.gba", 0xA68418, 0x54
