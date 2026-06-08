	.section .rodata.dat_gTacticianTextConf_ref, "a", %progbits
@ gTacticianTextConf: region-different data, JP 0x080dd41c read from funcmap-aligned code literal (US 0x080d8740); incbin baserom.gba
	.global gTacticianTextConf
gTacticianTextConf:
	.incbin "baserom.gba", 0xDD41C, 0x1440
