/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_185_ref, "a", %progbits
	.global gFontgrp_185
gFontgrp_185:
	.4byte frontier_df4_uistuff_012_596F74 + 0xA20
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000B00
	.4byte 0x00000BB0
	.4byte 0x00000BB0
	.4byte 0x00000CB0
	.4byte 0x00002CB0
	.4byte 0x00002CB0
	.4byte 0x00002C2C
	.4byte 0x0000B82C
	.4byte 0x0000B02C
	.4byte 0x0000B02E
	.4byte 0x0000B00B
	.4byte 0x0000B00B
