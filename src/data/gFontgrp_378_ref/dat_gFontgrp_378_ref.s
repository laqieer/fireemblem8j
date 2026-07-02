/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_378_ref, "a", %progbits
	.global gFontgrp_378
gFontgrp_378:
	.4byte frontier_df4_uistuff_020_59BFE4 + 0x5A0
	.4byte 0x00000B83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000BB2C0
	.4byte 0x000BB2C0
	.4byte 0x000BB2C0
	.4byte 0x0000FFC0
	.4byte 0x0000AAFF
	.4byte 0x000002EA
	.4byte 0x000002C0
	.4byte 0x0000FFC0
	.4byte 0x0000AAFF
	.4byte 0x000002EA
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
