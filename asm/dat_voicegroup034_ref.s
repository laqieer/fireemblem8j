	.section .rodata.dat_voicegroup034_ref, "a", %progbits
@ voicegroup034: region-different data, JP 0x08202520 read from funcmap-aligned code literal (US 0x08212870); incbin baserom.gba
	.global voicegroup034
voicegroup034:
	.incbin "baserom.gba", 0x202520, 0x5C4
