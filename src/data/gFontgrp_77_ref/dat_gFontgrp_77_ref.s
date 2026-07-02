/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_77_ref, "a", %progbits
	.global gFontgrp_77
gFontgrp_77:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x52F8
	.4byte 0x00000895
	.4byte 0x00000000
	.4byte 0x000003C0
	.4byte 0x0000FEF0
	.4byte 0x0003AAEC
	.4byte 0x0000FDBB
	.4byte 0x0003AA7F
	.4byte 0x0003BEEC
	.4byte 0x000396FB
	.4byte 0x0003AAFB
	.4byte 0x0000FB3B
	.4byte 0x0003A9FB
	.4byte 0x00039EFB
	.4byte 0x0000EB3B
	.4byte 0x0003BEFB
	.4byte 0x0003C3CC
	.4byte 0x00000000
