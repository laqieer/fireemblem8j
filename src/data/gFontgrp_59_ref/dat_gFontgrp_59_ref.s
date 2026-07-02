/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_59_ref, "a", %progbits
	.global gFontgrp_59
gFontgrp_59:
	.4byte frontier_df4_uistuff_004_57CF7C + 0x288
	.4byte 0x00000683
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C00
	.4byte 0x00003B0C
	.4byte 0x00003B3B
	.4byte 0x00003B3B
	.4byte 0x00003B3B
	.4byte 0x00003B3B
	.4byte 0x00003B3B
	.4byte 0x00003B0C
	.4byte 0x00003B00
	.4byte 0x00000EF0
	.4byte 0x000003AC
	.4byte 0x000000F0
	.4byte 0x00000000
