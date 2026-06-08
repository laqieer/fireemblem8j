	.section .rodata.dat_EventScr_Ch11B_6_ref, "a", %progbits
@ EventScr_Ch11B_6: region-different data, JP 0x08a6d4dc read from funcmap-aligned code literal (US 0x089fb3fc); incbin baserom.gba
	.global EventScr_Ch11B_6
EventScr_Ch11B_6:
	.incbin "baserom.gba", 0xA6D4DC, 0x48
