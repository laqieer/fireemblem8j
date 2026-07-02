/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_170_ref, "a", %progbits
	.global gFontgrp_170
gFontgrp_170:
	.4byte frontier_df4_uistuff_013_5987EC + 0x240
	.4byte 0x00000B83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000BB2C0
	.4byte 0x000BB2C0
	.4byte 0x000BBFC0
	.4byte 0x0000BAB0
	.4byte 0x0000B0B0
	.4byte 0x0000B0BC
	.4byte 0x0000BBEC
	.4byte 0x00002C0B
	.4byte 0x00002C00
	.4byte 0x00000B00
	.4byte 0x00000B80
	.4byte 0x000002E0
	.4byte 0x000000BC
