/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_34_ref, "a", %progbits
	.global gFontgrp_34
gFontgrp_34:
	.4byte data_0857DEF4 + 0x48
	.4byte 0x00000683
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000C
	.4byte 0x0000003B
	.4byte 0x0000003B
	.4byte 0x00000F3B
	.4byte 0x00003AFB
	.4byte 0x00000FAB
	.4byte 0x000000FB
	.4byte 0x0000003B
	.4byte 0x0000003B
	.4byte 0x00000FFB
	.4byte 0x00003AAC
	.4byte 0x00000FF0
	.4byte 0x00000000
