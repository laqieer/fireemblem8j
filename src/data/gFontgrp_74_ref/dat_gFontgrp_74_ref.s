/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_74_ref, "a", %progbits
	.global gFontgrp_74
gFontgrp_74:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x2E68
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003C3C
	.4byte 0x0000EBEB
	.4byte 0x0000EBEC
	.4byte 0x0000EBAC
	.4byte 0x00003AB0
	.4byte 0x00003AB0
	.4byte 0x00000EC0
	.4byte 0x00000EB0
	.4byte 0x000003B0
	.4byte 0x000003AC
	.4byte 0x000000F0
