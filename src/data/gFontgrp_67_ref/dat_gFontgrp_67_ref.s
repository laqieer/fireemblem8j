/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_67_ref, "a", %progbits
	.global gFontgrp_67
gFontgrp_67:
	.4byte frontier_df4_uistuff_005_57DFCC + 0x2D0
	.4byte 0x00000682
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000003C
	.4byte 0x00000FEB
	.4byte 0x00003AEB
	.4byte 0x00003BAB
	.4byte 0x00003CEB
	.4byte 0x000000EB
	.4byte 0x000000EB
	.4byte 0x000000EB
	.4byte 0x000000EB
	.4byte 0x0000003C
	.4byte 0x00000000
