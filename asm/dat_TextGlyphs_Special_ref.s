	.section .rodata.dat_TextGlyphs_Special_ref, "a", %progbits
@ TextGlyphs_Special: region-different data, JP 0x08593ecc; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global TextGlyphs_Special
TextGlyphs_Special:
	.incbin "baserom.gba", 0x593ECC, 0xA8
