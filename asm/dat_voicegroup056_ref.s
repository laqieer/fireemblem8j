	.section .rodata.dat_voicegroup056_ref, "a", %progbits
@ voicegroup056: region-different data, JP 0x082098c4 read from funcmap-aligned code literal (US 0x08219c14); incbin baserom.gba
	.global voicegroup056
voicegroup056:
	.incbin "baserom.gba", 0x2098C4, 0x600
