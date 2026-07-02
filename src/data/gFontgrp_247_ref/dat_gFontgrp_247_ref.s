/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_247_ref, "a", %progbits
	.global gFontgrp_247
gFontgrp_247:
	.4byte frontier_df4_uistuff_014_598E64 + 0x438
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000002C0
	.4byte 0x000B82C0
	.4byte 0x000BBEC0
	.4byte 0x0002BBFC
	.4byte 0x00002BA8
	.4byte 0x0000BF00
	.4byte 0x00000BFF
	.4byte 0x00000EAA
	.4byte 0x00002FF0
	.4byte 0x00003AAC
	.4byte 0x0000202C
	.4byte 0x0000002C
	.4byte 0x00002AAC
	.4byte 0x00003FF8
