/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_274_ref, "a", %progbits
	.global gFontgrp_274
gFontgrp_274:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x8988
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00002FC0
	.4byte 0x00000BBC
	.4byte 0x00000B28
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x00000BF0
	.4byte 0x00002EB0
	.4byte 0x0000B82C
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x0000B800
	.4byte 0x00002EA0
	.4byte 0x00000BF0
