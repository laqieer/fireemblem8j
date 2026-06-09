	.section .rodata.dat_EventScr_Prologue_TutorialB_ref, "a", %progbits
@ EventScr_Prologue_TutorialB: region-different data, JP 0x08a61890 read from funcmap-aligned code literal (US 0x089ef758); incbin baserom.gba
	.global EventScr_Prologue_TutorialB
EventScr_Prologue_TutorialB:
	.incbin "baserom.gba", 0xA61890, 0x60
