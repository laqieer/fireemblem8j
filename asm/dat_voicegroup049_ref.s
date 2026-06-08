	.section .rodata.dat_voicegroup049_ref, "a", %progbits
@ voicegroup049: region-different data, JP 0x08206ec4 read from funcmap-aligned code literal (US 0x08217214); incbin baserom.gba
	.global voicegroup049
voicegroup049:
	.incbin "baserom.gba", 0x206EC4, 0x600
