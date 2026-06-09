	.section .rodata.dat_EventListScr_Ch16b_Location_ref, "a", %progbits
@ EventListScr_Ch16b_Location: region-different data, JP 0x08a5d080 read from funcmap-aligned code literal (US 0x089ead78); incbin baserom.gba
	.global EventListScr_Ch16b_Location
EventListScr_Ch16b_Location:
	.incbin "baserom.gba", 0xA5D080, 0x64
