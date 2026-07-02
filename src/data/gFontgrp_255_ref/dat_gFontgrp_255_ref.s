/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_255_ref, "a", %progbits
	.global gFontgrp_255
gFontgrp_255:
	.4byte frontier_df4_uistuff_017_59A574 + 0x4C8
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x000B82C0
	.4byte 0x000BB2C0
	.4byte 0x0002BF80
	.4byte 0x00002BFF
	.4byte 0x00000BAA
	.4byte 0x00000B00
	.4byte 0x00002E00
	.4byte 0x00002FFC
	.4byte 0x00003AAB
	.4byte 0x0000200B
	.4byte 0x0000000B
	.4byte 0x00002AAE
	.4byte 0x00003FF8
