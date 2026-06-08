	.section .rodata.dat_EventScr_Ruin_56_ref, "a", %progbits
@ EventScr_Ruin_56: region-different data, JP 0x08a71c00 read from funcmap-aligned code literal (US 0x089ffb48); incbin baserom.gba
	.global EventScr_Ruin_56
EventScr_Ruin_56:
	.incbin "baserom.gba", 0xA71C00, 0x60
