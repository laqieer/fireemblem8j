/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_101_ref, "a", %progbits
	.global gFontgrp_101
gFontgrp_101:
	.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x4C8
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003300
	.4byte 0x0000EEC0
	.4byte 0x0000EEB0
	.4byte 0x00003FBC
	.4byte 0x00003AAB
	.4byte 0x00000EFC
	.4byte 0x00000EF0
	.4byte 0x00003AAC
	.4byte 0x00003BFB
	.4byte 0x00000C3B
	.4byte 0x00000FFB
	.4byte 0x00003AAC
	.4byte 0x00000FF0
	.4byte 0x00000000
