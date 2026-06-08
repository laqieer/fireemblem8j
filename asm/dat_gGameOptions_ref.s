	.section .rodata.dat_gGameOptions_ref, "a", %progbits
@ gGameOptions: region-different data, JP 0x08aaf700 read from funcmap-aligned code literal (US 0x08a2e99c); incbin baserom.gba
	.global gGameOptions
gGameOptions:
	.incbin "baserom.gba", 0xAAF700, 0x2EC
