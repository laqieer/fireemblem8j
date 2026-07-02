/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_245_ref, "a", %progbits
	.global gFontgrp_245
gFontgrp_245:
	.4byte frontier_df4_uistuff_019_59BA8C + 0x438
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000B80B0
	.4byte 0x000BB0B0
	.4byte 0x0002BCB0
	.4byte 0x00002EFC
	.4byte 0x0000BBBB
	.4byte 0x0000BBB2
	.4byte 0x0000BB2C
	.4byte 0x0000BB2C
	.4byte 0x0000BB2C
	.4byte 0x00000B2C
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x000002FB
