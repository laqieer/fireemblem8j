/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_234_ref, "a", %progbits
	.global gFontgrp_234
gFontgrp_234:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x1CF8
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000B0
	.4byte 0x00000BB0
	.4byte 0x000002FC
	.4byte 0x000000B8
	.4byte 0x00000BF0
	.4byte 0x00002FBC
	.4byte 0x0000BBBC
	.4byte 0x0000B2FB
	.4byte 0x0000B2FB
	.4byte 0x0000B0BB
	.4byte 0x00002F2E
