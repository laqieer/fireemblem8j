/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_268_ref, "a", %progbits
	.global gFontgrp_268
gFontgrp_268:
	.4byte frontier_df4_uistuff_014_598E64 + 0x90
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0002C000
	.4byte 0x000BBEFF
	.4byte 0x0002ECBA
	.4byte 0x0000ACB0
	.4byte 0x0000BC2C
	.4byte 0x0000BC2C
	.4byte 0x0000BC0B
	.4byte 0x0002EC0B
	.4byte 0x0002EC0B
	.4byte 0x0000AE0B
	.4byte 0x00000B0B
	.4byte 0x00000BAE
	.4byte 0x000002F8
