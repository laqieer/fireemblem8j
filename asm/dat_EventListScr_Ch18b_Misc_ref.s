	.section .rodata.dat_EventListScr_Ch18b_Misc_ref, "a", %progbits
@ EventListScr_Ch18b_Misc: region-different data, JP 0x08a5d314 read from funcmap-aligned code literal (US 0x089eb060); incbin baserom.gba
	.global EventListScr_Ch18b_Misc
EventListScr_Ch18b_Misc:
	.incbin "baserom.gba", 0xA5D314, 0x4C
