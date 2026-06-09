	.section .rodata.dat_EventScr_Prologue_Tutorial1_ref, "a", %progbits
@ EventScr_Prologue_Tutorial1: region-different data, JP 0x08a61460 read from funcmap-aligned code literal (US 0x089ef328); incbin baserom.gba
	.global EventScr_Prologue_Tutorial1
EventScr_Prologue_Tutorial1:
	.incbin "baserom.gba", 0xA61460, 0x60
