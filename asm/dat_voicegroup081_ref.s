	.section .rodata.dat_voicegroup081_ref, "a", %progbits
@ voicegroup081: region-different data, JP 0x082127e0 read from funcmap-aligned code literal (US 0x08222b30); incbin baserom.gba
	.global voicegroup081
voicegroup081:
	.incbin "baserom.gba", 0x2127E0, 0x240
