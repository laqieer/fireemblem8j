	.section .rodata.dat_EventScr_Prologue_TutorialA_ref, "a", %progbits
@ EventScr_Prologue_TutorialA: region-different data, JP 0x08a61818 read from funcmap-aligned code literal (US 0x089ef6e0); incbin baserom.gba
	.global EventScr_Prologue_TutorialA
EventScr_Prologue_TutorialA:
	.incbin "baserom.gba", 0xA61818, 0x78
