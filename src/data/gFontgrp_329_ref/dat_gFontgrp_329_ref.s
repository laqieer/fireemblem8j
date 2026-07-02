/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_329_ref, "a", %progbits
	.global gFontgrp_329
gFontgrp_329:
	.4byte frontier_df3_fontgrp_se_000_57E884 + 0x1B0
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FC0
	.4byte 0x00003AB0
	.4byte 0x00000FEC
	.4byte 0x00000FEC
	.4byte 0x00003AAB
	.4byte 0x0000EBEB
	.4byte 0x0000EBEB
	.4byte 0x00003BEB
	.4byte 0x00000EAC
	.4byte 0x000003F0
	.4byte 0x00000000
