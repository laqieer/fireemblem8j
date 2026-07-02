/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_205_ref, "a", %progbits
	.global gFontgrp_205
gFontgrp_205:
	.4byte frontier_df4_uistuff_012_596F74 + 0x1170
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FFC
	.4byte 0x00000AB8
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x00003FFF
	.4byte 0x00002ABA
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x00000AB0
	.4byte 0x00000FE0
