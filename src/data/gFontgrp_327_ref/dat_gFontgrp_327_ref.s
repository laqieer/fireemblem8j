/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_327_ref, "a", %progbits
	.global gFontgrp_327
gFontgrp_327:
	.4byte frontier_df3_fontgrp_se_007_581A04 + 0x9D8
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C00
	.4byte 0x00003B00
	.4byte 0x00003AC0
	.4byte 0x00003AB0
	.4byte 0x00003AEC
	.4byte 0x0000EAFB
	.4byte 0x00003AAB
	.4byte 0x00003AFC
	.4byte 0x0000EAB0
	.4byte 0x00003FC0
	.4byte 0x00000000
