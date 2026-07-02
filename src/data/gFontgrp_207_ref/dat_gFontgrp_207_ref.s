/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_207_ref, "a", %progbits
	.global gFontgrp_207
gFontgrp_207:
	.4byte frontier_df4_uistuff_012_596F74 + 0x1200
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x0000BFB0
	.4byte 0x0000BAF8
	.4byte 0x0000B0BF
	.4byte 0x000038B0
	.4byte 0x00002CB0
	.4byte 0x000000B0
	.4byte 0x000002E0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
