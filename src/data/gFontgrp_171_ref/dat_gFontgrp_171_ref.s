/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_171_ref, "a", %progbits
	.global gFontgrp_171
gFontgrp_171:
	.4byte frontier_df4_uistuff_012_596F74 + 0x5A0
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00002C00
	.4byte 0x00000BFC
	.4byte 0x000002E8
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x0000BFFF
	.4byte 0x0000AAEA
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002E0
	.4byte 0x000000B8
	.4byte 0x0000002C
