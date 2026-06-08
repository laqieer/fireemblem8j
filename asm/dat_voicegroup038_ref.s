	.section .rodata.dat_voicegroup038_ref, "a", %progbits
@ voicegroup038: region-different data, JP 0x08203234 read from funcmap-aligned code literal (US 0x08213584); incbin baserom.gba
	.global voicegroup038
voicegroup038:
	.incbin "baserom.gba", 0x203234, 0x600
