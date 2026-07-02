/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */
	.section .rodata.dat_gFontgrp_72_ref, "a", %progbits
	.global gFontgrp_72
gFontgrp_72:
	.4byte frontier_df3_fontgrp_se_001_57F604 + 0x48
	.4byte 0x00000782
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000333C
	.4byte 0x0000EEEB
	.4byte 0x0000EEEB
	.4byte 0x0000EEEB
	.4byte 0x0000EEEB
	.4byte 0x0000EEEB
	.4byte 0x0000EEEC
	.4byte 0x0000EAAC
	.4byte 0x00003BB0
	.4byte 0x00003CC0
	.4byte 0x00000000
