	.section .rodata.dat_EventScr_Prologue_RenaisThroneCutscene_ref, "a", %progbits
@ EventScr_Prologue_RenaisThroneCutscene: region-different data, JP 0x08a60df4 read from funcmap-aligned code literal (US 0x089eecbc); incbin baserom.gba
	.global EventScr_Prologue_RenaisThroneCutscene
EventScr_Prologue_RenaisThroneCutscene:
	.incbin "baserom.gba", 0xA60DF4, 0x3A4
