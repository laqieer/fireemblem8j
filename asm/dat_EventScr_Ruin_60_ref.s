	.section .rodata.dat_EventScr_Ruin_60_ref, "a", %progbits
@ EventScr_Ruin_60: region-different data, JP 0x08a71f3c read from funcmap-aligned code literal (US 0x089ffe84); incbin baserom.gba
	.global EventScr_Ruin_60
EventScr_Ruin_60:
	.incbin "baserom.gba", 0xA71F3C, 0x84
