	.section .rodata.dat_EventScr_Prologue_TutMessageTurn2_ref, "a", %progbits
@ EventScr_Prologue_TutMessageTurn2: region-different data, JP 0x08a61510 read from funcmap-aligned code literal (US 0x089ef3d8); incbin baserom.gba
	.global EventScr_Prologue_TutMessageTurn2
EventScr_Prologue_TutMessageTurn2:
	.incbin "baserom.gba", 0xA61510, 0x94
