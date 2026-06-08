	.section .rodata.dat_voicegroup082_ref, "a", %progbits
@ voicegroup082: region-different data, JP 0x08212a20 read from funcmap-aligned code literal (US 0x08222d70); incbin baserom.gba
	.global voicegroup082
voicegroup082:
	.incbin "baserom.gba", 0x212A20, 0x240
