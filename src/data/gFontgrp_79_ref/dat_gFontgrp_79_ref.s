/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_79_ref, "a", %progbits
	.global gFontgrp_79
gFontgrp_79:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x5A0
	.4byte 0x0000098D
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000C
	.4byte 0x0000FC3B
	.4byte 0x0000EBEF
	.4byte 0x0000EC30
	.4byte 0x0000ECFC
	.4byte 0x0000ECEB
	.4byte 0x00039BEF
	.4byte 0x0003BBEC
	.4byte 0x0003B6EC
	.4byte 0x000ECF6C
	.4byte 0x0003FDAC
	.4byte 0x000EAAFB
	.4byte 0x0003FF0F
	.4byte 0x00000000
