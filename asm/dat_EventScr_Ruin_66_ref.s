	.section .rodata.dat_EventScr_Ruin_66_ref, "a", %progbits
@ EventScr_Ruin_66: region-different data, JP 0x08a720ec read from funcmap-aligned code literal (US 0x08a00034); incbin baserom.gba
	.global EventScr_Ruin_66
EventScr_Ruin_66:
	.incbin "baserom.gba", 0xA720EC, 0x60
