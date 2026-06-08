	.section .rodata.dat_voicegroup085_ref, "a", %progbits
@ voicegroup085: region-different data, JP 0x0821329c read from funcmap-aligned code literal (US 0x082235ec); incbin baserom.gba
	.global voicegroup085
voicegroup085:
	.incbin "baserom.gba", 0x21329C, 0x774
