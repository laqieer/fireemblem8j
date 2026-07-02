/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_355_ref, "a", %progbits
	.global gFontgrp_355
gFontgrp_355:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x4BF0
	.4byte 0x00000781
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000C0
	.4byte 0x000003B0
	.4byte 0x000000C0
	.4byte 0x00000000
	.4byte 0x000000C0
	.4byte 0x000003B0
	.4byte 0x000000C0
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
