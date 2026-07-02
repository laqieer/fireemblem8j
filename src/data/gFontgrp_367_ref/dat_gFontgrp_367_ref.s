/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_367_ref, "a", %progbits
	.global gFontgrp_367
gFontgrp_367:
	.4byte frontier_df4_uistuff_012_596F74 + 0x120
	.4byte 0x00000783
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C00
	.4byte 0x00000B00
	.4byte 0x000002C0
	.4byte 0x000002F0
	.4byte 0x000002EC
	.4byte 0x000002CB
	.4byte 0x000002C0
	.4byte 0x000002C0
