	.section .rodata.dat_EventScr_Prologue_EndingScene_ref, "a", %progbits
@ EventScr_Prologue_EndingScene: region-different data, JP 0x08a6129c read from funcmap-aligned code literal (US 0x089ef164); incbin baserom.gba
	.global EventScr_Prologue_EndingScene
EventScr_Prologue_EndingScene:
	.incbin "baserom.gba", 0xA6129C, 0x58
