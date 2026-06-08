	.section .rodata.dat_EventScr_Ch15B_15_ref, "a", %progbits
@ EventScr_Ch15B_15: region-different data, JP 0x08a6ebdc read from funcmap-aligned code literal (US 0x089fcb20); incbin baserom.gba
	.global EventScr_Ch15B_15
EventScr_Ch15B_15:
	.incbin "baserom.gba", 0xA6EBDC, 0x44
