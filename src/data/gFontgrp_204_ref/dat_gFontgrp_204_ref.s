/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_204_ref, "a", %progbits
	.global gFontgrp_204
gFontgrp_204:
	.4byte frontier_df4_uistuff_012_596F74 + 0x1128
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00002C00
	.4byte 0x00002C00
	.4byte 0x00002C00
	.4byte 0x00002CBC
	.4byte 0x00002EE8
	.4byte 0x00000B80
	.4byte 0x00000B80
	.4byte 0x00002EC0
	.4byte 0x0000BAE0
	.4byte 0x0000B0B0
	.4byte 0x000000B8
	.4byte 0x0000002E
	.4byte 0x0000000B
