/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_347_ref, "a", %progbits
	.global gFontgrp_347
gFontgrp_347:
	.4byte frontier_df3_fontgrp_se_007_581A04 + 0x948
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x000033F0
	.4byte 0x0000EEAC
	.4byte 0x0000EBEB
	.4byte 0x0000ECEB
	.4byte 0x000030EB
	.4byte 0x00000FAC
	.4byte 0x00003AF0
	.4byte 0x0000EB0C
	.4byte 0x0000EB3B
	.4byte 0x0000EBFB
	.4byte 0x00003AAB
	.4byte 0x00000FFC
	.4byte 0x00000000
