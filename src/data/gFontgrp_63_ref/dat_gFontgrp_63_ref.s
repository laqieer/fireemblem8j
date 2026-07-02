/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_63_ref, "a", %progbits
	.global gFontgrp_63
gFontgrp_63:
	.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x870
	.4byte 0x00000882
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00003CFC
	.4byte 0x0000EBAB
	.4byte 0x0000EAAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0000EBAC
	.4byte 0x0003ABAC
	.4byte 0x0000FCF0
	.4byte 0x00000000
