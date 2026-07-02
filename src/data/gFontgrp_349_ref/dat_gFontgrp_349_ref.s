/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_349_ref, "a", %progbits
	.global gFontgrp_349
gFontgrp_349:
	.4byte frontier_df3_fontgrp_se_007_581A04 + 0xBD0
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000FFC
	.4byte 0x00003AAB
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x00003AAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x00003BAC
	.4byte 0x00000EAB
	.4byte 0x000003FC
	.4byte 0x00000000
