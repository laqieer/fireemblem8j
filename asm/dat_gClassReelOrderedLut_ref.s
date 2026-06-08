	.section .rodata.dat_gClassReelOrderedLut_ref, "a", %progbits
@ gClassReelOrderedLut: region-different data, JP 0x08ab0a44 read from funcmap-aligned code literal (US 0x08a2fbe0); incbin baserom.gba
	.global gClassReelOrderedLut
gClassReelOrderedLut:
	.incbin "baserom.gba", 0xAB0A44, 0x104
