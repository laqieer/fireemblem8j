	.section .rodata.dat_EventListScr_Ch14b_Location_ref, "a", %progbits
@ EventListScr_Ch14b_Location: region-different data, JP 0x08a5cd24 read from funcmap-aligned code literal (US 0x089ea91c); incbin baserom.gba
	.global EventListScr_Ch14b_Location
EventListScr_Ch14b_Location:
	.incbin "baserom.gba", 0xA5CD24, 0x178
