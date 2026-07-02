/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_345_ref, "a", %progbits
	.global gFontgrp_345
gFontgrp_345:
	.4byte frontier_df3_fontgrp_se_000_57E884 + 0x8B8
	.4byte 0x00000881
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003000
	.4byte 0x0000EC00
	.4byte 0x0000EC00
	.4byte 0x00003B00
	.4byte 0x00003B00
	.4byte 0x00000EC0
	.4byte 0x00000EC0
	.4byte 0x000003B0
	.4byte 0x000003B0
	.4byte 0x000000C0
	.4byte 0x00000000
