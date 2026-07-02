/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_104_ref, "a", %progbits
	.global gFontgrp_104
gFontgrp_104:
	.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x360
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C00
	.4byte 0x0000FBFC
	.4byte 0x0003AAAB
	.4byte 0x0000FBFC
	.4byte 0x00003AB0
	.4byte 0x00003BEC
	.4byte 0x00003BEC
	.4byte 0x00003AEC
	.4byte 0x00003BB0
	.4byte 0x00003BC0
	.4byte 0x00000EB0
	.4byte 0x000003C0
	.4byte 0x00000000
