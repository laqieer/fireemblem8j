/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_30_ref, "a", %progbits
	.global gFontgrp_30
gFontgrp_30:
	.4byte SjisGlyphs_0857DCB4 + 0x168
	.4byte 0x00000683
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C00
	.4byte 0x00003B00
	.4byte 0x00003B00
	.4byte 0x00003B00
	.4byte 0x00003B00
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x000003B0
	.4byte 0x000003B0
	.4byte 0x000000EC
	.4byte 0x0000003B
	.4byte 0x0000000F
	.4byte 0x00000000
