/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_114_ref, "a", %progbits
	.global gFontgrp_114
gFontgrp_114:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x8B8
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000CC00
	.4byte 0x0003BB00
	.4byte 0x0003BBC0
	.4byte 0x0000FEBC
	.4byte 0x0000EF6B
	.4byte 0x0000ECEC
	.4byte 0x0003ACEC
	.4byte 0x0000EC3B
	.4byte 0x0000EC3B
	.4byte 0x0000EC3B
	.4byte 0x00003BEC
	.4byte 0x00000EB0
	.4byte 0x000003C0
	.4byte 0x00000000
