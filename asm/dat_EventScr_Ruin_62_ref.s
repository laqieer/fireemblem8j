	.section .rodata.dat_EventScr_Ruin_62_ref, "a", %progbits
@ EventScr_Ruin_62: region-different data, JP 0x08a71fcc read from funcmap-aligned code literal (US 0x089fff14); incbin baserom.gba
	.global EventScr_Ruin_62
EventScr_Ruin_62:
	.incbin "baserom.gba", 0xA71FCC, 0x6C
