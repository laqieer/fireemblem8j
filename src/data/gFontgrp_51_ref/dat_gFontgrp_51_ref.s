/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_51_ref, "a", %progbits
	.global gFontgrp_51
gFontgrp_51:
	.4byte frontier_df4_uistuff_004_57CF7C + 0x48
	.4byte 0x00000783
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FF0
	.4byte 0x00003AAC
	.4byte 0x00000FB0
	.4byte 0x000003B0
	.4byte 0x00003FBC
	.4byte 0x0000EAAB
	.4byte 0x00003FBC
	.4byte 0x000003B0
	.4byte 0x000003B0
	.4byte 0x00003FB0
	.4byte 0x0000EAC0
	.4byte 0x00003F00
	.4byte 0x00000000
