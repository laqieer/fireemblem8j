/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_112_ref, "a", %progbits
	.global gFontgrp_112
gFontgrp_112:
	.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x9D8
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000300
	.4byte 0x00003EC0
	.4byte 0x0000EEFC
	.4byte 0x0000DAAB
	.4byte 0x00003FBC
	.4byte 0x0000EAB0
	.4byte 0x00039FAC
	.4byte 0x0003B0EC
	.4byte 0x0003B030
	.4byte 0x0000EF00
	.4byte 0x00003AC0
	.4byte 0x00000F00
	.4byte 0x00000000
