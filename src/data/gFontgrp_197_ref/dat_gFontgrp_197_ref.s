/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_197_ref, "a", %progbits
	.global gFontgrp_197
gFontgrp_197:
	.4byte frontier_df4_uistuff_018_59B0FC + 0x48
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x0000BFFF
	.4byte 0x0000AAEA
	.4byte 0x000002C0
	.4byte 0x00002EEC
	.4byte 0x00002EEC
	.4byte 0x00002EEC
	.4byte 0x0000B2CB
	.4byte 0x0000B2CB
	.4byte 0x0000B2CB
	.4byte 0x000002C0
