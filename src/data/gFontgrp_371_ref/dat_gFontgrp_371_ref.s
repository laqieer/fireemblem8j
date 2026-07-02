/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_371_ref, "a", %progbits
	.global gFontgrp_371
gFontgrp_371:
	.4byte frontier_df4_uistuff_012_596F74 + 0x240
	.4byte 0x00000783
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000003FF
	.4byte 0x000002BA
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x00000ABA
	.4byte 0x00000FFF
