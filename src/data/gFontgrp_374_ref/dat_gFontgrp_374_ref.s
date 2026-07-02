/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_374_ref, "a", %progbits
	.global gFontgrp_374
gFontgrp_374:
	.4byte frontier_df4_uistuff_012_596F74 + 0x3A8
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x0000BFFF
	.4byte 0x00002BAA
	.4byte 0x00000BC0
	.4byte 0x00000BC0
	.4byte 0x00000BE0
	.4byte 0x00000BB0
	.4byte 0x00000BB8
	.4byte 0x00000B2C
	.4byte 0x00000B2E
	.4byte 0x00000B0B
	.4byte 0x000002C0
