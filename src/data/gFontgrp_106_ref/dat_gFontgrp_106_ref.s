/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_106_ref, "a", %progbits
	.global gFontgrp_106
gFontgrp_106:
	.4byte frontier_df4_uistuff_006_57E4DC + 0x318
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C30
	.4byte 0x00003BEC
	.4byte 0x00003BEC
	.4byte 0x0000FBEC
	.4byte 0x0003AAAB
	.4byte 0x0000FBEC
	.4byte 0x00003BEC
	.4byte 0x00003AEC
	.4byte 0x00000FEC
	.4byte 0x00003FEC
	.4byte 0x0000EAB0
	.4byte 0x00003FC0
	.4byte 0x00000000
