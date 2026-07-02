/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_251_ref, "a", %progbits
	.global gFontgrp_251
gFontgrp_251:
	.4byte frontier_df4_uistuff_019_59BA8C + 0x2D0
	.4byte 0x00000C82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x002E2C00
	.4byte 0x002EEC0B
	.4byte 0x000AEC0B
	.4byte 0x0000BC0B
	.4byte 0x00002FFB
	.4byte 0x00002EAB
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00002E0B
	.4byte 0x00000B2E
	.4byte 0x00000BAC
	.4byte 0x000002C0
