/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_221_ref, "a", %progbits
	.global gFontgrp_221
gFontgrp_221:
	.4byte frontier_df4_uistuff_013_5987EC + 0xD8
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000BEC
	.4byte 0x000002BC
	.4byte 0x0000003C
	.4byte 0x0000002C
	.4byte 0x0000002C
	.4byte 0x0000002C
	.4byte 0x0000002C
	.4byte 0x0000002C
	.4byte 0x0000002C
	.4byte 0x00000000
