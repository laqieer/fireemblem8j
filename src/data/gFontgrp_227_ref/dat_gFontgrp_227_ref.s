/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_227_ref, "a", %progbits
	.global gFontgrp_227
gFontgrp_227:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0xC18
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000B8B
	.4byte 0x00000B8B
	.4byte 0x000002EE
	.4byte 0x000000B8
	.4byte 0x000000B8
	.4byte 0x000002EE
	.4byte 0x00000B8B
	.4byte 0x00000B8B
	.4byte 0x00000000
