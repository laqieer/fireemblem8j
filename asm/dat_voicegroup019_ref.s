	.section .rodata.dat_voicegroup019_ref, "a", %progbits
@ voicegroup019: region-different data, JP 0x081fdd20 read from funcmap-aligned code literal (US 0x0820e070); incbin baserom.gba
	.global voicegroup019
voicegroup019:
	.incbin "baserom.gba", 0x1FDD20, 0x600
