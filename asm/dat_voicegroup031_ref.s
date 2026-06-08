	.section .rodata.dat_voicegroup031_ref, "a", %progbits
@ voicegroup031: region-different data, JP 0x0820189c read from funcmap-aligned code literal (US 0x08211bec); incbin baserom.gba
	.global voicegroup031
voicegroup031:
	.incbin "baserom.gba", 0x20189C, 0x420
