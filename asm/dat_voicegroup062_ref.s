	.section .rodata.dat_voicegroup062_ref, "a", %progbits
@ voicegroup062: region-different data, JP 0x0820b940 read from funcmap-aligned code literal (US 0x0821bc90); incbin baserom.gba
	.global voicegroup062
voicegroup062:
	.incbin "baserom.gba", 0x20B940, 0x600
