	.section .rodata.dat_voicegroup033_ref, "a", %progbits
@ voicegroup033: region-different data, JP 0x08202214 read from funcmap-aligned code literal (US 0x08212564); incbin baserom.gba
	.global voicegroup033
voicegroup033:
	.incbin "baserom.gba", 0x202214, 0x30C
