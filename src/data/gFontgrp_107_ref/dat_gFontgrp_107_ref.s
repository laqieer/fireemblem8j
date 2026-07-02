/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_107_ref, "a", %progbits
	.global gFontgrp_107
gFontgrp_107:
	.4byte frontier_df3_fontgrp_se_000_57E884 + 0x798
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000CC00
	.4byte 0x0003BB30
	.4byte 0x0003BBEC
	.4byte 0x0000CCEC
	.4byte 0x0000FBEC
	.4byte 0x0003AAAB
	.4byte 0x0000FBEC
	.4byte 0x00003BEC
	.4byte 0x00003AEC
	.4byte 0x00000FEC
	.4byte 0x00003FEC
	.4byte 0x0000EAB0
	.4byte 0x00003FC0
	.4byte 0x00000000
