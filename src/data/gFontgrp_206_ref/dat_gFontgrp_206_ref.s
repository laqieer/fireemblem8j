/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_206_ref, "a", %progbits
	.global gFontgrp_206
gFontgrp_206:
	.4byte frontier_df4_uistuff_012_596F74 + 0x11B8
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000002C
	.4byte 0x0000002C
	.4byte 0x00002FFC
	.4byte 0x00002EBF
	.4byte 0x00000BBA
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x000000B0
