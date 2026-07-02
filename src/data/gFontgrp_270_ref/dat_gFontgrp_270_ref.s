/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_270_ref, "a", %progbits
	.global gFontgrp_270
gFontgrp_270:
	.4byte frontier_df4_uistuff_018_59B0FC + 0x2D0
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000B80B0
	.4byte 0x000BBBE0
	.4byte 0x0002B2C0
	.4byte 0x00002000
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x00002EE0
	.4byte 0x00002EC0
	.4byte 0x0000BBAC
	.4byte 0x0000BB2C
	.4byte 0x0000BB3B
	.4byte 0x0000BBBB
	.4byte 0x000002E0
