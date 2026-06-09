	.section .rodata.dat_gClassReelOrderedLut_ref, "a", %progbits
@ gClassReelOrderedLut: region-different data, JP 0x08ab0a44; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gClassReelOrderedLut
gClassReelOrderedLut:
	.incbin "baserom.gba", 0xAB0A44, 0x104
