/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_84_ref, "a", %progbits
	.global gFontgrp_84
gFontgrp_84:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x4260
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000003C0
	.4byte 0x00000EB0
	.4byte 0x00000FC0
	.4byte 0x00003ABC
	.4byte 0x0000EFEB
	.4byte 0x0000EC3C
	.4byte 0x00003BC0
	.4byte 0x00000EB0
	.4byte 0x000003C0
	.4byte 0x00000000
