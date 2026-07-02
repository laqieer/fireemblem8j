/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_91_ref, "a", %progbits
	.global gFontgrp_91
gFontgrp_91:
	.4byte frontier_df3_fontgrp_se_006_5814AC + 0x438
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000CC00
	.4byte 0x0003BBC0
	.4byte 0x0003BBB0
	.4byte 0x0000FFB0
	.4byte 0x0000EFBC
	.4byte 0x0000EDAB
	.4byte 0x0000EEEC
	.4byte 0x00039EEC
	.4byte 0x0003BEEC
	.4byte 0x0000CEDB
	.4byte 0x00000EFB
	.4byte 0x000003BB
	.4byte 0x000000CC
	.4byte 0x00000000
