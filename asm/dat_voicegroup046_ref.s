	.section .rodata.dat_voicegroup046_ref, "a", %progbits
@ voicegroup046: region-different data, JP 0x08205cc4 read from funcmap-aligned code literal (US 0x08216014); incbin baserom.gba
	.global voicegroup046
voicegroup046:
	.incbin "baserom.gba", 0x205CC4, 0x600
