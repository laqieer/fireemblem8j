/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_264_ref, "a", %progbits
	.global gFontgrp_264
gFontgrp_264:
	.4byte frontier_df4_uistuff_013_5987EC + 0x288
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000B0
	.4byte 0x000000B0
	.4byte 0x00000BB0
	.4byte 0x000002FF
	.4byte 0x000000BA
	.4byte 0x00003FB0
	.4byte 0x00002A2C
	.4byte 0x0000002C
	.4byte 0x0000002C
	.4byte 0x0000002E
	.4byte 0x000002CB
	.4byte 0x00002ACB
	.4byte 0x00003F8B
