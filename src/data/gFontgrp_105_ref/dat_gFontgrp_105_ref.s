/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_105_ref, "a", %progbits
	.global gFontgrp_105
gFontgrp_105:
	.4byte frontier_df3_fontgrp_se_008_582A54 + 0x3F0
	.4byte 0x00000982
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00033300
	.4byte 0x000EEEC0
	.4byte 0x000EEEFC
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
