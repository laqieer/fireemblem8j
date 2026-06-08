	.section .rodata.dat_TextGlyphs_Special_ref, "a", %progbits
@ TextGlyphs_Special: region-different data, JP 0x08593ecc read from funcmap-aligned code literal (US 0x08590b44); incbin baserom.gba
	.global TextGlyphs_Special
TextGlyphs_Special:
	.incbin "baserom.gba", 0x593ECC, 0xA8
