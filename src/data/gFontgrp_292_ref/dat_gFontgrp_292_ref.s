/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_292_ref, "a", %progbits
	.global gFontgrp_292
gFontgrp_292:
	.4byte frontier_df4_uistuff_020_59BFE4 + 0x360
	.4byte 0x00000B93
	.4byte 0x00000000
	.4byte 0x0002C0BF
	.4byte 0x0002C000
	.4byte 0x0002C2FF
	.4byte 0x000BFF00
	.4byte 0x0002C0BF
	.4byte 0x0002C000
	.4byte 0x0002C0BF
	.4byte 0x0002CB00
	.4byte 0x0002EC00
	.4byte 0x0002ECBF
	.4byte 0x0002C0BB
	.4byte 0x0002C0BB
	.4byte 0x0002C0BB
	.4byte 0x0002C0BF
	.4byte 0x0002F0BB
