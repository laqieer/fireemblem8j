/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_325_ref, "a", %progbits
	.global gFontgrp_325
gFontgrp_325:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x17A0
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FF0
	.4byte 0x00003AAC
	.4byte 0x0000EBEB
	.4byte 0x0000EB3B
	.4byte 0x00003B0C
	.4byte 0x00000EC0
	.4byte 0x000033B0
	.4byte 0x0000EFEC
	.4byte 0x0000EAAB
	.4byte 0x00003FFC
	.4byte 0x00000000
