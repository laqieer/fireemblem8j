	.section .rodata.dat_EventListScr_Ch2_Location_ref, "a", %progbits
@ EventListScr_Ch2_Location: region-different data, JP 0x08a5a95c read from funcmap-aligned code literal (US 0x089e8838); incbin baserom.gba
	.global EventListScr_Ch2_Location
EventListScr_Ch2_Location:
	.incbin "baserom.gba", 0xA5A95C, 0x58
