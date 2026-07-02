/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_100_ref, "a", %progbits
	.global gFontgrp_100
gFontgrp_100:
	.4byte frontier_df4_uistuff_006_57E4DC + 0x120
	.4byte 0x00000682
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000C0
	.4byte 0x00000FB0
	.4byte 0x00003BBC
	.4byte 0x00000EAB
	.4byte 0x00000EFC
	.4byte 0x00000EF0
	.4byte 0x00003AAC
	.4byte 0x00003BFB
	.4byte 0x00000C3B
	.4byte 0x00000FFB
	.4byte 0x00003AAC
	.4byte 0x00000FF0
	.4byte 0x00000000
