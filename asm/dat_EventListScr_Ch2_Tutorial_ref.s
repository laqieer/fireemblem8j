	.section .rodata.dat_EventListScr_Ch2_Tutorial_ref, "a", %progbits
@ EventListScr_Ch2_Tutorial: region-different data, JP 0x08a5a9dc read from funcmap-aligned code literal (US 0x089e88b8); incbin baserom.gba
	.global EventListScr_Ch2_Tutorial
EventListScr_Ch2_Tutorial:
	.incbin "baserom.gba", 0xA5A9DC, 0x7C
