	.section .rodata.dat_TextGlyphs_Talk_ref, "a", %progbits
@ TextGlyphs_Talk: region-different data, JP 0x08593f74; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global TextGlyphs_Talk
TextGlyphs_Talk:
	.incbin "baserom.gba", 0x593F74, 0x400
