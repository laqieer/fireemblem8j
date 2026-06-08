	.section .rodata.dat_voicegroup080_ref, "a", %progbits
@ voicegroup080: region-different data, JP 0x082125a0 read from funcmap-aligned code literal (US 0x082228f0); incbin baserom.gba
	.global voicegroup080
voicegroup080:
	.incbin "baserom.gba", 0x2125A0, 0x240
