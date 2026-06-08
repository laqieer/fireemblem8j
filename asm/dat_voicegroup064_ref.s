	.section .rodata.dat_voicegroup064_ref, "a", %progbits
@ voicegroup064: region-different data, JP 0x0820c540 read from funcmap-aligned code literal (US 0x0821c890); incbin baserom.gba
	.global voicegroup064
voicegroup064:
	.incbin "baserom.gba", 0x20C540, 0x4D4
