/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_186_ref, "a", %progbits
	.global gFontgrp_186
gFontgrp_186:
	.4byte frontier_df4_uistuff_012_596F74 + 0xA68
	.4byte 0x00000B83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000BB000
	.4byte 0x000BBB00
	.4byte 0x000BBBB0
	.4byte 0x00000BB0
	.4byte 0x00000BB0
	.4byte 0x00002CB0
	.4byte 0x00002CB8
	.4byte 0x00002C2C
	.4byte 0x00002C2C
	.4byte 0x0000B82C
	.4byte 0x0000B02E
	.4byte 0x0000B00B
	.4byte 0x0000B00B
