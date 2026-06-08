	.section .rodata.dat_TextGlyphs_System_ref, "a", %progbits
@ TextGlyphs_System: region-different data, JP 0x0857994c read from funcmap-aligned code literal (US 0x0858c7ec); incbin baserom.gba
	.global TextGlyphs_System
TextGlyphs_System:
	.incbin "baserom.gba", 0x57994C, 0x400
