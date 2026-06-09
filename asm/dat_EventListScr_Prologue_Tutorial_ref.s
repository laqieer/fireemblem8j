	.section .rodata.dat_EventListScr_Prologue_Tutorial_ref, "a", %progbits
@ EventListScr_Prologue_Tutorial: region-different data, JP 0x08a5a720 read from funcmap-aligned code literal (US 0x089e85fc); incbin baserom.gba
	.global EventListScr_Prologue_Tutorial
EventListScr_Prologue_Tutorial:
	.incbin "baserom.gba", 0xA5A720, 0x40
