/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_75_ref, "a", %progbits
	.global gFontgrp_75
gFontgrp_75:
	.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x510
	.4byte 0x00000682
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FFC
	.4byte 0x00003AAB
	.4byte 0x00003AFC
	.4byte 0x00003AC0
	.4byte 0x00000EB0
	.4byte 0x00000EB0
	.4byte 0x000003AC
	.4byte 0x00000FAC
	.4byte 0x00003AAB
	.4byte 0x00000FFC
	.4byte 0x00000000
