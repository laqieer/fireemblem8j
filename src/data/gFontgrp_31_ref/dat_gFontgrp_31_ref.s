/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_31_ref, "a", %progbits
	.global gFontgrp_31
gFontgrp_31:
	.4byte data_0857DCB4 + 0x1B0
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C30
	.4byte 0x00003BEC
	.4byte 0x00003BEC
	.4byte 0x0000E7EC
	.4byte 0x0000ECEC
	.4byte 0x0000ECEC
	.4byte 0x00039CEC
	.4byte 0x0003B03B
	.4byte 0x0003B03B
	.4byte 0x0003B03B
	.4byte 0x0000C00F
	.4byte 0x00000000
