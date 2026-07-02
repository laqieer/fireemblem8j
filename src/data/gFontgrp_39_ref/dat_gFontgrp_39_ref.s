/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_39_ref, "a", %progbits
	.global gFontgrp_39
gFontgrp_39:
	.4byte frontier_df4_uistuff_003_57CC64 + 0x1B0
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000FC00
	.4byte 0x00036700
	.4byte 0x0003BBFC
	.4byte 0x000366AB
	.4byte 0x0000FBFC
	.4byte 0x00003B00
	.4byte 0x00003B00
	.4byte 0x00003B00
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x000003BC
	.4byte 0x000000EB
	.4byte 0x0000003C
	.4byte 0x00000000
