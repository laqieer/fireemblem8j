	.section .rodata.dat_EventScr_Ruin_74_ref, "a", %progbits
@ EventScr_Ruin_74: region-different data, JP 0x08a72318 read from funcmap-aligned code literal (US 0x08a00260); incbin baserom.gba
	.global EventScr_Ruin_74
EventScr_Ruin_74:
	.incbin "baserom.gba", 0xA72318, 0x84
