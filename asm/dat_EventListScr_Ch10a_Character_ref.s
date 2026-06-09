	.section .rodata.dat_EventListScr_Ch10a_Character_ref, "a", %progbits
@ EventListScr_Ch10a_Character: region-different data, JP 0x08a5b2e8 read from funcmap-aligned code literal (US 0x089e91c4); incbin baserom.gba
	.global EventListScr_Ch10a_Character
EventListScr_Ch10a_Character:
	.incbin "baserom.gba", 0xA5B2E8, 0x74
