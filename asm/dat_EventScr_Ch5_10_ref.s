	.section .rodata.dat_EventScr_Ch5_10_ref, "a", %progbits
@ EventScr_Ch5_10: region-different data, JP 0x08a64494 read from funcmap-aligned code literal (US 0x089f2360); incbin baserom.gba
	.global EventScr_Ch5_10
EventScr_Ch5_10:
	.incbin "baserom.gba", 0xA64494, 0x54
