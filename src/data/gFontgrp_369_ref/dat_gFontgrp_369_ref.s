/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_369_ref, "a", %progbits
	.global gFontgrp_369
gFontgrp_369:
	.4byte frontier_df4_uistuff_012_596F74 + 0x1B0
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000B0
	.4byte 0x00002FFF
	.4byte 0x00002EAB
	.4byte 0x00002C0B
	.4byte 0x00002E0B
	.4byte 0x00000B80
	.4byte 0x000002E0
	.4byte 0x000000BC
