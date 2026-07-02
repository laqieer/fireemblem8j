/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_236_ref, "a", %progbits
	.global gFontgrp_236
gFontgrp_236:
	.4byte frontier_df4_uistuff_013_5987EC + 0x510
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x00000B0B
	.4byte 0x00002E0B
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00002CBB
	.4byte 0x000000BB
	.4byte 0x0000002E
	.4byte 0x0000002C
