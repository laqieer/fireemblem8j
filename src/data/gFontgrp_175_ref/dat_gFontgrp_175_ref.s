/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_175_ref, "a", %progbits
	.global gFontgrp_175
gFontgrp_175:
	.4byte frontier_df4_uistuff_012_596F74 + 0x750
	.4byte 0x00000B83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000BB0B0
	.4byte 0x000BB2EB
	.4byte 0x000BB2EE
	.4byte 0x00002EEC
	.4byte 0x00002C2C
	.4byte 0x00002C00
	.4byte 0x00002C00
	.4byte 0x00002E00
	.4byte 0x00000B00
	.4byte 0x00000380
	.4byte 0x000002E0
	.4byte 0x000000B0
	.4byte 0x0000002C
