/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_88_ref, "a", %progbits
	.global gFontgrp_88
gFontgrp_88:
	.4byte frontier_df4_uistuff_005_57DFCC + 0x288
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000C0
	.4byte 0x0000CFB0
	.4byte 0x0003BAAC
	.4byte 0x0003BFB0
	.4byte 0x0000FAAC
	.4byte 0x0000EFBB
	.4byte 0x0000EFBB
	.4byte 0x00003BEC
	.4byte 0x00000C30
	.4byte 0x00000000
