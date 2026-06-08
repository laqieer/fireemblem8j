	.section .rodata.dat_EventScr_Ruin_70_ref, "a", %progbits
@ EventScr_Ruin_70: region-different data, JP 0x08a721f4 read from funcmap-aligned code literal (US 0x08a0013c); incbin baserom.gba
	.global EventScr_Ruin_70
EventScr_Ruin_70:
	.incbin "baserom.gba", 0xA721F4, 0x64
