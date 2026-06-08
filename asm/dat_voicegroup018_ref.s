	.section .rodata.dat_voicegroup018_ref, "a", %progbits
@ voicegroup018: region-different data, JP 0x081fd720 read from funcmap-aligned code literal (US 0x0820da70); incbin baserom.gba
	.global voicegroup018
voicegroup018:
	.incbin "baserom.gba", 0x1FD720, 0x600
