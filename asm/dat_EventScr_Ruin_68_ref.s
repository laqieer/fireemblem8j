	.section .rodata.dat_EventScr_Ruin_68_ref, "a", %progbits
@ EventScr_Ruin_68: region-different data, JP 0x08a72158 read from funcmap-aligned code literal (US 0x08a000a0); incbin baserom.gba
	.global EventScr_Ruin_68
EventScr_Ruin_68:
	.incbin "baserom.gba", 0xA72158, 0x90
