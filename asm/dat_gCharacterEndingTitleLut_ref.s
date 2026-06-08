	.section .rodata.dat_gCharacterEndingTitleLut_ref, "a", %progbits
@ gCharacterEndingTitleLut: region-different data, JP 0x08ac09e8 read from funcmap-aligned code literal (US 0x08a3d1b0); incbin baserom.gba
	.global gCharacterEndingTitleLut
gCharacterEndingTitleLut:
	.incbin "baserom.gba", 0xAC09E8, 0x110
