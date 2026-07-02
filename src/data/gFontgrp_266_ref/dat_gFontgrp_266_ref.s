/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_266_ref, "a", %progbits
	.global gFontgrp_266
gFontgrp_266:
	.4byte frontier_df4_uistuff_017_59A574 + 0x678
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000BF0
	.4byte 0x00002EEC
	.4byte 0x0000BAEC
	.4byte 0x0000B2CB
	.4byte 0x0000B2CB
	.4byte 0x0000B0BB
	.4byte 0x0000B0BB
	.4byte 0x0000B0BB
	.4byte 0x00002CBB
	.4byte 0x00002C2E
	.4byte 0x00000B2C
	.4byte 0x000002C8
