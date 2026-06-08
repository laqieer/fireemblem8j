	.section .rodata.dat_EventScr_Prologue_GiveRapier_ref, "a", %progbits
@ EventScr_Prologue_GiveRapier: region-different data, JP 0x08a61198 read from funcmap-aligned code literal (US 0x089ef060); incbin baserom.gba
	.global EventScr_Prologue_GiveRapier
EventScr_Prologue_GiveRapier:
	.incbin "baserom.gba", 0xA61198, 0x44
