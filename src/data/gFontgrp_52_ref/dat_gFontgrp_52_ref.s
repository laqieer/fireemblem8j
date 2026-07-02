/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_52_ref, "a", %progbits
	.global gFontgrp_52
gFontgrp_52:
	.4byte frontier_df4_uistuff_004_57CF7C + 0x90
	.4byte 0x00000683
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000030
	.4byte 0x00000FEC
	.4byte 0x00003AAB
	.4byte 0x00003BEC
	.4byte 0x00000EEC
	.4byte 0x000003B0
	.4byte 0x000003B0
	.4byte 0x000000C0
	.4byte 0x00000000
