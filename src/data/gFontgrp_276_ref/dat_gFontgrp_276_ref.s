/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_276_ref, "a", %progbits
	.global gFontgrp_276
gFontgrp_276:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x3840
	.4byte 0x00000B95
	.4byte 0x00000000
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x000BFFFF
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x000002C0
	.4byte 0x0002FFC0
	.4byte 0x0002C2C0
	.4byte 0x0002C2C0
	.4byte 0x0002C2C0
	.4byte 0x0002C0B0
	.4byte 0x0002C0B0
	.4byte 0x0000B02C
	.4byte 0x0000B02C
	.4byte 0x00002C0B
