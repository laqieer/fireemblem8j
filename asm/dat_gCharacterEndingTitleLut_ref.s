	.section .rodata.dat_gCharacterEndingTitleLut_ref, "a", %progbits
@ gCharacterEndingTitleLut: region-different data, JP 0x08ac09e8; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gCharacterEndingTitleLut
gCharacterEndingTitleLut:
	.incbin "data/residual/gCharacterEndingTitleLut.bin"
