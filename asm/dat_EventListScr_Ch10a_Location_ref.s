	.section .rodata.dat_EventListScr_Ch10a_Location_ref, "a", %progbits
@ EventListScr_Ch10a_Location: region-different data, JP 0x08a5b35c read from funcmap-aligned code literal (US 0x089e9238); incbin baserom.gba
	.global EventListScr_Ch10a_Location
EventListScr_Ch10a_Location:
	.incbin "baserom.gba", 0xA5B35C, 0x4C
