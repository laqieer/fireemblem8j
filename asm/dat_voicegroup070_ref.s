	.section .rodata.dat_voicegroup070_ref, "a", %progbits
@ voicegroup070: region-different data, JP 0x0820e6e8 read from funcmap-aligned code literal (US 0x0821ea38); incbin baserom.gba
	.global voicegroup070
voicegroup070:
	.incbin "baserom.gba", 0x20E6E8, 0x600
