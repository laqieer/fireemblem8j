/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_379_ref, "a", %progbits
	.global gFontgrp_379
gFontgrp_379:
	.4byte frontier_df4_uistuff_016_59A2EC + 0x1F8
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x0000BFE0
	.4byte 0x0000BAB0
	.4byte 0x0000B0B8
	.4byte 0x0000B02C
	.4byte 0x0000380E
	.4byte 0x00002C0B
	.4byte 0x00000E00
	.4byte 0x00000B80
	.4byte 0x000002E0
	.4byte 0x000000B8
	.4byte 0x0000002C
