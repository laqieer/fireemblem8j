/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_43_ref, "a", %progbits
	.global gFontgrp_43
gFontgrp_43:
	.4byte frontier_df3_fontgrp_se_005_580B1C + 0x48
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x00000EC0
	.4byte 0x0000FEFC
	.4byte 0x0003AAAB
	.4byte 0x0000FEFC
	.4byte 0x0000EEEC
	.4byte 0x0000EEEC
	.4byte 0x00039EE7
	.4byte 0x0003BEDB
	.4byte 0x0003BEFB
	.4byte 0x0000CECC
	.4byte 0x00000300
	.4byte 0x00000000
