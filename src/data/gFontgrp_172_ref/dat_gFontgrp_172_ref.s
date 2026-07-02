/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_172_ref, "a", %progbits
	.global gFontgrp_172
gFontgrp_172:
	.4byte frontier_df4_uistuff_012_596F74 + 0x678
	.4byte 0x00000B83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000BBC00
	.4byte 0x000BBBFC
	.4byte 0x000BB2E8
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x00003FFF
	.4byte 0x00002AEA
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002E0
	.4byte 0x000000B0
	.4byte 0x0000002C
