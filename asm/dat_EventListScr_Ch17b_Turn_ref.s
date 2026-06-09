	.section .rodata.dat_EventListScr_Ch17b_Turn_ref, "a", %progbits
@ EventListScr_Ch17b_Turn: region-different data, JP 0x08a5d13c read from funcmap-aligned code literal (US 0x089eae7c); incbin baserom.gba
	.global EventListScr_Ch17b_Turn
EventListScr_Ch17b_Turn:
	.incbin "baserom.gba", 0xA5D13C, 0xAC
