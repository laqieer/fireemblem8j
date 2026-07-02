/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_58_ref, "a", %progbits
	.global gFontgrp_58
gFontgrp_58:
	.4byte frontier_df4_uistuff_004_57CF7C + 0x240
	.4byte 0x00000783
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FF0
	.4byte 0x00003AAC
	.4byte 0x00000FF0
	.4byte 0x00003FFC
	.4byte 0x0000EAAB
	.4byte 0x0000EFFC
	.4byte 0x0000EC00
	.4byte 0x0000EC00
	.4byte 0x00003B00
	.4byte 0x00000EF0
	.4byte 0x000003AC
	.4byte 0x000000F0
	.4byte 0x00000000
