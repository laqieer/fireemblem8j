	.section .rodata.dat_voicegroup084_ref, "a", %progbits
@ voicegroup084: region-different data, JP 0x08212ea0 read from funcmap-aligned code literal (US 0x082231f0); incbin baserom.gba
	.global voicegroup084
voicegroup084:
	.incbin "baserom.gba", 0x212EA0, 0x3FC
