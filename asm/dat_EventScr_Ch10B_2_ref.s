	.section .rodata.dat_EventScr_Ch10B_2_ref, "a", %progbits
@ EventScr_Ch10B_2: region-different data, JP 0x08a6ccb0 read from funcmap-aligned code literal (US 0x089fabd0); incbin baserom.gba
	.global EventScr_Ch10B_2
EventScr_Ch10B_2:
	.incbin "baserom.gba", 0xA6CCB0, 0x50
