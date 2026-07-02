/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_201_ref, "a", %progbits
	.global gFontgrp_201
gFontgrp_201:
	.4byte frontier_df4_uistuff_019_59BA8C + 0x4C8
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000002C
	.4byte 0x000002F0
	.4byte 0x00000B80
	.4byte 0x00002E00
	.4byte 0x00000000
	.4byte 0x000000BC
	.4byte 0x00000BE0
	.4byte 0x00000E00
	.4byte 0x00000000
	.4byte 0x0000002F
	.4byte 0x000002F8
	.4byte 0x00002F80
	.4byte 0x00003800
