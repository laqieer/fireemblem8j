	.section .rodata.dat_EventScr_Prologue_Tutorial0_ref, "a", %progbits
@ EventScr_Prologue_Tutorial0: region-different data, JP 0x08a613e8 read from funcmap-aligned code literal (US 0x089ef2b0); incbin baserom.gba
	.global EventScr_Prologue_Tutorial0
EventScr_Prologue_Tutorial0:
	.incbin "baserom.gba", 0xA613E8, 0x78
