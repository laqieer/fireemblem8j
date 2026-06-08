	.section .rodata.dat_voicegroup032_ref, "a", %progbits
@ voicegroup032: region-different data, JP 0x08201cbc read from funcmap-aligned code literal (US 0x0821200c); incbin baserom.gba
	.global voicegroup032
voicegroup032:
	.incbin "baserom.gba", 0x201CBC, 0x558
