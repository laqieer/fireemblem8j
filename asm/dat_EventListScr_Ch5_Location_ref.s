	.section .rodata.dat_EventListScr_Ch5_Location_ref, "a", %progbits
@ EventListScr_Ch5_Location: region-different data, JP 0x08a5acd0 read from funcmap-aligned code literal (US 0x089e8bac); incbin baserom.gba
	.global EventListScr_Ch5_Location
EventListScr_Ch5_Location:
	.incbin "baserom.gba", 0xA5ACD0, 0x7C
