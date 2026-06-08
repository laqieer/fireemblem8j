	.section .rodata.dat_TextGlyphs_Talk_ref, "a", %progbits
@ TextGlyphs_Talk: region-different data, JP 0x08593f74 read from funcmap-aligned code literal (US 0x0858f6f4); incbin baserom.gba
	.global TextGlyphs_Talk
TextGlyphs_Talk:
	.incbin "baserom.gba", 0x593F74, 0x400
