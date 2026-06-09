	.section .rodata.dat_EventListScr_Ch18b_Turn_ref, "a", %progbits
@ EventListScr_Ch18b_Turn: region-different data, JP 0x08a5d230 read from funcmap-aligned code literal (US 0x089eb018); incbin baserom.gba
	.global EventListScr_Ch18b_Turn
EventListScr_Ch18b_Turn:
	.incbin "baserom.gba", 0xA5D230, 0x40
