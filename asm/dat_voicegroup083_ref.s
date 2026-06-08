	.section .rodata.dat_voicegroup083_ref, "a", %progbits
@ voicegroup083: region-different data, JP 0x08212c60 read from funcmap-aligned code literal (US 0x08222fb0); incbin baserom.gba
	.global voicegroup083
voicegroup083:
	.incbin "baserom.gba", 0x212C60, 0x240
