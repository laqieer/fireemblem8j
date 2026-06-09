	.section .rodata.dat_EventListScr_Ch9a_Location_ref, "a", %progbits
@ EventListScr_Ch9a_Location: region-different data, JP 0x08a5b1ec read from funcmap-aligned code literal (US 0x089e90c8); incbin baserom.gba
	.global EventListScr_Ch9a_Location
EventListScr_Ch9a_Location:
	.incbin "baserom.gba", 0xA5B1EC, 0x4C
