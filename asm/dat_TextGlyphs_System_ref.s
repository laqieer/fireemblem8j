	.section .rodata.dat_TextGlyphs_System_ref, "a", %progbits
@ TextGlyphs_System: region-different data, JP 0x0857994c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global TextGlyphs_System
TextGlyphs_System:
	.incbin "baserom.gba", 0x57994C, 0x400
