/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_61_ref, "a", %progbits
	.global gFontgrp_61
gFontgrp_61:
	.4byte frontier_df4_uistuff_004_57CF7C + 0x318
	.4byte 0x00000683
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000C
	.4byte 0x0000003B
	.4byte 0x0000003B
	.4byte 0x0000003B
	.4byte 0x00000C3B
	.4byte 0x00003B3B
	.4byte 0x00003B3B
	.4byte 0x00000EFB
	.4byte 0x00000EFB
	.4byte 0x000003BB
	.4byte 0x000000EB
	.4byte 0x0000003C
	.4byte 0x00000000
