/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_53_ref, "a", %progbits
	.global gFontgrp_53
gFontgrp_53:
	.4byte frontier_df4_uistuff_004_57CF7C + 0xD8
	.4byte 0x00000883
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000030
	.4byte 0x0000C0EC
	.4byte 0x0003BCEC
	.4byte 0x0003AB6C
	.4byte 0x00039E9C
	.4byte 0x0000EFAB
	.4byte 0x0000EFBC
	.4byte 0x000033B0
	.4byte 0x00000E70
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x00000300
	.4byte 0x00000000
