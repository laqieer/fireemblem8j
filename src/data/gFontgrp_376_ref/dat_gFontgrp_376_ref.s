/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_376_ref, "a", %progbits
	.global gFontgrp_376
gFontgrp_376:
	.4byte frontier_df4_uistuff_014_598E64 + 0x558
	.4byte 0x00000B83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000BB2C0
	.4byte 0x000BB2C0
	.4byte 0x000BB2C0
	.4byte 0x0000BFFC
	.4byte 0x0000BAE8
	.4byte 0x0000B2C0
	.4byte 0x0000B2C0
	.4byte 0x0000B0B0
	.4byte 0x0000B0B0
	.4byte 0x0000B0B0
	.4byte 0x0000B02C
	.4byte 0x0000B02C
	.4byte 0x0000BC0B
