/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_209_ref, "a", %progbits
	.global gFontgrp_209
gFontgrp_209:
	.4byte frontier_df4_uistuff_012_596F74 + 0x1290
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000BFC
	.4byte 0x00000BA8
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00000B00
	.4byte 0x00003FFF
	.4byte 0x00002AAA
