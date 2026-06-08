	.section .rodata.dat_voicegroup065_ref, "a", %progbits
@ voicegroup065: region-different data, JP 0x0820ca14 read from funcmap-aligned code literal (US 0x0821cd64); incbin baserom.gba
	.global voicegroup065
voicegroup065:
	.incbin "baserom.gba", 0x20CA14, 0x4D4
