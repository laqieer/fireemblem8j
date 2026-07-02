/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_232_ref, "a", %progbits
	.global gFontgrp_232
gFontgrp_232:
	.4byte frontier_df4_uistuff_020_59BFE4 + 0x288
	.4byte 0x00000B8E
	.4byte 0x00000000
	.4byte 0x0000B02C
	.4byte 0x0000B02C
	.4byte 0x0002FF2C
	.4byte 0x0000B0BF
	.4byte 0x0000B02C
	.4byte 0x000BFFEC
	.4byte 0x0002C02C
	.4byte 0x0002C0BC
	.4byte 0x000BFFEF
	.4byte 0x0002C02C
	.4byte 0x0002CB2C
	.4byte 0x0002CB2C
	.4byte 0x0002EC2C
	.4byte 0x0002C02C
	.4byte 0x0000B02F
