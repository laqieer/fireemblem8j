	.section .rodata.dat_voicegroup075_ref, "a", %progbits
@ voicegroup075: region-different data, JP 0x082103bc read from funcmap-aligned code literal (US 0x0822070c); incbin baserom.gba
	.global voicegroup075
voicegroup075:
	.incbin "baserom.gba", 0x2103BC, 0x15CC
