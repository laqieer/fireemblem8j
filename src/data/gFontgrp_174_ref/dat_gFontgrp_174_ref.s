/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_174_ref, "a", %progbits
	.global gFontgrp_174
gFontgrp_174:
	.4byte frontier_df4_uistuff_012_596F74 + 0x708
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000B2C0
	.4byte 0x0000B2CB
	.4byte 0x0000B2EE
	.4byte 0x0000B2EC
	.4byte 0x0000B02C
	.4byte 0x0000B000
	.4byte 0x00003800
	.4byte 0x00002C00
	.4byte 0x00000E00
	.4byte 0x00000B80
	.4byte 0x000002E0
	.4byte 0x000000B8
	.4byte 0x0000002C
