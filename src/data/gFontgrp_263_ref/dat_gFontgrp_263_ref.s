/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_263_ref, "a", %progbits
	.global gFontgrp_263
gFontgrp_263:
	.4byte data_0859A0AC + 0x168
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000B8000
	.4byte 0x000BBBFC
	.4byte 0x0002BBA8
	.4byte 0x000022C0
	.4byte 0x000002C0
	.4byte 0x0000B0B0
	.4byte 0x00002FFC
	.4byte 0x00000AEB
	.4byte 0x000000B2
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x00000AE0
	.4byte 0x00000F80
