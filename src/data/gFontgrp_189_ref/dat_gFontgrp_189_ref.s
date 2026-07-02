/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_189_ref, "a", %progbits
	.global gFontgrp_189
gFontgrp_189:
	.4byte frontier_df4_uistuff_012_596F74 + 0xB40
	.4byte 0x00000B83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000BB00B
	.4byte 0x000BB00B
	.4byte 0x000BB00B
	.4byte 0x0000BC0B
	.4byte 0x00002BFF
	.4byte 0x000002AB
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000AAAC
	.4byte 0x0000BFF0
