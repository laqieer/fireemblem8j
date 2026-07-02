/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_55_ref, "a", %progbits
	.global gFontgrp_55
gFontgrp_55:
	.4byte frontier_df4_uistuff_004_57CF7C + 0x168
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003FF0
	.4byte 0x0000EAAC
	.4byte 0x0000EFF0
	.4byte 0x0000EC00
	.4byte 0x0000EC00
	.4byte 0x0000E700
	.4byte 0x00003B00
	.4byte 0x00003B00
	.4byte 0x0000FBFC
	.4byte 0x0003AAAB
	.4byte 0x0000FFFC
	.4byte 0x00000000
