/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_261_ref, "a", %progbits
	.global gFontgrp_261
gFontgrp_261:
	.4byte frontier_df4_uistuff_014_598E64 + 0x798
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000B8B00
	.4byte 0x000BBB2C
	.4byte 0x0002BB2C
	.4byte 0x00002B2C
	.4byte 0x0000BF2C
	.4byte 0x00002BFF
	.4byte 0x00000BAE
	.4byte 0x00000B2C
	.4byte 0x00000B2C
	.4byte 0x000002EC
	.4byte 0x000000AC
	.4byte 0x0000002C
	.4byte 0x00000AAC
	.4byte 0x00000FF8
