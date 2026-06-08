	.section .rodata.dat_voicegroup059_ref, "a", %progbits
@ voicegroup059: region-different data, JP 0x0820a86c read from funcmap-aligned code literal (US 0x0821abbc); incbin baserom.gba
	.global voicegroup059
voicegroup059:
	.incbin "baserom.gba", 0x20A86C, 0x4D4
