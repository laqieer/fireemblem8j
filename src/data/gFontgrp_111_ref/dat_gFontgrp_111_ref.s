/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_111_ref, "a", %progbits
	.global gFontgrp_111
gFontgrp_111:
	.4byte frontier_df3_fontgrp_se_003_57FD0C + 0x1B0
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000CC00
	.4byte 0x0003BBC0
	.4byte 0x0003BBB0
	.4byte 0x0000CFBC
	.4byte 0x00003AAB
	.4byte 0x0000FFBC
	.4byte 0x0003ABEC
	.4byte 0x0003BCEC
	.4byte 0x0000C0EC
	.4byte 0x0000033B
	.4byte 0x0000FEFB
	.4byte 0x0003AB3B
	.4byte 0x0000FC0C
	.4byte 0x00000000
