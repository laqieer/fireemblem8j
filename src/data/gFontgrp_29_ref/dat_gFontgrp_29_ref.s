/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_29_ref, "a", %progbits
	.global gFontgrp_29
gFontgrp_29:
	.4byte SjisGlyphs_0857DCB4 + 0x120
	.4byte 0x00000783
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000003F0
	.4byte 0x00000EAC
	.4byte 0x00000FFC
	.4byte 0x00003AAB
	.4byte 0x00003BFC
	.4byte 0x00000EC0
	.4byte 0x00000EB0
	.4byte 0x00003BAC
	.4byte 0x0000EFBB
	.4byte 0x000033BC
	.4byte 0x000003B0
	.4byte 0x000000C0
	.4byte 0x00000000
