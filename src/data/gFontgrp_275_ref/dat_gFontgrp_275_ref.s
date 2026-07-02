/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_275_ref, "a", %progbits
	.global gFontgrp_275
gFontgrp_275:
	.4byte frontier_df4_uistuff_017_59A574 + 0x168
	.4byte 0x00000A93
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0002FFFF
	.4byte 0x0002C00B
	.4byte 0x0002C00B
	.4byte 0x0002C00B
	.4byte 0x0002C00B
	.4byte 0x0002C00B
	.4byte 0x0002FFFF
	.4byte 0x0002C00B
	.4byte 0x0002C00B
	.4byte 0x0002C00B
	.4byte 0x0002C00B
	.4byte 0x0002C00B
	.4byte 0x0002FFFF
	.4byte 0x0002C00B
