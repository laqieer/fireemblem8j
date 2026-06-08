	.section .rodata.dat_EventScr_Ruin_76_ref, "a", %progbits
@ EventScr_Ruin_76: region-different data, JP 0x08a723a8 read from funcmap-aligned code literal (US 0x08a002f0); incbin baserom.gba
	.global EventScr_Ruin_76
EventScr_Ruin_76:
	.incbin "baserom.gba", 0xA723A8, 0x60
