/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_223_ref, "a", %progbits
	.global gFontgrp_223
gFontgrp_223:
	.4byte data_085985AC + 0x48
	.4byte 0x00000B83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000BB2C0
	.4byte 0x000BB2C0
	.4byte 0x000BBFFF
	.4byte 0x0000BAAB
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000B000
	.4byte 0x0000B800
	.4byte 0x00002C00
	.4byte 0x00002E00
	.4byte 0x00000B80
	.4byte 0x000002E0
	.4byte 0x000000B0
