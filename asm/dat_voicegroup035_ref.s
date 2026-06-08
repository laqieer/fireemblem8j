	.section .rodata.dat_voicegroup035_ref, "a", %progbits
@ voicegroup035: region-different data, JP 0x08202ae4 read from funcmap-aligned code literal (US 0x08212e34); incbin baserom.gba
	.global voicegroup035
voicegroup035:
	.incbin "baserom.gba", 0x202AE4, 0x123
