	.section .rodata.dat_voicegroup069_ref, "a", %progbits
@ voicegroup069: region-different data, JP 0x0820e0e8 read from funcmap-aligned code literal (US 0x0821e438); incbin baserom.gba
	.global voicegroup069
voicegroup069:
	.incbin "baserom.gba", 0x20E0E8, 0x600
