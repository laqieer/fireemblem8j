/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_215_ref, "a", %progbits
	.global gFontgrp_215
gFontgrp_215:
	.4byte frontier_df4_uistuff_012_596F74 + 0x1440
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00002E0B
	.4byte 0x00000B0B
	.4byte 0x00000B8B
	.4byte 0x000002EB
	.4byte 0x000000BB
	.4byte 0x0000002F
	.4byte 0x0000000B
