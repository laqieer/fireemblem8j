/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_165_ref, "a", %progbits
	.global gFontgrp_165
gFontgrp_165:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x1E18
	.4byte 0x00000897
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x0000FEFC
	.4byte 0x0003AAAB
	.4byte 0x0000FEFC
	.4byte 0x0003B9BB
	.4byte 0x0000EEEC
	.4byte 0x0003B9BB
	.4byte 0x0000EA9C
	.4byte 0x0000FEFC
	.4byte 0x0003AAAB
	.4byte 0x0000FEFC
	.4byte 0x00000EC0
	.4byte 0x00000300
	.4byte 0x00000000
