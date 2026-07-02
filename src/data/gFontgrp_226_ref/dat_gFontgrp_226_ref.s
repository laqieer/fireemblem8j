/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_226_ref, "a", %progbits
	.global gFontgrp_226
gFontgrp_226:
	.4byte frontier_df4_uistuff_015_599BE4 + 0x48
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000B2CB
	.4byte 0x0000B2CB
	.4byte 0x0000BBBB
	.4byte 0x0000BBBB
	.4byte 0x0000BBBB
	.4byte 0x0000BBBB
	.4byte 0x00002C2C
	.4byte 0x00002C2C
	.4byte 0x00000000
