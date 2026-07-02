/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_330_ref, "a", %progbits
	.global gFontgrp_330
gFontgrp_330:
	.4byte frontier_df3_fontgrp_se_001_57F604 + 0x3F0
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003FF0
	.4byte 0x0000EAAC
	.4byte 0x00003BFB
	.4byte 0x00003B0C
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x00000EB0
	.4byte 0x00000EB0
	.4byte 0x000003B0
	.4byte 0x000000C0
	.4byte 0x00000000
