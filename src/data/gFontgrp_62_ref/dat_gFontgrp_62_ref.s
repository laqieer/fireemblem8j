/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_62_ref, "a", %progbits
	.global gFontgrp_62
gFontgrp_62:
	.4byte frontier_df4_uistuff_004_57CF7C + 0x360
	.4byte 0x00000783
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000FFFF
	.4byte 0x0000EAAB
	.4byte 0x0000EFFB
	.4byte 0x0000EC3B
	.4byte 0x0000EC3B
	.4byte 0x0000EC3B
	.4byte 0x0000EC3B
	.4byte 0x0000EC3B
	.4byte 0x0000EFFB
	.4byte 0x0000EAAB
	.4byte 0x0000EFFB
	.4byte 0x0000300C
	.4byte 0x00000000
