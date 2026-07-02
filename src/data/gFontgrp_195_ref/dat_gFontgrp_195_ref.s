/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_195_ref, "a", %progbits
	.global gFontgrp_195
gFontgrp_195:
	.4byte frontier_df4_uistuff_012_596F74 + 0xCF0
	.4byte 0x00000A83
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0002ECB0
	.4byte 0x0002ECB8
	.4byte 0x0002EEEC
	.4byte 0x000002EC
	.4byte 0x00000B8C
	.4byte 0x00000B0E
	.4byte 0x00000B0B
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00002C00
	.4byte 0x0000B000
	.4byte 0x0000B000
	.4byte 0x0000B000
