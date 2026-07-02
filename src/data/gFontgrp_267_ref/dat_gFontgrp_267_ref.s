/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_267_ref, "a", %progbits
	.global gFontgrp_267
gFontgrp_267:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x8B8
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000B8000
	.4byte 0x000BBEFF
	.4byte 0x0002BCBA
	.4byte 0x00002CB0
	.4byte 0x0000BC2C
	.4byte 0x0000BC2C
	.4byte 0x0000BC0B
	.4byte 0x0002EC0B
	.4byte 0x0002EC0B
	.4byte 0x0000AE0B
	.4byte 0x00000B0B
	.4byte 0x00000BAE
	.4byte 0x000002F8
