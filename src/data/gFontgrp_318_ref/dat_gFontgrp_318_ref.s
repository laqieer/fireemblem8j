/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_318_ref, "a", %progbits
	.global gFontgrp_318
gFontgrp_318:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x1E18
	.4byte 0x00000B97
	.4byte 0x00000000
	.4byte 0x00000B00
	.4byte 0x000BFFFF
	.4byte 0x00000B00
	.4byte 0x000B02CB
	.4byte 0x0002EF2C
	.4byte 0x00000B00
	.4byte 0x000002C0
	.4byte 0x0002EEEC
	.4byte 0x000BBFFB
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x000BFFFF
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
