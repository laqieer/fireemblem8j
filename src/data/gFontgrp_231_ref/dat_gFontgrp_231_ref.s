/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_231_ref, "a", %progbits
	.global gFontgrp_231
gFontgrp_231:
	.4byte frontier_fontgrp_ui_000_59D4FC + 0x52F8
	.4byte 0x00000B95
	.4byte 0x00000000
	.4byte 0x00000B2C
	.4byte 0x000BFF2C
	.4byte 0x000002CB
	.4byte 0x0002FFBB
	.4byte 0x0002CBB0
	.4byte 0x0002FF2C
	.4byte 0x0002CB2F
	.4byte 0x0002FF2F
	.4byte 0x00002C2C
	.4byte 0x0002FC2C
	.4byte 0x0002CB2C
	.4byte 0x0002EEEC
	.4byte 0x0000B02C
	.4byte 0x0000BC2C
	.4byte 0x000BCBEC
