/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_198_ref, "a", %progbits
	.global gFontgrp_198
gFontgrp_198:
	.4byte frontier_df4_uistuff_013_5987EC + 0x120
	.4byte 0x00000A83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0002EEC0
	.4byte 0x0002EEC0
	.4byte 0x0002EEC0
	.4byte 0x0000BFFF
	.4byte 0x00002AEA
	.4byte 0x000002C0
	.4byte 0x00002EEC
	.4byte 0x00002EEC
	.4byte 0x00002EEC
	.4byte 0x0000B2CB
	.4byte 0x0000B2CB
	.4byte 0x0000B2CB
	.4byte 0x000002C0
