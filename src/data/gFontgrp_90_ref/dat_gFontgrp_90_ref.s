/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_90_ref, "a", %progbits
	.global gFontgrp_90
gFontgrp_90:
	.4byte frontier_df3_fontgrp_se_005_580B1C + 0x708
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000000C0
	.4byte 0x000003B0
	.4byte 0x00000FB0
	.4byte 0x00003BBC
	.4byte 0x0000EDAB
	.4byte 0x0000EEEC
	.4byte 0x00039EEC
	.4byte 0x0003BEEC
	.4byte 0x0000CEDB
	.4byte 0x00000EFB
	.4byte 0x000003BB
	.4byte 0x000000CC
	.4byte 0x00000000
