	.section .rodata.dat_voicegroup092_ref, "a", %progbits
@ voicegroup092: region-different data, JP 0x08213b84 read from funcmap-aligned code literal (US 0x08223ed4); incbin baserom.gba
	.global voicegroup092
voicegroup092:
	.incbin "baserom.gba", 0x213B84, 0x480
