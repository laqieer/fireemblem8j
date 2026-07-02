/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_332_ref, "a", %progbits
	.global gFontgrp_332
gFontgrp_332:
	.4byte frontier_df3_fontgrp_se_000_57E884 + 0x510
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FC0
	.4byte 0x00003AB0
	.4byte 0x0000EBEC
	.4byte 0x0000EBEB
	.4byte 0x0000EBEB
	.4byte 0x0000EAAC
	.4byte 0x0000EBF0
	.4byte 0x00003BF0
	.4byte 0x00000EAC
	.4byte 0x000003F0
	.4byte 0x00000000
