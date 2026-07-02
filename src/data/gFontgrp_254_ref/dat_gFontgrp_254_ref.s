/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_254_ref, "a", %progbits
	.global gFontgrp_254
gFontgrp_254:
	.4byte frontier_df4_uistuff_013_5987EC + 0x3F0
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x0000B2C0
	.4byte 0x00002FC0
	.4byte 0x00000AFF
	.4byte 0x00000BAA
	.4byte 0x00000B00
	.4byte 0x00002E00
	.4byte 0x00002FFC
	.4byte 0x00003AAB
	.4byte 0x0000200B
	.4byte 0x0000000B
	.4byte 0x00000AAE
	.4byte 0x00000FF8
