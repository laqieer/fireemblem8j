/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_200_ref, "a", %progbits
	.global gFontgrp_200
gFontgrp_200:
	.4byte frontier_df4_uistuff_020_59BFE4 + 0x990
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000BFFF
	.4byte 0x0000BAAA
	.4byte 0x0000B000
	.4byte 0x0000B000
	.4byte 0x00003800
	.4byte 0x00002C2C
	.4byte 0x00000EB0
	.4byte 0x00000BB0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x00000B00
	.4byte 0x00000B00
