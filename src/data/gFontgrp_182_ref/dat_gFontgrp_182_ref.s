/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_182_ref, "a", %progbits
	.global gFontgrp_182
gFontgrp_182:
	.4byte frontier_df4_uistuff_012_596F74 + 0x948
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000BFFC
	.4byte 0x0000BAA8
	.4byte 0x0000B000
	.4byte 0x0000B800
	.4byte 0x00002CB0
	.4byte 0x00002EC0
	.4byte 0x00000B80
	.4byte 0x00000B80
	.4byte 0x00002EE0
	.4byte 0x000030B8
	.4byte 0x0000002E
	.4byte 0x0000000B
