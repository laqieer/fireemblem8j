/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_366_ref, "a", %progbits
	.global gFontgrp_366
gFontgrp_366:
	.4byte frontier_df4_uistuff_012_596F74 + 0xD8
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000BFFF
	.4byte 0x0000BAAA
	.4byte 0x0000B800
	.4byte 0x00002EC0
	.4byte 0x00000BC0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x0000002C
