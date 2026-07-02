/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_243_ref, "a", %progbits
	.global gFontgrp_243
gFontgrp_243:
	.4byte frontier_df4_uistuff_020_59BFE4 + 0xD8
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000B0
	.4byte 0x00002CB0
	.4byte 0x0000BAF0
	.4byte 0x0000B0BF
	.4byte 0x000000BA
	.4byte 0x000000B0
	.4byte 0x00002FF0
	.4byte 0x0000BAB0
	.4byte 0x0000B0BC
	.4byte 0x0000B0BB
	.4byte 0x0000B0BB
	.4byte 0x0000B0BB
	.4byte 0x00002FBC
