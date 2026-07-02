/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_260_ref, "a", %progbits
	.global gFontgrp_260
gFontgrp_260:
	.4byte frontier_df4_uistuff_013_5987EC + 0x5E8
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000B00
	.4byte 0x00000B2C
	.4byte 0x00000B2C
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
