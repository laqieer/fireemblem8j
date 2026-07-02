/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_368_ref, "a", %progbits
	.global gFontgrp_368
gFontgrp_368:
	.4byte frontier_df4_uistuff_012_596F74 + 0x168
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000B000
	.4byte 0x0000B000
	.4byte 0x00002C00
	.4byte 0x00000B00
	.4byte 0x00000BC0
	.4byte 0x00000BB0
	.4byte 0x00000B2C
	.4byte 0x00000B0B
	.4byte 0x00000B02
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
