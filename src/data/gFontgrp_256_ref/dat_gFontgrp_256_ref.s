/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_256_ref, "a", %progbits
	.global gFontgrp_256
gFontgrp_256:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x4068
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000000B
	.4byte 0x0000B00B
	.4byte 0x0000B00B
	.4byte 0x00002C0B
	.4byte 0x00002C0B
	.4byte 0x00000BAE
	.4byte 0x000002F8
