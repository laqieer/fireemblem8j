/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_359_ref, "a", %progbits
	.global gFontgrp_359
gFontgrp_359:
	.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x828
	.4byte 0x00000781
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000C3FC
	.4byte 0x0000BEAB
	.4byte 0x0000C3AC
	.4byte 0x0000C3AC
	.4byte 0x0000C3AC
	.4byte 0x0000C3AC
	.4byte 0x0000C3AC
	.4byte 0x0000C3AC
	.4byte 0x000033AC
	.4byte 0x0000EFAC
	.4byte 0x0000EAAB
	.4byte 0x00003FFC
	.4byte 0x00000000
