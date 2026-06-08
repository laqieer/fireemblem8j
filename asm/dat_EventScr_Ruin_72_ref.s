	.section .rodata.dat_EventScr_Ruin_72_ref, "a", %progbits
@ EventScr_Ruin_72: region-different data, JP 0x08a72264 read from funcmap-aligned code literal (US 0x08a001ac); incbin baserom.gba
	.global EventScr_Ruin_72
EventScr_Ruin_72:
	.incbin "baserom.gba", 0xA72264, 0xA8
