/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_69_ref, "a", %progbits
	.global gFontgrp_69
gFontgrp_69:
	.4byte data_0857D48C + 0x48
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000CC00
	.4byte 0x0003BBC0
	.4byte 0x0003BBB0
	.4byte 0x0000FFBF
	.4byte 0x0000EAAB
	.4byte 0x0000EFFB
	.4byte 0x0000EC3B
	.4byte 0x0000EC3B
	.4byte 0x0000E70C
	.4byte 0x00003B00
	.4byte 0x000039C0
	.4byte 0x00000EB0
	.4byte 0x000003C0
	.4byte 0x00000000
