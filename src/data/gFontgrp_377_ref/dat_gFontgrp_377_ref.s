/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_377_ref, "a", %progbits
	.global gFontgrp_377
gFontgrp_377:
	.4byte frontier_df4_uistuff_020_59BFE4 + 0x828
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x00003FC0
	.4byte 0x00002AFF
	.4byte 0x000002EA
	.4byte 0x000002C0
	.4byte 0x0000FFC0
	.4byte 0x0000AAFF
	.4byte 0x000002EA
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
