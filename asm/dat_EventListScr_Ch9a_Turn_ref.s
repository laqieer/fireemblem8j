	.section .rodata.dat_EventListScr_Ch9a_Turn_ref, "a", %progbits
@ EventListScr_Ch9a_Turn: region-different data, JP 0x08a5b158 read from funcmap-aligned code literal (US 0x089e9034); incbin baserom.gba
	.global EventListScr_Ch9a_Turn
EventListScr_Ch9a_Turn:
	.incbin "baserom.gba", 0xA5B158, 0x70
