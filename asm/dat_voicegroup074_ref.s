	.section .rodata.dat_voicegroup074_ref, "a", %progbits
@ voicegroup074: region-different data, JP 0x0820fee8 read from funcmap-aligned code literal (US 0x08220238); incbin baserom.gba
	.global voicegroup074
voicegroup074:
	.incbin "baserom.gba", 0x20FEE8, 0x4D4
