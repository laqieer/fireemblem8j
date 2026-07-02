/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_250_ref, "a", %progbits
	.global gFontgrp_250
gFontgrp_250:
	.4byte frontier_df4_uistuff_013_5987EC + 0x318
	.4byte 0x00000A82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00002C00
	.4byte 0x00002C00
	.4byte 0x00002C0B
	.4byte 0x0002FC0B
	.4byte 0x0000AFFB
	.4byte 0x00002EAB
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00002E0B
	.4byte 0x00002B2E
	.4byte 0x00000BAC
	.4byte 0x000002C0
