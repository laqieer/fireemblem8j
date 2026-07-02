/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_224_ref, "a", %progbits
	.global gFontgrp_224
gFontgrp_224:
	.4byte frontier_df4_uistuff_014_598E64 + 0xB40
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000B0B
	.4byte 0x00000BAB
	.4byte 0x00000BFC
	.4byte 0x00000000
