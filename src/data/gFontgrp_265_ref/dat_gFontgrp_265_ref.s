/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_265_ref, "a", %progbits
	.global gFontgrp_265
gFontgrp_265:
	.4byte frontier_df4_uistuff_016_59A2EC + 0x1B0
	.4byte 0x00000B82
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000B80B0
	.4byte 0x000BB0B0
	.4byte 0x0002B0B0
	.4byte 0x00002BF0
	.4byte 0x000002BF
	.4byte 0x000000BA
	.4byte 0x00003F2C
	.4byte 0x00002A2C
	.4byte 0x0000002C
	.4byte 0x0000002E
	.4byte 0x000002CB
	.4byte 0x000002CB
	.4byte 0x00002ACB
	.4byte 0x00003F8B
