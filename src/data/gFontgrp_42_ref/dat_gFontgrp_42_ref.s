/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_42_ref, "a", %progbits
	.global gFontgrp_42
gFontgrp_42:
	.4byte frontier_df4_uistuff_005_57DFCC + 0x1B0
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000FC00
	.4byte 0x00036700
	.4byte 0x0003BBC0
	.4byte 0x000367B0
	.4byte 0x0000FEEC
	.4byte 0x00003BEC
	.4byte 0x0000E73B
	.4byte 0x0000EC3B
	.4byte 0x00039C0F
	.4byte 0x0003B000
	.4byte 0x0003B000
	.4byte 0x0003B000
	.4byte 0x0000C000
	.4byte 0x00000000
