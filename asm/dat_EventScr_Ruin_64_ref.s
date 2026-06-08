	.section .rodata.dat_EventScr_Ruin_64_ref, "a", %progbits
@ EventScr_Ruin_64: region-different data, JP 0x08a72044 read from funcmap-aligned code literal (US 0x089fff8c); incbin baserom.gba
	.global EventScr_Ruin_64
EventScr_Ruin_64:
	.incbin "baserom.gba", 0xA72044, 0x9C
