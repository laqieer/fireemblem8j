/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_229_ref, "a", %progbits
	.global gFontgrp_229
gFontgrp_229:
	.4byte frontier_df4_uistuff_017_59A574 + 0x510
	.4byte 0x00000682
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002FF
	.4byte 0x000002EA
	.4byte 0x000000B0
	.4byte 0x000000B8
	.4byte 0x0000002C
	.4byte 0x0000002E
	.4byte 0x000002AB
	.4byte 0x000002FF
	.4byte 0x00000000
