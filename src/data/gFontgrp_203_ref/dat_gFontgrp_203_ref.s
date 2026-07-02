/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_203_ref, "a", %progbits
	.global gFontgrp_203
gFontgrp_203:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0xA20
	.4byte 0x00000983
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x00000BB0
	.4byte 0x00000BB0
	.4byte 0x00000B2C
	.4byte 0x00002E2C
	.4byte 0x00002C2C
	.4byte 0x00002FAC
	.4byte 0x0000BAFC
	.4byte 0x0000B00B
