	.section .rodata.dat_EventScr_Prologue_TutEirikaAttack_ref, "a", %progbits
@ EventScr_Prologue_TutEirikaAttack: region-different data, JP 0x08a617a8 read from funcmap-aligned code literal (US 0x089ef670); incbin baserom.gba
	.global EventScr_Prologue_TutEirikaAttack
EventScr_Prologue_TutEirikaAttack:
	.incbin "baserom.gba", 0xA617A8, 0x70
