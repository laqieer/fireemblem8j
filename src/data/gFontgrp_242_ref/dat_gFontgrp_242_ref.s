/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_242_ref, "a", %progbits
	.global gFontgrp_242
gFontgrp_242:
	.4byte frontier_df4_uistuff_013_5987EC + 0x90
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000BB0
	.4byte 0x00002EFF
	.4byte 0x00002CBA
	.4byte 0x000008B0
	.4byte 0x00000BF0
	.4byte 0x00002EBC
	.4byte 0x00002CBB
	.4byte 0x00002CBB
	.4byte 0x00002C2F
	.4byte 0x00000B2E
