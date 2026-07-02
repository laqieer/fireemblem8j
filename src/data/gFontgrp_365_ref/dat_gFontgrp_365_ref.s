/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_365_ref, "a", %progbits
	.global gFontgrp_365
gFontgrp_365:
	.4byte frontier_df4_uistuff_012_596F74 + 0x90
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00002FFF
	.4byte 0x00002E00
	.4byte 0x00000BB0
	.4byte 0x000002F0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x0000002F
