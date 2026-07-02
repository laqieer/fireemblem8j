/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_60_ref, "a", %progbits
	.global gFontgrp_60
gFontgrp_60:
	.4byte frontier_df4_uistuff_004_57CF7C + 0x2D0
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x00000EF0
	.4byte 0x00000EEC
	.4byte 0x00000EEC
	.4byte 0x0000CEEC
	.4byte 0x0003BEEC
	.4byte 0x00039EEC
	.4byte 0x0000EEEC
	.4byte 0x0000E6EC
	.4byte 0x00003ADB
	.4byte 0x00000EFB
	.4byte 0x0000030C
	.4byte 0x00000000
