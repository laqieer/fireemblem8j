/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_121_ref, "a", %progbits
	.global gFontgrp_121
gFontgrp_121:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x1200
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FF0
	.4byte 0x00003AAC
	.4byte 0x00000EF0
	.4byte 0x00000DB0
	.4byte 0x00003A9C
	.4byte 0x0000E7EC
	.4byte 0x0000EC3B
	.4byte 0x0000EC0F
	.4byte 0x00003BC0
	.4byte 0x00000EB0
	.4byte 0x000003C0
	.4byte 0x00000000
