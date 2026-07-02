/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_65_ref, "a", %progbits
	.global gFontgrp_65
gFontgrp_65:
	.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x480
	.4byte 0x00000682
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FFC
	.4byte 0x00003AAB
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x00003AEB
	.4byte 0x00000EAB
	.4byte 0x000003EB
	.4byte 0x000000EB
	.4byte 0x000000EB
	.4byte 0x0000003C
