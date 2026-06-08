	.section .rodata.dat_voicegroup068_ref, "a", %progbits
@ voicegroup068: region-different data, JP 0x0820dae8 read from funcmap-aligned code literal (US 0x0821de38); incbin baserom.gba
	.global voicegroup068
voicegroup068:
	.incbin "baserom.gba", 0x20DAE8, 0x600
