	.section .rodata.dat_EventScr_Prologue_BeginningScene_ref, "a", %progbits
@ EventScr_Prologue_BeginningScene: region-different data, JP 0x08a60d20 read from funcmap-aligned code literal (US 0x089eebe8); incbin baserom.gba
	.global EventScr_Prologue_BeginningScene
EventScr_Prologue_BeginningScene:
	.incbin "baserom.gba", 0xA60D20, 0xD4
