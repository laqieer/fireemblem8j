/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_216_ref, "a", %progbits
	.global gFontgrp_216
gFontgrp_216:
	.4byte frontier_df4_uistuff_012_596F74 + 0x1488
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000BFFF
	.4byte 0x0000BAAB
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000BFFF
	.4byte 0x0000BAAB
