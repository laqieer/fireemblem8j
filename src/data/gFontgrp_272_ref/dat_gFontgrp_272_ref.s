/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_272_ref, "a", %progbits
	.global gFontgrp_272
gFontgrp_272:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x40F8
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x00000BAC
	.4byte 0x00002F2C
	.4byte 0x0000BAF8
	.4byte 0x0000B0BC
	.4byte 0x0000B0BB
	.4byte 0x00002FB2
	.4byte 0x00000AB0
	.4byte 0x000002E0
	.4byte 0x000002C0
	.4byte 0x000002C0
