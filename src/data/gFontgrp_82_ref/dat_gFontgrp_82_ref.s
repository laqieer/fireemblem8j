/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_82_ref, "a", %progbits
	.global gFontgrp_82
gFontgrp_82:
	.4byte frontier_df4_uistuff_006_57E4DC + 0x240
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C0C
	.4byte 0x00003B3B
	.4byte 0x0000EC3B
	.4byte 0x0000EC3B
	.4byte 0x0000303B
	.4byte 0x000000EC
	.4byte 0x00000030
	.4byte 0x00000000
