/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_26_ref, "a", %progbits
	.global gFontgrp_26
gFontgrp_26:
	.4byte frontier_df4_uistuff_003_57CC64 + 0x1F8
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x0000FEFC
	.4byte 0x0003AAAB
	.4byte 0x0000FEFC
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x00000E70
	.4byte 0x000003B0
	.4byte 0x000000EC
	.4byte 0x0000003C
	.4byte 0x00000000
