/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_339_ref, "a", %progbits
	.global gFontgrp_339
gFontgrp_339:
	.4byte frontier_df4_uistuff_003_57CC64 + 0x120
	.4byte 0x000007FA
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FF0
	.4byte 0x00003AAC
	.4byte 0x00000FEB
	.4byte 0x00003AAB
	.4byte 0x0000EBEB
	.4byte 0x0000EBEB
	.4byte 0x00003AAC
	.4byte 0x00000FF0
	.4byte 0x00000000
