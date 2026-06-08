	.section .rodata.dat_EventScr_Prologue_Tutorial4_ref, "a", %progbits
@ EventScr_Prologue_Tutorial4: region-different data, JP 0x08a615a4 read from funcmap-aligned code literal (US 0x089ef46c); incbin baserom.gba
	.global EventScr_Prologue_Tutorial4
EventScr_Prologue_Tutorial4:
	.incbin "baserom.gba", 0xA615A4, 0x80
