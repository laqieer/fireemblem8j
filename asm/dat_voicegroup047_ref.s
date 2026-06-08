	.section .rodata.dat_voicegroup047_ref, "a", %progbits
@ voicegroup047: region-different data, JP 0x082062c4 read from funcmap-aligned code literal (US 0x08216614); incbin baserom.gba
	.global voicegroup047
voicegroup047:
	.incbin "baserom.gba", 0x2062C4, 0x600
