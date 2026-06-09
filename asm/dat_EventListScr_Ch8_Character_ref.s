	.section .rodata.dat_EventListScr_Ch8_Character_ref, "a", %progbits
@ EventListScr_Ch8_Character: region-different data, JP 0x08a5b00c read from funcmap-aligned code literal (US 0x089e8ee8); incbin baserom.gba
	.global EventListScr_Ch8_Character
EventListScr_Ch8_Character:
	.incbin "baserom.gba", 0xA5B00C, 0x84
