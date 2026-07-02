/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_248_ref, "a", %progbits
	.global gFontgrp_248
gFontgrp_248:
	.4byte frontier_df4_uistuff_020_59BFE4 + 0xD38
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00002C00
	.4byte 0x00000B00
	.4byte 0x000002C0
	.4byte 0x000000B0
	.4byte 0x0000002C
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000002E
	.4byte 0x000000B8
	.4byte 0x000002E0
	.4byte 0x000002C0
	.4byte 0x00000B80
	.4byte 0x00000B00
