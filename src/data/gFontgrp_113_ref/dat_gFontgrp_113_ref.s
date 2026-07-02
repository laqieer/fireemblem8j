/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_113_ref, "a", %progbits
	.global gFontgrp_113
gFontgrp_113:
	.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x678
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FC0
	.4byte 0x00003AB0
	.4byte 0x0000EEEC
	.4byte 0x00039EDB
	.4byte 0x0003BEFB
	.4byte 0x0003BE7B
	.4byte 0x0003B3BB
	.4byte 0x0003B39B
	.4byte 0x0000ECEC
	.4byte 0x00003B30
	.4byte 0x00000C00
	.4byte 0x00000000
