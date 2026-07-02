/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_80_ref, "a", %progbits
	.global gFontgrp_80
gFontgrp_80:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x1CF8
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000C0
	.4byte 0x00000FB0
	.4byte 0x00003AAC
	.4byte 0x00000FB0
	.4byte 0x00003AAC
	.4byte 0x0000EBBB
	.4byte 0x0000EEFB
	.4byte 0x00003BAC
	.4byte 0x00000CF0
	.4byte 0x00000000
