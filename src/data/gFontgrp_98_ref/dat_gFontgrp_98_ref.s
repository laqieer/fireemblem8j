/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_98_ref, "a", %progbits
	.global gFontgrp_98
gFontgrp_98:
	.4byte frontier_df3_fontgrp_se_009_582F1C + 0x1D88
	.4byte 0x00000682
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000003F0
	.4byte 0x00000EAC
	.4byte 0x00003BF0
	.4byte 0x00000EC0
	.4byte 0x00000300
	.4byte 0x00000030
	.4byte 0x000000EC
	.4byte 0x0000003B
	.4byte 0x00000FFB
	.4byte 0x00003AAC
	.4byte 0x00000FF0
	.4byte 0x00000000
